
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


----------CÓDIGO UTILIZADO------
/*
begin;
CREATE SEQUENCE ikea_erp.alumno_id_seq_abraham 
end;

begin;
CREATE SEQUENCE ikea_erp.telefonoAlumno_id_seq_abraham
end;
*/

begin; CREATE SEQUENCE ikea_erp.alumno_id_seq_abraham; end; --se insertaran los datos cuando usemos el insert into ... nextval('ikea_erp.alumno_id_seq_abraham');
begin; CREATE SEQUENCE ikea_erp.telefonoAlumno_id_seq_abraham; end; --se insertaran los datos cuando usemos el insert into ... nextval('ikea_erp.telefonoAlumno_id_seq_abraham');

/* 
begin;  
CREATE TABLE IF NOT EXISTS ikea_erp.estadoAlumnoEnum_abraham ( 
    idEstadoAlumnoEnum BIGINT PRIMARY KEY, 
    valor VARCHAR 
    );
end;
    
begin;
CREATE TABLE IF NOT EXISTS ikea_erp.alumno_abraham (
    idAlumno BIGINT PRIMARY KEY  DEFAULT (NEXT VALUE FOR ikea_erp.alumno_id_seq_abraham ), 
    nombre VARCHAR NOT NULL, 
    apellido VARCHAR NOT NULL, 
    codigoAlumno VARCHAR NOT NULL UNIQUE, 
    fechaAlta timestamp, 
    fechaNacimiento DATE, 
    estado_id BIGINT, 
    CONSTRAINT fk_alumno_estadoAlumnoEnum_id FOREIGN KEY(estado_id) REFERENCES ikea_erp.estadoAlumnoEnum_abraham(idEstadoAlumnoEnum)
    ); 
end;

begin;
CREATE TABLE IF NOT EXISTS ikea_erp.telefonoAlumno_abraham ( 
    idTelefonoAlumno BIGINT PRIMARY KEY DEFAULT (NEXT VALUE FOR ikea_erp.telefonoAlumno_id_seq_abraham), 
    numeroTelefono VARCHAR, 
    descripcion VARCHAR, 
    alumno_id BIGINT, 
    CONSTRAINT fk_telefonoAlumno_alumno_id FOREIGN KEY(alumno_id) REFERENCES ikea_erp.alumno_abraham(idAlumno)
    ); 
end;    
    
    */

begin; 
CREATE TABLE IF NOT EXISTS ikea_erp.estadoAlumnoEnum_abraham ( idEstadoAlumnoEnum BIGINT PRIMARY KEY, valor VARCHAR ); 

CREATE TABLE IF NOT EXISTS ikea_erp.alumno_abraham (idAlumno BIGINT PRIMARY KEY, nombre VARCHAR NOT NULL, apellido VARCHAR NOT NULL, codigoAlumno VARCHAR NOT NULL UNIQUE, fechaAlta timestamp, fechaNacimiento DATE, estado_id BIGINT, CONSTRAINT fk_alumno_estadoAlumnoEnum_id FOREIGN KEY(estado_id) REFERENCES ikea_erp.estadoAlumnoEnum_abraham(idEstadoAlumnoEnum)); 

CREATE TABLE IF NOT EXISTS ikea_erp.telefonoAlumno_abraham ( idTelefonoAlumno BIGINT PRIMARY KEY, numeroTelefono VARCHAR, descripcion VARCHAR, alumno_id BIGINT, CONSTRAINT fk_telefonoAlumno_alumno_id FOREIGN KEY(alumno_id) REFERENCES ikea_erp.alumno_abraham(idAlumno)); 

end;


/*



