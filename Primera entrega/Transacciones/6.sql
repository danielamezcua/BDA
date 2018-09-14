-- MTY select * from catalogo
---------------------------------------
CREATE OR REPLACE PROCEDURE REGISTRARCATALOGO
(
	P_MODELO IN VARCHAR2,
    P_ANO IN VARCHAR2
)
AS
    V_ID_CATALOGO NUMBER;
BEGIN
    SELECT MAX(ID_CATALOGO) INTO V_ID_CATALOGO FROM CATALOGO;
    
    INSERT INTO CATALOGO (ID_CATALOGO, MODELO, ANO) VALUES(V_ID_CATALOGO+1, P_MODELO, P_ANO);
    INSERT INTO CATALOGO@HMO (ID_CATALOGO, MODELO, ANO) VALUES(V_ID_CATALOGO+1, P_MODELO, P_ANO);
    INSERT INTO CATALOGO@QURO (ID_CATALOGO, MODELO, ANO) VALUES(V_ID_CATALOGO+1, P_MODELO, P_ANO);
    INSERT INTO CATALOGO@TG (ID_CATALOGO, MODELO, ANO) VALUES(V_ID_CATALOGO+1, P_MODELO, P_ANO);
    COMMIT;
END REGISTRARCATALOGO;
/
---------------------------------------

-- HMO
---------------------------------------
CREATE OR REPLACE PROCEDURE REGISTRARCATALOGO
(
	P_MODELO IN VARCHAR2,
    P_ANO IN VARCHAR2
)
AS
    V_ID_CATALOGO NUMBER;
BEGIN
    SELECT MAX(ID_CATALOGO) INTO V_ID_CATALOGO FROM CATALOGO;
    
    INSERT INTO CATALOGO (ID_CATALOGO, MODELO, ANO) VALUES(V_ID_CATALOGO+1, P_MODELO, P_ANO);
    INSERT INTO CATALOGO@MTY (ID_CATALOGO, MODELO, ANO) VALUES(V_ID_CATALOGO+1, P_MODELO, P_ANO);
    INSERT INTO CATALOGO@QURO (ID_CATALOGO, MODELO, ANO) VALUES(V_ID_CATALOGO+1, P_MODELO, P_ANO);
    INSERT INTO CATALOGO@TG (ID_CATALOGO, MODELO, ANO) VALUES(V_ID_CATALOGO+1, P_MODELO, P_ANO);
    COMMIT;
END REGISTRARCATALOGO;
/
---------------------------------------

-- QURO
---------------------------------------
CREATE OR REPLACE PROCEDURE REGISTRARCATALOGO
(
	P_MODELO IN VARCHAR2,
    P_ANO IN VARCHAR2
)
AS
    V_ID_CATALOGO NUMBER;
BEGIN
    SELECT MAX(ID_CATALOGO) INTO V_ID_CATALOGO FROM CATALOGO;
    
    INSERT INTO CATALOGO (ID_CATALOGO, MODELO, ANO) VALUES(V_ID_CATALOGO+1, P_MODELO, P_ANO);
    INSERT INTO CATALOGO@HMO (ID_CATALOGO, MODELO, ANO) VALUES(V_ID_CATALOGO+1, P_MODELO, P_ANO);
    INSERT INTO CATALOGO@MTY (ID_CATALOGO, MODELO, ANO) VALUES(V_ID_CATALOGO+1, P_MODELO, P_ANO);
    INSERT INTO CATALOGO@TG (ID_CATALOGO, MODELO, ANO) VALUES(V_ID_CATALOGO+1, P_MODELO, P_ANO);
    COMMIT;
END REGISTRARCATALOGO;
/
---------------------------------------

-- TG
---------------------------------------
CREATE OR REPLACE PROCEDURE REGISTRARCATALOGO
(
	P_MODELO IN VARCHAR2,
    P_ANO IN VARCHAR2
)
AS
    V_ID_CATALOGO NUMBER;
BEGIN
    SELECT MAX(ID_CATALOGO) INTO V_ID_CATALOGO FROM CATALOGO;
    
    INSERT INTO CATALOGO (ID_CATALOGO, MODELO, ANO) VALUES(V_ID_CATALOGO+1, P_MODELO, P_ANO);
    INSERT INTO CATALOGO@HMO (ID_CATALOGO, MODELO, ANO) VALUES(V_ID_CATALOGO+1, P_MODELO, P_ANO);
    INSERT INTO CATALOGO@QURO (ID_CATALOGO, MODELO, ANO) VALUES(V_ID_CATALOGO+1, P_MODELO, P_ANO);
    INSERT INTO CATALOGO@MTY (ID_CATALOGO, MODELO, ANO) VALUES(V_ID_CATALOGO+1, P_MODELO, P_ANO);
    COMMIT;
END REGISTRARCATALOGO;
/