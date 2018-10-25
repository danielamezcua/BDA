/*
H_VEHICULO_DEFECTOS
(
id_h_defecto		number(10)	not null		pk
id_d_defecto		number(10)	not null		fk, index
id_d_tiempo		number(10)	not null		fk, index
id_d_inventario		number(10)	not null		fk, index
total_defectos		number(10)	not null		index
)
*/

CREATE OR REPLACE PROCEDURE ACTUALIZA_DEFECTOS_VEHICULO
(
	FECHAINICIAL IN DATE,
	FECHAFINAL IN DATE
)
AS
	v_fecha_inicial date;
	v_fecha_final date;
	v_id_d_tiempo number;
	v_id_d_defecto number;
  v_id_d_inventario number;
	v_total_defectos number(10);
	cursor c_tiempo(v_fecha_inicial IN DATE, v_fecha_final IN DATE) is
		SELECT id_d_tiempo
		FROM D_Tiempo
		WHERE fecha BETWEEN trunc(v_fecha_inicial) AND trunc(v_fecha_final);

	cursor c_defectos_inventario(v_fecha_inicial IN DATE, v_fecha_final IN DATE) is
		SELECT dt.id_d_tiempo, di.id_inventario, dd.id_tipo_defecto, count(1)
		FROM 
		(
			SELECT * FROM INVENTARIO_DEFECTO@QURO
			UNION
			SELECT * FROM INVENTARIO_DEFECTO@HMO
			UNION
			SELECT * FROM INVENTARIO_DEFECTO@MTY
			UNION
			SELECT * FROM INVENTARIO_DEFECTO@TG
		) v
		LEFT JOIN D_Tiempo dt ON trunc(v.fecha_ingreso) = dt.fecha
		LEFT JOIN D_Inventario di ON v.id_inventario = di.id_inventario
    LEFT JOIN D_Defecto dd ON v.id_tipo_defecto = dd.id_tipo_defecto
		WHERE trunc(v.fecha_ingreso) BETWEEN trunc(v_fecha_inicial) AND trunc(v_fecha_final) 
    group by dt.id_d_tiempo, di.id_inventario, dd.id_tipo_defecto;
BEGIN
	/* Borrar registros a actualizar */
	v_fecha_inicial := FECHAINICIAL;
	v_fecha_final := FECHAFINAL;

	OPEN c_tiempo(v_fecha_inicial, v_fecha_final);
	FETCH c_tiempo INTO v_id_d_tiempo;
	WHILE c_tiempo%FOUND
	LOOP
		DELETE FROM H_VEHICULO_DEFECTOS
		WHERE id_d_tiempo = v_id_d_tiempo;
		FETCH c_tiempo INTO v_id_d_tiempo;
	END LOOP;
	close c_tiempo;

	/* Insertar nuevos registros */
	OPEN c_defectos_inventario(v_fecha_inicial, v_fecha_final);
	FETCH c_defectos_inventario INTO v_id_d_defecto, v_id_d_defecto, v_id_d_inventario, v_total_defectos;
	WHILE c_defectos_inventario%FOUND
	LOOP
		INSERT INTO H_VEHICULO_DEFECTOS VALUES (seq_h_vehiculo_defectos.nextval, v_id_d_defecto, v_id_d_defecto, v_id_d_inventario, v_total_defectos);
		FETCH c_defectos_inventario INTO v_id_d_defecto, v_id_d_defecto, v_id_d_inventario, v_total_defectos;
	END LOOP;
END ACTUALIZA_DEFECTOS_VEHICULO;

