CREATE OR REPLACE PROCEDURE ACTUALIZA_VENTA_VEHICULO
(
  	FECHAINICIAL IN DATE,
    	FECHAFINAL IN DATE
) 
AS
    	v_fecha_inicial date;
    	v_fecha_final date;
    	v_id_d_inventario number;
    	v_id_d_tiempo number;
    	v_ingresos_totales number(10);
    	v_cantidad_ventas number(10);

cursor c_tiempo (v_fecha_inicial  IN DATE, v_fecha_final IN DATE) is
    	SELECT id_d_tiempo
    	FROM D_Tiempo
    	WHERE fecha BETWEEN trunc(v_fecha_inicial) AND trunc(v_fecha_final);

cursor c_ventas (v_fecha_inicial  IN DATE, v_fecha_final IN DATE) is
        SELECT di.id_d_inventario, dt.id_d_tiempo, sum(v.precio), count(*) 
    	FROM
        (
			SELECT * FROM Venta@mty
			UNION
			SELECT * FROM Venta@hmo
			UNION
			SELECT * FROM Venta@quro
			UNION
			SELECT * FROM Venta@tg
		) v
   		LEFT JOIN D_Inventario di ON v.id_inventario = di.id_inventario
		LEFT JOIN D_Tiempo dt ON trunc(v.fecha) = trunc(dt.fecha)
        WHERE trunc(v.fecha) BETWEEN trunc(v_fecha_inicial) AND trunc(v_fecha_final)
		GROUP BY (dt.id_d_tiempo, di.id_d_inventario);

BEGIN
    	v_fecha_inicial := FECHAINICIAL;
    	v_fecha_final := FECHAFINAL;

    	OPEN c_tiempo (v_fecha_inicial, v_fecha_final);
    	FETCH c_tiempo INTO v_id_d_tiempo;
    	WHILE c_tiempo%FOUND 
        LOOP
            DELETE FROM H_Venta_Vehiculo
            WHERE id_d_tiempo = v_id_d_tiempo;
        	FETCH c_tiempo INTO v_id_d_tiempo;
    	END LOOP;
        CLOSE c_tiempo;

    	OPEN c_ventas (v_fecha_inicial, v_fecha_final);
    	FETCH c_ventas INTO v_id_d_inventario, v_id_d_tiempo, v_ingresos_totales, v_cantidad_ventas;
    	WHILE c_ventas%FOUND 
        LOOP
            INSERT INTO H_Venta_Vehiculo VALUES(seq_H_Venta_Vehiculo.nextval, v_id_d_inventario, v_id_d_tiempo, v_ingresos_totales, v_cantidad_ventas);
            FETCH c_ventas INTO v_id_d_inventario, v_id_d_tiempo, v_ingresos_totales, v_cantidad_ventas;    	
            END LOOP;
    	CLOSE c_ventas;
END ACTUALIZA_VENTA_VEHICULO;