CREATE OR REPLACE PROCEDURE ACTUALIZA_VENTA_VENDEDOR
(
	FECHAINICIAL IN DATE,
	FECHAFINAL IN DATE
)
AS
	v_fecha_inicial date;
	v_fecha_final date;
	v_id_d_tiempo number;
	v_id_d_vendedor number;
	v_ventas_total number(10);
	v_comision_total number(10);
	v_numero_ventas number(10);
	cursor c_tiempo(v_fecha_inicial IN DATE, v_fecha_final IN DATE) is
		SELECT id_d_tiempo
		FROM D_Tiempo
		WHERE fecha BETWEEN trunc(v_fecha_inicial) AND trunc(v_fecha_final);

	cursor c_ventas_vendedor(v_fecha_inicial IN DATE, v_fecha_final IN DATE) is
		SELECT dv.id_d_vendedor,dt.id_d_tiempo, SUM(v.precio), SUM(v.comision), COUNT(*)
		FROM 
		(
			SELECT * FROM Venta@QURO
			UNION
			SELECT * FROM Venta@HMO
			UNION
			SELECT * FROM Venta@TG
			UNION
			SELECT * FROM Venta@MTY
		) v
		LEFT JOIN D_Tiempo dt ON trunc(v.fecha) = dt.fecha
		LEFT JOIN D_Vendedor dv ON v.id_vendedor = dv.id_vendedor
		WHERE trunc(v.fecha) BETWEEN trunc(v_fecha_inicial) AND trunc(v_fecha_final)
		GROUP BY (dt.id_d_tiempo, dv.id_d_vendedor);
BEGIN
	/* Borrar registros a actualizar */
	v_fecha_inicial := FECHAINICIAL;
	v_fecha_final := FECHAFINAL;

	OPEN c_tiempo(v_fecha_inicial, v_fecha_final);
	FETCH c_tiempo INTO v_id_d_tiempo;
	WHILE c_tiempo%FOUND
	LOOP
		DELETE FROM H_VENTA_VENDEDOR
		WHERE id_d_tiempo = v_id_d_tiempo;
		FETCH c_tiempo INTO v_id_d_tiempo;
	END LOOP;
	close c_tiempo;

	/* Insertar nuevos registros */
	OPEN c_ventas_vendedor(v_fecha_inicial, v_fecha_final);
	FETCH c_ventas_vendedor INTO v_id_d_vendedor, v_id_d_tiempo, v_ventas_total, v_comision_total, v_numero_ventas;
	WHILE c_ventas_vendedor%FOUND
	LOOP
		INSERT INTO H_VENTA_VENDEDOR VALUES (seq_h_venta_vendedor.nextval, v_id_d_vendedor, v_id_d_tiempo, v_ventas_total, v_comision_total, v_numero_ventas);
		FETCH c_ventas_vendedor INTO v_id_d_vendedor, v_id_d_tiempo, v_ventas_total, v_comision_total, v_numero_ventas;
	END LOOP;
END ACTUALIZA_VENTA_VENDEDOR;

execute ACTUALIZA_VENTA_VENDEDOR('01/01/2000', '12/12/2018');
commit;