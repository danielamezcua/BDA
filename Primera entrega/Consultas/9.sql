--MTY
---------------------------------------------------------------------------------------------------------
CREATE OR REPLACE VIEW ENSAMBLADORAMAYORDEFECTOS
AS
(	SELECT TOP 1 NOMBRE, UNIDADES_DEFECTUOSAS
	FROM
	(SELECT ENSAMBLADORA.NOMBRE, COUNT(INVENTARIO.ID_ENSAMBLADORA) UNIDADES_DEFECTUOSAS
	FROM (SELECT DISTINCT ID_INVENTARIO FROM INVENTARIO_DEFECTO) DEFECTOS,
	INNER JOIN INVENTARIO ON INVENTARIO.ID_INVENTARIO = DEFECTOS.ID_INVENTARIO
	INNER JOIN ENSAMBLADORA ON INVENTARIO.ID_ENSAMBLADORA = ENSAMBLADORA.ID_ENSAMBLADORA
	GROUP BY ENSAMBLADORA.ID_ENSAMBLADORA
	UNION
	SELECT ENSAMBLADORA.NOMBRE, COUNT(INVENTARIO.ID_ENSAMBLADORA) UNIDADES_DEFECTUOSAS
	FROM (SELECT DISTINCT ID_INVENTARIO FROM INVENTARIO_DEFECTO@hmo) DEFECTOS,
	INNER JOIN INVENTARIO@hmo ON INVENTARIO.ID_INVENTARIO = DEFECTOS.ID_INVENTARIO
	INNER JOIN ENSAMBLADORA ON INVENTARIO.ID_ENSAMBLADORA = ENSAMBLADORA.ID_ENSAMBLADORA
	GROUP BY ENSAMBLADORA.ID_ENSAMBLADORA
	UNION
	SELECT ENSAMBLADORA.NOMBRE, COUNT(INVENTARIO.ID_ENSAMBLADORA) UNIDADES_DEFECTUOSAS
	FROM (SELECT DISTINCT ID_INVENTARIO FROM INVENTARIO_DEFECTO@quro) DEFECTOS,
	INNER JOIN INVENTARIO@quro ON INVENTARIO.ID_INVENTARIO = DEFECTOS.ID_INVENTARIO
	INNER JOIN ENSAMBLADORA ON INVENTARIO.ID_ENSAMBLADORA = ENSAMBLADORA.ID_ENSAMBLADORA
	GROUP BY ENSAMBLADORA.ID_ENSAMBLADORA
	UNION
	SELECT ENSAMBLADORA.NOMBRE, COUNT(INVENTARIO.ID_ENSAMBLADORA) UNIDADES_DEFECTUOSAS
	FROM (SELECT DISTINCT ID_INVENTARIO FROM INVENTARIO_DEFECTO@tg) DEFECTOS,
	INNER JOIN INVENTARIO@tg ON INVENTARIO.ID_INVENTARIO = DEFECTOS.ID_INVENTARIO
	INNER JOIN ENSAMBLADORA ON INVENTARIO.ID_ENSAMBLADORA = ENSAMBLADORA.ID_ENSAMBLADORA
	GROUP BY ENSAMBLADORA.ID_ENSAMBLADORA) DEFECTOS_ENSAMBLADORAS
	ORDER BY UNIDADES_DEFECTUOSAS DESC;
)
--HMO
---------------------------------------------------------------------------------------------------------
CREATE OR REPLACE VIEW ENSAMBLADORAMAYORDEFECTOS
AS
(	SELECT TOP 1 NOMBRE, UNIDADES_DEFECTUOSAS
	FROM
	(SELECT ENSAMBLADORA.NOMBRE, COUNT(INVENTARIO.ID_ENSAMBLADORA) UNIDADES_DEFECTUOSAS
	FROM (SELECT DISTINCT ID_INVENTARIO FROM INVENTARIO_DEFECTO@mty) DEFECTOS,
	INNER JOIN INVENTARIO@mty ON INVENTARIO.ID_INVENTARIO = DEFECTOS.ID_INVENTARIO
	INNER JOIN ENSAMBLADORA ON INVENTARIO.ID_ENSAMBLADORA = ENSAMBLADORA.ID_ENSAMBLADORA
	GROUP BY ENSAMBLADORA.ID_ENSAMBLADORA
	UNION
	SELECT ENSAMBLADORA.NOMBRE, COUNT(INVENTARIO.ID_ENSAMBLADORA) UNIDADES_DEFECTUOSAS
	FROM (SELECT DISTINCT ID_INVENTARIO FROM INVENTARIO_DEFECTO) DEFECTOS,
	INNER JOIN INVENTARIO ON INVENTARIO.ID_INVENTARIO = DEFECTOS.ID_INVENTARIO
	INNER JOIN ENSAMBLADORA ON INVENTARIO.ID_ENSAMBLADORA = ENSAMBLADORA.ID_ENSAMBLADORA
	GROUP BY ENSAMBLADORA.ID_ENSAMBLADORA
	UNION
	SELECT ENSAMBLADORA.NOMBRE, COUNT(INVENTARIO.ID_ENSAMBLADORA) UNIDADES_DEFECTUOSAS
	FROM (SELECT DISTINCT ID_INVENTARIO FROM INVENTARIO_DEFECTO@quro) DEFECTOS,
	INNER JOIN INVENTARIO@quro ON INVENTARIO.ID_INVENTARIO = DEFECTOS.ID_INVENTARIO
	INNER JOIN ENSAMBLADORA ON INVENTARIO.ID_ENSAMBLADORA = ENSAMBLADORA.ID_ENSAMBLADORA
	GROUP BY ENSAMBLADORA.ID_ENSAMBLADORA
	UNION
	SELECT ENSAMBLADORA.NOMBRE, COUNT(INVENTARIO.ID_ENSAMBLADORA) UNIDADES_DEFECTUOSAS
	FROM (SELECT DISTINCT ID_INVENTARIO FROM INVENTARIO_DEFECTO@tg) DEFECTOS,
	INNER JOIN INVENTARIO@tg ON INVENTARIO.ID_INVENTARIO = DEFECTOS.ID_INVENTARIO
	INNER JOIN ENSAMBLADORA ON INVENTARIO.ID_ENSAMBLADORA = ENSAMBLADORA.ID_ENSAMBLADORA
	GROUP BY ENSAMBLADORA.ID_ENSAMBLADORA) DEFECTOS_ENSAMBLADORAS
	ORDER BY UNIDADES_DEFECTUOSAS DESC;
)
--QRO
---------------------------------------------------------------------------------------------------------
CREATE OR REPLACE VIEW ENSAMBLADORAMAYORDEFECTOS
AS
(	SELECT TOP 1 NOMBRE, UNIDADES_DEFECTUOSAS
	FROM
	(SELECT ENSAMBLADORA.NOMBRE, COUNT(INVENTARIO.ID_ENSAMBLADORA) UNIDADES_DEFECTUOSAS
	FROM (SELECT DISTINCT ID_INVENTARIO FROM INVENTARIO_DEFECTO@mty) DEFECTOS,
	INNER JOIN INVENTARIO@mty ON INVENTARIO.ID_INVENTARIO = DEFECTOS.ID_INVENTARIO
	INNER JOIN ENSAMBLADORA ON INVENTARIO.ID_ENSAMBLADORA = ENSAMBLADORA.ID_ENSAMBLADORA
	GROUP BY ENSAMBLADORA.ID_ENSAMBLADORA
	UNION
	SELECT ENSAMBLADORA.NOMBRE, COUNT(INVENTARIO.ID_ENSAMBLADORA) UNIDADES_DEFECTUOSAS
	FROM (SELECT DISTINCT ID_INVENTARIO FROM INVENTARIO_DEFECTO@hmo) DEFECTOS,
	INNER JOIN INVENTARIO@hmo ON INVENTARIO.ID_INVENTARIO = DEFECTOS.ID_INVENTARIO
	INNER JOIN ENSAMBLADORA ON INVENTARIO.ID_ENSAMBLADORA = ENSAMBLADORA.ID_ENSAMBLADORA
	GROUP BY ENSAMBLADORA.ID_ENSAMBLADORA
	UNION
	SELECT ENSAMBLADORA.NOMBRE, COUNT(INVENTARIO.ID_ENSAMBLADORA) UNIDADES_DEFECTUOSAS
	FROM (SELECT DISTINCT ID_INVENTARIO FROM INVENTARIO_DEFECTO) DEFECTOS,
	INNER JOIN INVENTARIO ON INVENTARIO.ID_INVENTARIO = DEFECTOS.ID_INVENTARIO
	INNER JOIN ENSAMBLADORA ON INVENTARIO.ID_ENSAMBLADORA = ENSAMBLADORA.ID_ENSAMBLADORA
	GROUP BY ENSAMBLADORA.ID_ENSAMBLADORA
	UNION
	SELECT ENSAMBLADORA.NOMBRE, COUNT(INVENTARIO.ID_ENSAMBLADORA) UNIDADES_DEFECTUOSAS
	FROM (SELECT DISTINCT ID_INVENTARIO FROM INVENTARIO_DEFECTO@tg) DEFECTOS,
	INNER JOIN INVENTARIO@tg ON INVENTARIO.ID_INVENTARIO = DEFECTOS.ID_INVENTARIO
	INNER JOIN ENSAMBLADORA ON INVENTARIO.ID_ENSAMBLADORA = ENSAMBLADORA.ID_ENSAMBLADORA
	GROUP BY ENSAMBLADORA.ID_ENSAMBLADORA) DEFECTOS_ENSAMBLADORAS
	ORDER BY UNIDADES_DEFECTUOSAS DESC;
)
--TG
---------------------------------------------------------------------------------------------------------
CREATE OR REPLACE VIEW ENSAMBLADORAMAYORDEFECTOS
AS
(	
	SELECT TOP 1 NOMBRE, UNIDADES_DEFECTUOSAS
	FROM
	(SELECT ENSAMBLADORA.NOMBRE, COUNT(INVENTARIO.ID_ENSAMBLADORA) UNIDADES_DEFECTUOSAS
	FROM (SELECT DISTINCT ID_INVENTARIO FROM INVENTARIO_DEFECTO@mty) DEFECTOS,
	INNER JOIN INVENTARIO@mty ON INVENTARIO.ID_INVENTARIO = DEFECTOS.ID_INVENTARIO
	INNER JOIN ENSAMBLADORA ON INVENTARIO.ID_ENSAMBLADORA = ENSAMBLADORA.ID_ENSAMBLADORA
	GROUP BY ENSAMBLADORA.ID_ENSAMBLADORA
	UNION
	SELECT ENSAMBLADORA.NOMBRE, COUNT(INVENTARIO.ID_ENSAMBLADORA) UNIDADES_DEFECTUOSAS
	FROM (SELECT DISTINCT ID_INVENTARIO FROM INVENTARIO_DEFECTO@hmo) DEFECTOS,
	INNER JOIN INVENTARIO@hmo ON INVENTARIO.ID_INVENTARIO = DEFECTOS.ID_INVENTARIO
	INNER JOIN ENSAMBLADORA ON INVENTARIO.ID_ENSAMBLADORA = ENSAMBLADORA.ID_ENSAMBLADORA
	GROUP BY ENSAMBLADORA.ID_ENSAMBLADORA
	UNION
	SELECT ENSAMBLADORA.NOMBRE, COUNT(INVENTARIO.ID_ENSAMBLADORA) UNIDADES_DEFECTUOSAS
	FROM (SELECT DISTINCT ID_INVENTARIO FROM INVENTARIO_DEFECTO@quro) DEFECTOS,
	INNER JOIN INVENTARIO@quro ON INVENTARIO.ID_INVENTARIO = DEFECTOS.ID_INVENTARIO
	INNER JOIN ENSAMBLADORA ON INVENTARIO.ID_ENSAMBLADORA = ENSAMBLADORA.ID_ENSAMBLADORA
	GROUP BY ENSAMBLADORA.ID_ENSAMBLADORA
	UNION
	SELECT ENSAMBLADORA.NOMBRE, COUNT(INVENTARIO.ID_ENSAMBLADORA) UNIDADES_DEFECTUOSAS
	FROM (SELECT DISTINCT ID_INVENTARIO FROM INVENTARIO_DEFECTO) DEFECTOS,
	INNER JOIN INVENTARIO ON INVENTARIO.ID_INVENTARIO = DEFECTOS.ID_INVENTARIO
	INNER JOIN ENSAMBLADORA ON INVENTARIO.ID_ENSAMBLADORA = ENSAMBLADORA.ID_ENSAMBLADORA
	GROUP BY ENSAMBLADORA.ID_ENSAMBLADORA) DEFECTOS_ENSAMBLADORAS
	ORDER BY UNIDADES_DEFECTUOSAS DESC;
)