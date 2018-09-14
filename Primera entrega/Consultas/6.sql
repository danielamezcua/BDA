
--MTY
CREATE VIEW VEHICULOS_DEFECTUOSOS_GLOBAL AS
(
SELECT c.modelo, idef.id_tipo_defecto, d.descripcion
FROM inventario i, inventario_defecto idef, defecto d, catalogo c
WHERE i.id_inventario = idef.id_inventario AND idef.id_tipo_defecto = d.id_tipo_defecto AND i.id_catalogo = c.id_catalogo
)
UNION
(
SELECT c.modelo, idef.id_tipo_defecto, d.descripcion
FROM inventario@hmo i, inventario_defecto@hmo idef, defecto d, catalogo c
WHERE i.id_inventario = idef.id_inventario AND idef.id_tipo_defecto = d.id_tipo_defecto AND i.id_catalogo = c.id_catalogo
)
UNION
(
SELECT c.modelo, idef.id_tipo_defecto, d.descripcion
FROM inventario@quro i, inventario_defecto@quro idef, defecto d, catalogo c
WHERE i.id_inventario = idef.id_inventario AND idef.id_tipo_defecto = d.id_tipo_defecto AND i.id_catalogo = c.id_catalogo
)
UNION
(
SELECT c.modelo, idef.id_tipo_defecto, d.descripcion
FROM inventario@tg i, inventario_defecto@tg idef, defecto d, catalogo c
WHERE i.id_inventario = idef.id_inventario AND idef.id_tipo_defecto = d.id_tipo_defecto AND i.id_catalogo = c.id_catalogo
);

CREATE OR REPLACE VIEW MODELO_MENOS_DEFECTOS AS

    SELECT *
    FROM (SELECT modelo, COUNT(*) as "DEFECTOS"
        FROM defectos_ensambladora_global
        WHERE id_ensambladora = 1
        GROUP BY nombre, modelo
        ORDER BY defectos ASC) suppliers2
    WHERE rownum = 1
    ORDER BY rownum;


---------------------------------------------------------------------------------------------
--HMO
CREATE VIEW VEHICULOS_DEFECTUOSOS_GLOBAL AS
(
SELECT c.modelo, idef.id_tipo_defecto, d.descripcion
FROM inventario i, inventario_defecto idef, defecto d, catalogo c
WHERE i.id_inventario = idef.id_inventario AND idef.id_tipo_defecto = d.id_tipo_defecto AND i.id_catalogo = c.id_catalogo
)
UNION
(
SELECT c.modelo, idef.id_tipo_defecto, d.descripcion
FROM inventario@mty i, inventario_defecto@mty idef, defecto d, catalogo c
WHERE i.id_inventario = idef.id_inventario AND idef.id_tipo_defecto = d.id_tipo_defecto AND i.id_catalogo = c.id_catalogo
)
UNION
(
SELECT c.modelo, idef.id_tipo_defecto, d.descripcion
FROM inventario@quro i, inventario_defecto@quro idef, defecto d, catalogo c
WHERE i.id_inventario = idef.id_inventario AND idef.id_tipo_defecto = d.id_tipo_defecto AND i.id_catalogo = c.id_catalogo
)
UNION
(
SELECT c.modelo, idef.id_tipo_defecto, d.descripcion
FROM inventario@tg i, inventario_defecto@tg idef, defecto d, catalogo c
WHERE i.id_inventario = idef.id_inventario AND idef.id_tipo_defecto = d.id_tipo_defecto AND i.id_catalogo = c.id_catalogo
);

CREATE OR REPLACE VIEW MODELO_MENOS_DEFECTOS AS

    SELECT *
    FROM (SELECT modelo, COUNT(*) as "DEFECTOS"
        FROM defectos_ensambladora_global
        WHERE id_ensambladora = 1
        GROUP BY nombre, modelo
        ORDER BY defectos ASC) suppliers2
    WHERE rownum = 1
    ORDER BY rownum;
    
