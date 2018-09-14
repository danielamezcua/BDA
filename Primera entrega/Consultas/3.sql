--mty
----------------------------------------------------------------------------------------------------
CREATE OR REPLACE VIEW VEHICULOMENORVENDIDO AS
(
	SELECT AGENCIA AS 'MTY' CATALOGO.MODELO,  COUNT(CATALOGO.ID_CATALOGO) CANTIDAD FROM VENTA 
	INNER JOIN INVENTARIO ON VENTAS.ID_INVENTARIO = INVENTARIO.ID_INVENTARIO
	INNER JOIN CATALOGO ON INVENTARIO.ID_CATALOGO = CATALOGO.ID_CATALOGO
	GROUP BY (CATALOGO.MODELO)
	ORDER BY CANTIDAD ASC
	UNION
	SELECT AGENCIA AS 'HMO' CATALOGO.MODELO,  COUNT(CATALOGO.ID_CATALOGO) CANTIDAD FROM VENTA@hmo 
	INNER JOIN INVENTARIO@hmo ON VENTAS.ID_INVENTARIO = INVENTARIO.ID_INVENTARIO
	INNER JOIN CATALOGO ON INVENTARIO.ID_CATALOGO = CATALOGO.ID_CATALOGO
	GROUP BY (CATALOGO.MODELO)
	ORDER BY CANTIDAD ASC
	UNION
	SELECT AGENCIA AS 'QRO' CATALOGO.MODELO,  COUNT(CATALOGO.ID_CATALOGO) CANTIDAD FROM VENTA@qro
	INNER JOIN INVENTARIO@quro ON VENTAS.ID_INVENTARIO = INVENTARIO.ID_INVENTARIO
	INNER JOIN CATALOGO ON INVENTARIO.ID_CATALOGO = CATALOGO.ID_CATALOGO
	GROUP BY (CATALOGO.MODELO)
	ORDER BY CANTIDAD ASC
	UNION
	SELECT AGENCIA AS 'TG' CATALOGO.MODELO,  COUNT(CATALOGO.ID_CATALOGO) CANTIDAD FROM VENTA@tg 
	INNER JOIN INVENTARIO@tg ON VENTAS.ID_INVENTARIO = INVENTARIO.ID_INVENTARIO
	INNER JOIN CATALOGO ON INVENTARIO.ID_CATALOGO = CATALOGO.ID_CATALOGO
	GROUP BY (CATALOGO.MODELO)
	ORDER BY CANTIDAD ASC
)
----------------------------------------------------------------------------------------------------
--hmo
----------------------------------------------------------------------------------------------------
CREATE OR REPLACE VIEW VEHICULOMENORVENDIDO AS
(
	SELECT AGENCIA AS 'MTY' CATALOGO.MODELO,  COUNT(CATALOGO.ID_CATALOGO) CANTIDAD FROM VENTA@mty 
	INNER JOIN INVENTARIO@mty ON VENTAS.ID_INVENTARIO = INVENTARIO.ID_INVENTARIO
	INNER JOIN CATALOGO ON INVENTARIO.ID_CATALOGO = CATALOGO.ID_CATALOGO
	GROUP BY (CATALOGO.MODELO)
	ORDER BY CANTIDAD ASC
	UNION
	SELECT AGENCIA AS 'HMO' CATALOGO.MODELO,  COUNT(CATALOGO.ID_CATALOGO) CANTIDAD FROM VENTA
	INNER JOIN INVENTARIO ON VENTAS.ID_INVENTARIO = INVENTARIO.ID_INVENTARIO
	INNER JOIN CATALOGO ON INVENTARIO.ID_CATALOGO = CATALOGO.ID_CATALOGO
	GROUP BY (CATALOGO.MODELO)
	ORDER BY CANTIDAD ASC
	UNION
	SELECT AGENCIA AS 'QRO' CATALOGO.MODELO,  COUNT(CATALOGO.ID_CATALOGO) CANTIDAD FROM VENTA@qro
	INNER JOIN INVENTARIO@quro ON VENTAS.ID_INVENTARIO = INVENTARIO.ID_INVENTARIO
	INNER JOIN CATALOGO ON INVENTARIO.ID_CATALOGO = CATALOGO.ID_CATALOGO
	GROUP BY (CATALOGO.MODELO)
	ORDER BY CANTIDAD ASC
	UNION
	SELECT AGENCIA AS 'TG' CATALOGO.MODELO,  COUNT(CATALOGO.ID_CATALOGO) CANTIDAD FROM VENTA@tg 
	INNER JOIN INVENTARIO@tg ON VENTAS.ID_INVENTARIO = INVENTARIO.ID_INVENTARIO
	INNER JOIN CATALOGO ON INVENTARIO.ID_CATALOGO = CATALOGO.ID_CATALOGO
	GROUP BY (CATALOGO.MODELO)
	ORDER BY CANTIDAD ASC
)
----------------------------------------------------------------------------------------------------
--qro
----------------------------------------------------------------------------------------------------
CREATE OR REPLACE VIEW VEHICULOMENORVENDIDO AS
(
	SELECT AGENCIA AS 'MTY' CATALOGO.MODELO,  COUNT(CATALOGO.ID_CATALOGO) CANTIDAD FROM VENTA@mty 
	INNER JOIN INVENTARIO@mty ON VENTAS.ID_INVENTARIO = INVENTARIO.ID_INVENTARIO
	INNER JOIN CATALOGO ON INVENTARIO.ID_CATALOGO = CATALOGO.ID_CATALOGO
	GROUP BY (CATALOGO.MODELO)
	ORDER BY CANTIDAD ASC
	UNION
	SELECT AGENCIA AS 'HMO' CATALOGO.MODELO,  COUNT(CATALOGO.ID_CATALOGO) CANTIDAD FROM VENTA@hmo 
	INNER JOIN INVENTARIO@hmo ON VENTAS.ID_INVENTARIO = INVENTARIO.ID_INVENTARIO
	INNER JOIN CATALOGO ON INVENTARIO.ID_CATALOGO = CATALOGO.ID_CATALOGO
	GROUP BY (CATALOGO.MODELO)
	ORDER BY CANTIDAD ASC
	UNION
	SELECT AGENCIA AS 'QRO' CATALOGO.MODELO,  COUNT(CATALOGO.ID_CATALOGO) CANTIDAD FROM VENTA
	INNER JOIN INVENTARIO ON VENTAS.ID_INVENTARIO = INVENTARIO.ID_INVENTARIO
	INNER JOIN CATALOGO ON INVENTARIO.ID_CATALOGO = CATALOGO.ID_CATALOGO
	GROUP BY (CATALOGO.MODELO)
	ORDER BY CANTIDAD ASC
	UNION
	SELECT AGENCIA AS 'TG' CATALOGO.MODELO,  COUNT(CATALOGO.ID_CATALOGO) CANTIDAD FROM VENTA@tg 
	INNER JOIN INVENTARIO@tg ON VENTAS.ID_INVENTARIO = INVENTARIO.ID_INVENTARIO
	INNER JOIN CATALOGO ON INVENTARIO.ID_CATALOGO = CATALOGO.ID_CATALOGO
	GROUP BY (CATALOGO.MODELO)
	ORDER BY CANTIDAD ASC
)
----------------------------------------------------------------------------------------------------
--tg
----------------------------------------------------------------------------------------------------
CREATE OR REPLACE VIEW VEHICULOMENORVENDIDO AS
(
	SELECT AGENCIA AS 'MTY' CATALOGO.MODELO,  COUNT(CATALOGO.ID_CATALOGO) CANTIDAD FROM VENTA@mty 
	INNER JOIN INVENTARIO@mty ON VENTAS.ID_INVENTARIO = INVENTARIO.ID_INVENTARIO
	INNER JOIN CATALOGO ON INVENTARIO.ID_CATALOGO = CATALOGO.ID_CATALOGO
	GROUP BY (CATALOGO.MODELO)
	ORDER BY CANTIDAD ASC
	UNION
	SELECT AGENCIA AS 'HMO' CATALOGO.MODELO,  COUNT(CATALOGO.ID_CATALOGO) CANTIDAD FROM VENTA@hmo 
	INNER JOIN INVENTARIO@hmo ON VENTAS.ID_INVENTARIO = INVENTARIO.ID_INVENTARIO
	INNER JOIN CATALOGO ON INVENTARIO.ID_CATALOGO = CATALOGO.ID_CATALOGO
	GROUP BY (CATALOGO.MODELO)
	ORDER BY CANTIDAD ASC
	UNION
	SELECT AGENCIA AS 'QRO' CATALOGO.MODELO,  COUNT(CATALOGO.ID_CATALOGO) CANTIDAD FROM VENTA@qro
	INNER JOIN INVENTARIO@quro ON VENTAS.ID_INVENTARIO = INVENTARIO.ID_INVENTARIO
	INNER JOIN CATALOGO ON INVENTARIO.ID_CATALOGO = CATALOGO.ID_CATALOGO
	GROUP BY (CATALOGO.MODELO)
	ORDER BY CANTIDAD ASC
	UNION
	SELECT AGENCIA AS 'TG' CATALOGO.MODELO,  COUNT(CATALOGO.ID_CATALOGO) CANTIDAD FROM VENTAS 
	INNER JOIN INVENTARIO ON VENTAS.ID_INVENTARIO = INVENTARIO.ID_INVENTARIO
	INNER JOIN CATALOGO ON INVENTARIO.ID_CATALOGO = CATALOGO.ID_CATALOGO
	GROUP BY (CATALOGO.MODELO)
	ORDER BY CANTIDAD ASC
)
----------------------------------------------------------------------------------------------------