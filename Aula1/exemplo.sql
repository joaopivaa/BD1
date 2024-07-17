create database IFSP ;

use IFSP ;

create table cidade (
    id int auto_increment,
    nome varchar(100) NOT NULL,
    estado varchar(002) NOT NULL,
    PRIMARY KEY (id)
);

create table cliente (
    id int auto_increment,
    nome varchar(100) NOT NULL,
    email varchar(100) NOT NULL,
    id_cidade int,
    endereco varchar(100),
    numero int,
    bairro varchar(100),
    data_nasc DATETIME,
    PRIMARY KEY (id),
    CONSTRAINT fk_cliente_cidade
        FOREIGN KEY (id_cidade) REFERENCES cidade (id)
);