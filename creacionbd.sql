
use pro3

ALTER TABLE municipio
DROP
  CONSTRAINT municipio_departamento_FK
GO
DROP
  TABLE departamento
GO

ALTER TABLE voto
DROP
  CONSTRAINT voto_eleccion_FK
GO
DROP
  TABLE eleccion
GO

ALTER TABLE voto
DROP
  CONSTRAINT voto_genero_FK
GO
DROP TABLE genero
GO

ALTER TABLE voto
DROP
  CONSTRAINT voto_municipio_FK
GO
DROP
  TABLE municipio
GO

ALTER TABLE region
DROP
  CONSTRAINT region_pais_FK
GO
DROP TABLE pais
GO

ALTER TABLE voto
DROP
  CONSTRAINT voto_partido_FK
GO
DROP TABLE partido
GO

ALTER TABLE voto
DROP
  CONSTRAINT voto_raza_FK
GO
DROP TABLE raza
GO

ALTER TABLE departamento
DROP
  CONSTRAINT departamento_region_FK
GO
DROP TABLE region
GO

ALTER TABLE voto
DROP
  CONSTRAINT voto_tipovotante_FK
GO
DROP
  TABLE tipovotante
GO

DROP TABLE voto
GO
--------------------------------------------------------------
CREATE
  TABLE departamento
  (
    id        INTEGER NOT NULL  IDENTITY(1,1),
    nombre    VARCHAR (50) ,
    region_id INTEGER NOT NULL
  )
  ON "default"
GO
ALTER TABLE departamento ADD CONSTRAINT departamento_PK PRIMARY KEY CLUSTERED (
id)
WITH
  (
    ALLOW_PAGE_LOCKS = ON ,
    ALLOW_ROW_LOCKS  = ON
  )
  ON "default"
GO

CREATE
  TABLE eleccion
  (
    id              INTEGER NOT NULL  IDENTITY(1,1) ,
    nombre_eleccion VARCHAR (50)
  )
  ON "default"
GO
ALTER TABLE eleccion ADD CONSTRAINT eleccion_PK PRIMARY KEY CLUSTERED (id)
WITH
  (
    ALLOW_PAGE_LOCKS = ON ,
    ALLOW_ROW_LOCKS  = ON
  )
  ON "default"
GO

CREATE
  TABLE genero
  (
    id     INTEGER NOT NULL  IDENTITY(1,1) ,
    nombre VARCHAR (50)
  )
  ON "default"
GO
ALTER TABLE genero ADD CONSTRAINT genero_PK PRIMARY KEY CLUSTERED (id)
WITH
  (
    ALLOW_PAGE_LOCKS = ON ,
    ALLOW_ROW_LOCKS  = ON
  )
  ON "default"
GO

CREATE
  TABLE municipio
  (
    id              INTEGER NOT NULL  IDENTITY(1,1) ,
    nombre          VARCHAR (50) ,
    departamento_id INTEGER NOT NULL
  )
  ON "default"
GO
ALTER TABLE municipio ADD CONSTRAINT municipio_PK PRIMARY KEY CLUSTERED (id)
WITH
  (
    ALLOW_PAGE_LOCKS = ON ,
    ALLOW_ROW_LOCKS  = ON
  )
  ON "default"
GO

CREATE
  TABLE pais
  (
    id     INTEGER NOT NULL  IDENTITY(1,1),
    nombre VARCHAR (50)
  )
  ON "default"
GO
ALTER TABLE pais ADD CONSTRAINT pais_PK PRIMARY KEY CLUSTERED (id)
WITH
  (
    ALLOW_PAGE_LOCKS = ON ,
    ALLOW_ROW_LOCKS  = ON
  )
  ON "default"
GO

CREATE
  TABLE partido
  (
    id             INTEGER NOT NULL  IDENTITY(1,1),
    partido        VARCHAR (50) ,
    nombre_partido VARCHAR (50)
  )
  ON "default"
GO
ALTER TABLE partido ADD CONSTRAINT partido_PK PRIMARY KEY CLUSTERED (id)
WITH
  (
    ALLOW_PAGE_LOCKS = ON ,
    ALLOW_ROW_LOCKS  = ON
  )
  ON "default"
GO

CREATE
  TABLE raza
  (
    id     INTEGER NOT NULL  IDENTITY(1,1) ,
    nombre VARCHAR (50)
  )
  ON "default"
