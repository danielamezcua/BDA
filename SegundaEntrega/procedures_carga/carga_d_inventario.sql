CREATE OR REPLACE PROCEDURE ACTUALIZA_INVENTARIO
AS
BEGIN
INSERT INTO D_Inventario
        SELECT seq_D_Inventario.nextval, color, tipo, precio_lista, status, modelo, ano, id_inventario, id_catalogo
    	FROM (
                SELECT i.color, i.tipo, i.precio_lista, i.status, c.modelo, c.ano, i.id_inventario, c.id_catalogo
                FROM Inventario@mty i, Catalogo@mty c  
                WHERE i.id_catalogo = c.id_catalogo
                
                UNION
                
                SELECT i.color, i.tipo, i.precio_lista, i.status, c.modelo, c.ano, i.id_inventario, c.id_catalogo
                FROM Inventario@hmo i, Catalogo@hmo c  
                WHERE i.id_catalogo = c.id_catalogo
                
                UNION
                
                SELECT i.color, i.tipo, i.precio_lista, i.status, c.modelo, c.ano, i.id_inventario, c.id_catalogo
                FROM Inventario@quro i, Catalogo@quro c  
                WHERE i.id_catalogo = c.id_catalogo
                
                UNION
                
                SELECT i.color, i.tipo, i.precio_lista, i.status, c.modelo, c.ano, i.id_inventario, c.id_catalogo
                FROM Inventario@tg i, Catalogo@tg c  
                WHERE i.id_catalogo = c.id_catalogo                
             )
        WHERE id_inventario NOT IN (SELECT id_inventario FROM D_Inventario);
END ACTUALIZA_INVENTARIO;