CREATE DATABASE IF NOT EXISTS tienda2;

USE tienda2;

CREATE TABLE IF NOT EXISTS t_usuarios(
    id_usuario int(11) auto_increment NOT NULL,
    nombre     varchar(100)            NOT NULL,
    apellido   varchar(100)            NOT NULL,
    email      varchar(200)            NOT NULL,
    password   varchar(200)            NOT NULL,
    rol        varchar(20)             NOT NULL,
    imagen     varchar(200),
    CONSTRAINT pk_usuario PRIMARY KEY(id_usuario),
    CONSTRAINT uq_email   UNIQUE(email)
)ENGINE=InnoDb;

INSERT INTO t_usuarios VALUES(NULL, 'july', 'rodriguez', 'julynata199@gmail.com', '12345678', 'admin', 'imagen');


