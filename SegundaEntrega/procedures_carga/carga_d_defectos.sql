CREATE OR REPLACE PROCEDURE ACTUALIZA_DEFECTOS
AS
BEGIN
INSERT INTO D_DEFECTO
    SELECT seq_D_DEFECTO.nextval, descripcion, id_tipo_defecto
    FROM 
    (
      SELECT descripcion, id_tipo_defecto FROM defecto@QURO
      UNION
      SELECT descripcion, id_tipo_defecto FROM defecto@HMO
      UNION
      SELECT descripcion, id_tipo_defecto FROM defecto@MTY
      UNION
      SELECT descripcion, id_tipo_defecto FROM defecto@TG
    )
    WHERE id_tipo_defecto NOT IN (SELECT id_tipo_defecto FROM D_DEFECTO);
END ACTUALIZA_DEFECTOS;

execute ACTUALIZA_DEFECTOS;