---------------------------------------------------------------------------------------------
--QRO
CREATE VIEW VEHICULOS_DEFECTUOSOS_GLOBAL AS
(
SELECT c.modelo, idef.id_tipo_defecto, d.descripcion
FROM inventario i, inventario_defecto idef, defecto d, catalogo c
WHERE i.id_inventario = idef.id_inventario AND idef.id_tipo_defecto = d.id_tipo_defecto AND i.id_catalogo = c.id_catalogo
)
UNION
(
SELECT c.modelo, idef.id_tipo_defecto, d.descripcion
FROM inventario@hmo i, inventario_defecto@hmo idef, defecto d, catalogo c
WHERE i.id_inventario = idef.id_inventario AND idef.id_tipo_defecto = d.id_tipo_defecto AND i.id_catalogo = c.id_catalogo
)
UNION
(
SELECT c.modelo, idef.id_tipo_defecto, d.descripcion
FROM inventario@mty i, inventario_defecto@mty idef, defecto d, catalogo c
WHERE i.id_inventario = idef.id_inventario AND idef.id_tipo_defecto = d.id_tipo_defecto AND i.id_catalogo = c.id_catalogo
)
UNION
(
SELECT c.modelo, idef.id_tipo_defecto, d.descripcion
FROM inventario@tg i, inventario_defecto@tg idef, defecto d, catalogo c
WHERE i.id_inventario = idef.id_inventario AND idef.id_tipo_defecto = d.id_tipo_defecto AND i.id_catalogo = c.id_catalogo
);

CREATE OR REPLACE VIEW MODELO_MENOS_DEFECTOS AS

    SELECT *
    FROM (SELECT modelo, COUNT(*) as "DEFECTOS"
        FROM defectos_ensambladora_global
        WHERE id_ensambladora = 1
        GROUP BY nombre, modelo
        ORDER BY defectos ASC) suppliers2
    WHERE rownum = 1
    ORDER BY rownum;
    
    
---------------------------------------------------------------------------------------------
--TG
CREATE VIEW VEHICULOS_DEFECTUOSOS_GLOBAL AS
(
SELECT c.modelo, idef.id_tipo_defecto, d.descripcion
FROM inventario i, inventario_defecto idef, defecto d, catalogo c
WHERE i.id_inventario = idef.id_inventario AND idef.id_tipo_defecto = d.id_tipo_defecto AND i.id_catalogo = c.id_catalogo
)
UNION
(
SELECT c.modelo, idef.id_tipo_defecto, d.descripcion
FROM inventario@hmo i, inventario_defecto@hmo idef, defecto d, catalogo c
WHERE i.id_inventario = idef.id_inventario AND idef.id_tipo_defecto = d.id_tipo_defecto AND i.id_catalogo = c.id_catalogo
)
UNION
(
SELECT c.modelo, idef.id_tipo_defecto, d.descripcion
FROM inventario@quro i, inventario_defecto@quro idef, defecto d, catalogo c
WHERE i.id_inventario = idef.id_inventario AND idef.id_tipo_defecto = d.id_tipo_defecto AND i.id_catalogo = c.id_catalogo
)
UNION
(
SELECT c.modelo, idef.id_tipo_defecto, d.descripcion
FROM inventario@mty i, inventario_defecto@mty idef, defecto d, catalogo c
WHERE i.id_inventario = idef.id_inventario AND idef.id_tipo_defecto = d.id_tipo_defecto AND i.id_catalogo = c.id_catalogo
);

CREATE OR REPLACE VIEW MODELO_MENOS_DEFECTOS AS

    SELECT *
    FROM (SELECT modelo, COUNT(*) as "DEFECTOS"
        FROM defectos_ensambladora_global
        WHERE id_ensambladora = 1
        GROUP BY nombre, modelo
        ORDER BY defectos ASC) suppliers2
    WHERE rownum = 1
    ORDER BY rownum;
    
    
    