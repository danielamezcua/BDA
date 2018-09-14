--MTY
CREATE OR REPLACE VIEW DEFECTOS_ENSAMBLADORA_GLOBAL AS
(
    (
    SELECT e.id_ensambladora, e.nombre, c.modelo, idef.id_tipo_defecto, d.descripcion
    FROM ensambladora e, inventario i, inventario_defecto idef, defecto d, catalogo c
    WHERE e.id_ensambladora = i.id_ensambladora AND i.id_inventario = idef.id_inventario AND idef.id_tipo_defecto = d.id_tipo_defecto AND i.id_catalogo = c.id_catalogo
    )
    UNION
    (
    SELECT e.id_ensambladora, e.nombre, c.modelo, idef.id_tipo_defecto, d.descripcion
    FROM ensambladora e, inventario@hmo i, inventario_defecto@hmo idef, defecto d, catalogo@hmo c
    WHERE e.id_ensambladora = i.id_ensambladora AND i.id_inventario = idef.id_inventario AND idef.id_tipo_defecto = d.id_tipo_defecto AND i.id_catalogo = c.id_catalogo
    )
    UNION
    (
    SELECT e.id_ensambladora, e.nombre, c.modelo, idef.id_tipo_defecto, d.descripcion
    FROM ensambladora e, inventario@quro i, inventario_defecto@quro idef, defecto d, catalogo@quro c
    WHERE e.id_ensambladora = i.id_ensambladora AND i.id_inventario = idef.id_inventario AND idef.id_tipo_defecto = d.id_tipo_defecto AND i.id_catalogo = c.id_catalogo
    )
    UNION
    (
    SELECT e.id_ensambladora, e.nombre, c.modelo, idef.id_tipo_defecto, d.descripcion
    FROM ensambladora e, inventario@tg i, inventario_defecto@tg idef, defecto d, catalogo@tg c
    WHERE e.id_ensambladora = i.id_ensambladora AND i.id_inventario = idef.id_inventario AND idef.id_tipo_defecto = d.id_tipo_defecto AND i.id_catalogo = c.id_catalogo
    )
);

CREATE OR REPLACE VIEW DEFECTOS_MODELO_NORTE AS
(
    (
    SELECT nombre as "ENSAMBLADORA", modelo, COUNT(id_ensambladora) as "DEFECTOS"
    FROM defectos_ensambladora_global
    WHERE id_ensambladora = 1
    GROUP BY nombre, modelo
    )
);

CREATE OR REPLACE VIEW DEFECTOS_MODELO_CENTRO AS
(
    (
    SELECT nombre as "ENSAMBLADORA", modelo, COUNT(id_ensambladora) as "DEFECTOS"
    FROM defectos_ensambladora_global
    WHERE id_ensambladora = 2
    GROUP BY nombre, modelo
    )
);

CREATE OR REPLACE VIEW DEFECTOS_MODELO_SUR AS
(
    (
    SELECT nombre as "ENSAMBLADORA", modelo, COUNT(id_ensambladora) as "DEFECTOS"
    FROM defectos_ensambladora_global
    WHERE id_ensambladora = 3
    GROUP BY nombre, modelo
    )
);

CREATE OR REPLACE VIEW DEFECTOS_MODELO_ENSAMBLADORA AS
(
    (
    SELECT *
    FROM defectos_modelo_norte
    )
    UNION
    (
    SELECT *
    FROM defectos_modelo_centro
    )
    UNION
    (
    SELECT *
    FROM defectos_modelo_sur
    )
);


---------------------------------------------------------------------------------------------
--HMO
CREATE OR REPLACE VIEW DEFECTOS_ENSAMBLADORA_GLOBAL AS
(
    (
    SELECT e.id_ensambladora, e.nombre, c.modelo, idef.id_tipo_defecto, d.descripcion
    FROM ensambladora e, inventario i, inventario_defecto idef, defecto d, catalogo c
    WHERE e.id_ensambladora = i.id_ensambladora AND i.id_inventario = idef.id_inventario AND idef.id_tipo_defecto = d.id_tipo_defecto AND i.id_catalogo = c.id_catalogo
    )
    UNION
    (
    SELECT e.id_ensambladora, e.nombre, c.modelo, idef.id_tipo_defecto, d.descripcion
    FROM ensambladora e, inventario@mty i, inventario_defecto@mty idef, defecto d, catalogo@mty c
    WHERE e.id_ensambladora = i.id_ensambladora AND i.id_inventario = idef.id_inventario AND idef.id_tipo_defecto = d.id_tipo_defecto AND i.id_catalogo = c.id_catalogo
    )
    UNION
    (
    SELECT e.id_ensambladora, e.nombre, c.modelo, idef.id_tipo_defecto, d.descripcion
    FROM ensambladora e, inventario@quro i, inventario_defecto@quro idef, defecto d, catalogo@quro c
    WHERE e.id_ensambladora = i.id_ensambladora AND i.id_inventario = idef.id_inventario AND idef.id_tipo_defecto = d.id_tipo_defecto AND i.id_catalogo = c.id_catalogo
    )
    UNION
    (
    SELECT e.id_ensambladora, e.nombre, c.modelo, idef.id_tipo_defecto, d.descripcion
    FROM ensambladora e, inventario@tg i, inventario_defecto@tg idef, defecto d, catalogo@tg c
    WHERE e.id_ensambladora = i.id_ensambladora AND i.id_inventario = idef.id_inventario AND idef.id_tipo_defecto = d.id_tipo_defecto AND i.id_catalogo = c.id_catalogo
    )
);