GO
ALTER TABLE raza ADD CONSTRAINT raza_PK PRIMARY KEY CLUSTERED (id)
WITH
  (
    ALLOW_PAGE_LOCKS = ON ,
    ALLOW_ROW_LOCKS  = ON
  )
  ON "default"
GO

CREATE
  TABLE region
  (
    id      INTEGER NOT NULL  IDENTITY(1,1),
    nombre  VARCHAR (50) ,
    pais_id INTEGER NOT NULL
  )
  ON "default"
GO
ALTER TABLE region ADD CONSTRAINT region_PK PRIMARY KEY CLUSTERED (id)
WITH
  (
    ALLOW_PAGE_LOCKS = ON ,
    ALLOW_ROW_LOCKS  = ON
  )
  ON "default"
GO

CREATE
  TABLE tipovotante
  (
    id   INTEGER NOT NULL  IDENTITY(1,1),
    tipo CHAR (20)
  )
  ON "default"
GO
ALTER TABLE tipovotante ADD CONSTRAINT tipovotante_PK PRIMARY KEY CLUSTERED (id
)
WITH
  (
    ALLOW_PAGE_LOCKS = ON ,
    ALLOW_ROW_LOCKS  = ON
  )
  ON "default"
GO

CREATE
  TABLE voto
  (
    id             INTEGER NOT NULL  IDENTITY(1,1) ,
    cantidad       INTEGER ,
    ano            INTEGER ,
    eleccion_id    INTEGER NOT NULL ,
    partido_id     INTEGER NOT NULL ,
    genero_id      INTEGER NOT NULL ,
    raza_id        INTEGER NOT NULL ,
    tipovotante_id INTEGER NOT NULL ,
    municipio_id   INTEGER NOT NULL
  )
  ON "default"
GO
ALTER TABLE voto ADD CONSTRAINT voto_PK PRIMARY KEY CLUSTERED (id)
WITH
  (
    ALLOW_PAGE_LOCKS = ON ,
    ALLOW_ROW_LOCKS  = ON
  )
  ON "default"
GO

ALTER TABLE departamento
ADD CONSTRAINT departamento_region_FK FOREIGN KEY
(
region_id
)
REFERENCES region
(
id
)
ON
DELETE
  NO ACTION ON
UPDATE NO ACTION
GO

ALTER TABLE municipio
ADD CONSTRAINT municipio_departamento_FK FOREIGN KEY
(
departamento_id
)
REFERENCES departamento
(
id
)
ON
DELETE
  NO ACTION ON
UPDATE NO ACTION
GO

ALTER TABLE region
ADD CONSTRAINT region_pais_FK FOREIGN KEY
(
pais_id
)
REFERENCES pais
(
id
)
ON
DELETE
  NO ACTION ON
UPDATE NO ACTION
GO

ALTER TABLE voto
ADD CONSTRAINT voto_eleccion_FK FOREIGN KEY
(
eleccion_id
)
REFERENCES eleccion
(
id
)
ON
DELETE
  NO ACTION ON
UPDATE NO ACTION
GO

ALTER TABLE voto
ADD CONSTRAINT voto_genero_FK FOREIGN KEY
(
genero_id
)
REFERENCES genero
(
id
)
ON
DELETE
  NO ACTION ON
UPDATE NO ACTION
GO

ALTER TABLE voto
ADD CONSTRAINT voto_municipio_FK FOREIGN KEY
(
municipio_id
)
REFERENCES municipio
(
id
)
ON
DELETE
  NO ACTION ON
UPDATE NO ACTION
GO

ALTER TABLE voto
ADD CONSTRAINT voto_partido_FK FOREIGN KEY
(
partido_id
)
REFERENCES partido
(
id
)
ON
DELETE
  NO ACTION ON
UPDATE NO ACTION
GO

ALTER TABLE voto
ADD CONSTRAINT voto_raza_FK FOREIGN KEY
(
raza_id
)
REFERENCES raza
(
id
)
ON
DELETE
  NO ACTION ON
UPDATE NO ACTION
GO

ALTER TABLE voto
ADD CONSTRAINT voto_tipovotante_FK FOREIGN KEY
(
tipovotante_id
)
REFERENCES tipovotante
(
id
)
ON
DELETE
  NO ACTION ON
UPDATE NO ACTION
GO


