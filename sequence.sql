
/* --ESQUEMA DE CREACIÓN DE SECUENCIAS
CREATE SEQUENCE [schema_name.] SEQUENCE_NAME
    [ AS [ BUILT_IN_INTEGER TYPE | USER-DEFINIED_INTEGERR_TYPE ]]
    [ START WITH <CONSTANT> ]
    [ INCREMENT BY <CONSTANT> ]
    [ { MINVALUE [ <CONSTANT> ]} |  { NO MINVALUE } ]
    [ { MAXVALUE [ <CONSTANT> ]} |  { NO MAXVALUE } ]
    [ CYCLE | { NO CYCLE } ]
    [ {CACHE [ < CONSTANT > ]} | { NO CHACHE } ]
    [ ; ]
*/
--SECUENCIA
CREATE SEQUENCE ikea_erp.sequence AS BIGINT --¿PONEMOS sequence_abraham?
MINVALUE 1
NO MAXVALUE
START WITH 1;

--PEDIR UN VALOR
SELECT NEXTSEQUENCE = NEXT VALUE FOR ikea_erp.sequence


--TABLAS CON SECUENCIAS
CREATE TABLE ikea_erp.alumno_abraham (
    idAlumno BIGINT DEFAULT (NEXT VALUE FOR ikea_erp.sequence ) --ojo ¿lo cambiamos por ikea_erp.sequence_abraham?
    nombre VARCHAR,
    --el resto
);