CREATE OR REPLACE VIEW DEFECTOS_MODELO_NORTE AS
(
    (
    SELECT nombre as "ENSAMBLADORA", modelo, COUNT(id_ensambladora) as "DEFECTOS"
    FROM defectos_ensambladora_global
    WHERE id_ensambladora = 1
    GROUP BY nombre, modelo
    )
);

CREATE OR REPLACE VIEW DEFECTOS_MODELO_CENTRO AS
(
    (
    SELECT nombre as "ENSAMBLADORA", modelo, COUNT(id_ensambladora) as "DEFECTOS"
    FROM defectos_ensambladora_global
    WHERE id_ensambladora = 2
    GROUP BY nombre, modelo
    )
);

CREATE OR REPLACE VIEW DEFECTOS_MODELO_SUR AS
(
    (
    SELECT nombre as "ENSAMBLADORA", modelo, COUNT(id_ensambladora) as "DEFECTOS"
    FROM defectos_ensambladora_global
    WHERE id_ensambladora = 3
    GROUP BY nombre, modelo
    )
);

CREATE OR REPLACE VIEW DEFECTOS_MODELO_ENSAMBLADORA AS
(
    (
    SELECT *
    FROM defectos_modelo_norte
    )
    UNION
    (
    SELECT *
    FROM defectos_modelo_centro
    )
    UNION
    (
    SELECT *
    FROM defectos_modelo_sur
    )
);


---------------------------------------------------------------------------------------------
--QURO
CREATE OR REPLACE VIEW DEFECTOS_ENSAMBLADORA_GLOBAL AS
(
    (
    SELECT e.id_ensambladora, e.nombre, c.modelo, idef.id_tipo_defecto, d.descripcion
    FROM ensambladora e, inventario i, inventario_defecto idef, defecto d, catalogo c
    WHERE e.id_ensambladora = i.id_ensambladora AND i.id_inventario = idef.id_inventario AND idef.id_tipo_defecto = d.id_tipo_defecto AND i.id_catalogo = c.id_catalogo
    )
    UNION
    (
    SELECT e.id_ensambladora, e.nombre, c.modelo, idef.id_tipo_defecto, d.descripcion
    FROM ensambladora e, inventario@mty i, inventario_defecto@mty idef, defecto d, catalogo@mty c
    WHERE e.id_ensambladora = i.id_ensambladora AND i.id_inventario = idef.id_inventario AND idef.id_tipo_defecto = d.id_tipo_defecto AND i.id_catalogo = c.id_catalogo
    )
    UNION
    (
    SELECT e.id_ensambladora, e.nombre, c.modelo, idef.id_tipo_defecto, d.descripcion
    FROM ensambladora e, inventario@hmo i, inventario_defecto@hmo idef, defecto d, catalogo@hmo c
    WHERE e.id_ensambladora = i.id_ensambladora AND i.id_inventario = idef.id_inventario AND idef.id_tipo_defecto = d.id_tipo_defecto AND i.id_catalogo = c.id_catalogo
    )
    UNION
    (
    SELECT e.id_ensambladora, e.nombre, c.modelo, idef.id_tipo_defecto, d.descripcion
    FROM ensambladora e, inventario@tg i, inventario_defecto@tg idef, defecto d, catalogo@tg c
    WHERE e.id_ensambladora = i.id_ensambladora AND i.id_inventario = idef.id_inventario AND idef.id_tipo_defecto = d.id_tipo_defecto AND i.id_catalogo = c.id_catalogo
    )
);

CREATE OR REPLACE VIEW DEFECTOS_MODELO_NORTE AS
(
    (
    SELECT nombre as "ENSAMBLADORA", modelo, COUNT(id_ensambladora) as "DEFECTOS"
    FROM defectos_ensambladora_global
    WHERE id_ensambladora = 1
    GROUP BY nombre, modelo
    )
);

