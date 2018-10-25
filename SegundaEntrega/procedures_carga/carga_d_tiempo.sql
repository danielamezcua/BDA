CREATE OR REPLACE PROCEDURE ACTUALIZA_D_TIEMPO
(
  FECHA_INICIAL IN DATE,
 	FECHA_FINAL IN DATE
)
AS
   	v_fechaInicial DATE;
    v_fechaFinal DATE;
   	v_numDias NUMBER;
    v_anio VARCHAR2(4);
  	v_mes VARCHAR2(10);
  	v_dia NUMBER;
    v_nombreDia VARCHAR2(10);
BEGIN
    	v_fechaInicial := FECHA_INICIAL;
    	v_fechaFinal := FECHA_FINAL;
    	v_numDias := v_fechaFinal - v_fechaInicial;

    	FOR dia IN 1..v_numDias
    	LOOP
        		v_anio := to_char(v_fechaInicial, 'YYYY');
        		v_mes := to_char(v_fechaInicial, 'MONTH');
        		v_dia := to_number(to_char(v_fechaInicial,'DD'));

        		INSERT INTO D_Tiempo VALUES (dia, v_fechaInicial, v_anio, v_mes, v_dia);
        		COMMIT;
        		v_fechaInicial := v_fechaInicial+1;
    	END LOOP;
END ACTUALIZA_D_TIEMPO;

execute ACTUALIZA_D_TIEMPO('01/01/1960', '12/12/2018');
