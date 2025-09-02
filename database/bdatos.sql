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

CREATE TABLE IF NOT EXISTS t_categorias(
    id_categoria         int(11) auto_increment NOT NULL,
    nombre_categoria     varchar(200)           NOT NULL,
    CONSTRAINT pk_categoria PRIMARY KEY(id_categoria)
)ENGINE=InnoDb;

INSERT INTO t_categorias VALUES(NULL, 'construccion'), (NULL, 'electricos'), (NULL, 'pinturas'), (NULL, 'pisos');

CREATE TABLE IF NOT EXISTS t_productos(
    id_producto         int(11) auto_increment  NOT NULL,
    nombre_producto     varchar(100)            NOT NULL,
    stock               int(100)                NOT NULL,
    precio              float(10,2)             NOT NULL,
    imagen              varchar(255)            NOT NULL,
    oferta              int(200)                NOT NULL,
    id_categoria        int(11)                 NOT NULL,
    descripcion         varchar(100)            NOT NULL,
    fecha               DATE                    NOT NULL,
    CONSTRAINT pk_producto PRIMARY KEY(id_producto),
    CONSTRAINT fk_producto_categoria FOREIGN KEY(id_categoria) REFERENCES t_categorias(id_categoria)
)ENGINE=InnoDb;

CREATE TABLE IF NOT EXISTS t_pedidos(
    id_pedido           int(11) auto_increment  NOT NULL,
    id_usuario          int(11)                 NOT NULL,
    fecha               DATE                    NOT NULL,
    hora                TIME                    NOT NULL,
    cuidad              varchar(100)            NOT NULL,
    direccion           varchar(255)            NOT NULL,
    costo               float(10,2)             NOT NULL,
    estado              varchar(20)             NOT NULL,
    
    CONSTRAINT pk_pedido PRIMARY KEY(id_pedido),
    CONSTRAINT fk_pedido_usuario FOREIGN KEY(id_usuario) REFERENCES t_usuarios(id_usuario)
)ENGINE=InnoDb;

CREATE TABLE IF NOT EXISTS t_detalle_pedidos(
    id_detalle          int(11) auto_increment  NOT NULL,
    id_pedido           int(11)                 NOT NULL,
    id_producto         int(11)                 NOT NULL,
    unidades            int(100)                NOT NULL,
    precio              float(10,2)             NOT NULL,
    
    CONSTRAINT pk_detalle_pedidos PRIMARY KEY(id_detalle),
    CONSTRAINT fk_detalle_pedidos FOREIGN KEY(id_pedido) REFERENCES t_pedidos(id_pedido),
    CONSTRAINT fk_detalle_productos FOREIGN KEY(id_producto) REFERENCES t_productos(id_producto)
)ENGINE=InnoDb;


    