CREATE OR REPLACE VIEW DEFECTOS_MODELO_CENTRO AS
(
    (
    SELECT nombre as "ENSAMBLADORA", modelo, COUNT(id_ensambladora) as "DEFECTOS"
    FROM defectos_ensambladora_global
    WHERE id_ensambladora = 2
    GROUP BY nombre, modelo
    )
);

CREATE OR REPLACE VIEW DEFECTOS_MODELO_SUR AS
(
    (
    SELECT nombre as "ENSAMBLADORA", modelo, COUNT(id_ensambladora) as "DEFECTOS"
    FROM defectos_ensambladora_global
    WHERE id_ensambladora = 3
    GROUP BY nombre, modelo
    )
);

CREATE OR REPLACE VIEW DEFECTOS_MODELO_ENSAMBLADORA AS
(
    (
    SELECT *
    FROM defectos_modelo_norte
    )
    UNION
    (
    SELECT *
    FROM defectos_modelo_centro
    )
    UNION
    (
    SELECT *
    FROM defectos_modelo_sur
    )
);


---------------------------------------------------------------------------------------------
--TG
CREATE OR REPLACE VIEW DEFECTOS_ENSAMBLADORA_GLOBAL AS
(
    (
    SELECT e.id_ensambladora, e.nombre, c.modelo, idef.id_tipo_defecto, d.descripcion
    FROM ensambladora e, inventario i, inventario_defecto idef, defecto d, catalogo c
    WHERE e.id_ensambladora = i.id_ensambladora AND i.id_inventario = idef.id_inventario AND idef.id_tipo_defecto = d.id_tipo_defecto AND i.id_catalogo = c.id_catalogo
    )
    UNION
    (
    SELECT e.id_ensambladora, e.nombre, c.modelo, idef.id_tipo_defecto, d.descripcion
    FROM ensambladora e, inventario@mty i, inventario_defecto@mty idef, defecto d, catalogo@mty c
    WHERE e.id_ensambladora = i.id_ensambladora AND i.id_inventario = idef.id_inventario AND idef.id_tipo_defecto = d.id_tipo_defecto AND i.id_catalogo = c.id_catalogo
    )
    UNION
    (
    SELECT e.id_ensambladora, e.nombre, c.modelo, idef.id_tipo_defecto, d.descripcion
    FROM ensambladora e, inventario@quro i, inventario_defecto@quro idef, defecto d, catalogo@quro c
    WHERE e.id_ensambladora = i.id_ensambladora AND i.id_inventario = idef.id_inventario AND idef.id_tipo_defecto = d.id_tipo_defecto AND i.id_catalogo = c.id_catalogo
    )
    UNION
    (
    SELECT e.id_ensambladora, e.nombre, c.modelo, idef.id_tipo_defecto, d.descripcion
    FROM ensambladora e, inventario@hmo i, inventario_defecto@hmo idef, defecto d, catalogo@hmo c
    WHERE e.id_ensambladora = i.id_ensambladora AND i.id_inventario = idef.id_inventario AND idef.id_tipo_defecto = d.id_tipo_defecto AND i.id_catalogo = c.id_catalogo
    )
);

CREATE OR REPLACE VIEW DEFECTOS_MODELO_NORTE AS
(
    (
    SELECT nombre as "ENSAMBLADORA", modelo, COUNT(id_ensambladora) as "DEFECTOS"
    FROM defectos_ensambladora_global
    WHERE id_ensambladora = 1
    GROUP BY nombre, modelo
    )
);

CREATE OR REPLACE VIEW DEFECTOS_MODELO_CENTRO AS
(
    (
    SELECT nombre as "ENSAMBLADORA", modelo, COUNT(id_ensambladora) as "DEFECTOS"
    FROM defectos_ensambladora_global
    WHERE id_ensambladora = 2
    GROUP BY nombre, modelo
    )
);

CREATE OR REPLACE VIEW DEFECTOS_MODELO_SUR AS
(
    (
    SELECT nombre as "ENSAMBLADORA", modelo, COUNT(id_ensambladora) as "DEFECTOS"
    FROM defectos_ensambladora_global
    WHERE id_ensambladora = 3
    GROUP BY nombre, modelo
    )
);

CREATE OR REPLACE VIEW DEFECTOS_MODELO_ENSAMBLADORA AS
(
    (
    SELECT *
    FROM defectos_modelo_norte
    )
    UNION
    (
    SELECT *
    FROM defectos_modelo_centro
    )
    UNION
    (
    SELECT *
    FROM defectos_modelo_sur
    )
);
