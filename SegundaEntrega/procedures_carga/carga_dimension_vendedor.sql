CREATE OR REPLACE PROCEDURE ACTUALIZA_VENDEDOR
AS
BEGIN
      INSERT INTO D_Vendedor 
      (
        SELECT seq_d_vendedor.nextval, nombre, id_vendedor
        FROM 
        (
          SELECT nombre, id_vendedor FROM Vendedor@QURO
          UNION
          SELECT nombre, id_vendedor FROM Vendedor@HMO
          UNION
          SELECT nombre, id_vendedor FROM Vendedor@MTY
          UNION
          SELECT nombre, id_vendedor FROM Vendedor@TG
        )
        WHERE id_vendedor NOT IN (SELECT id_vendedor FROM D_Vendedor)
      );
END ACTUALIZA_VENDEDOR;
COMMIT;