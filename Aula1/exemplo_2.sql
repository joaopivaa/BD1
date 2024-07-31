create database ifsp ;

use ifsp ;

create table caixa_postal (
    cod_postal varchar(8) NOT NULL,
    localidade varchar(45) NOT NULL,
    PRIMARY KEY (cod_postal)
):

create table pessoa (
    cod_pessoa int auto_increment NOT NULL,
    cpf varchar(11) NOT NULL UNIQUE,
    nome varchar(60) NOT NULL,
    idade integer check (idade > 0),
    cod_postal varchar(8) NOT NULL,
    PRIMARY KEY (cod_pessoa),
    FOREIGN KEY (cod_postal) REFERENCES
                             caixa_postal (cod_postal)
):

create table telefone (
    cod_pessoa integer NOT NULL,
    tel_residencial varchar(15),
    tel_celular varchar(15),
    tel_comercial varchar(15),
    tel_recado varchar(15) NOT NULL,
    PRIMARY KEY (cod_pessoa),
    FOREIGN KEY (cod_pessoa) REFERENCES pessoa (cod_pessoa)
);

INSERT INTO caixa_postal (cod_postal, localidade)
VALUES (17830000, 'Adamantina');

INSERT INTO caixa_postal (cod_postal, localidade)
VALUES (16204278, 'Birigui');

INSERT INTO caixa_postal (cod_postal, localidade)
VALUES (17800000, 'Flórida Paulista');

INSERT INTO pessoa (nome, cpf, idade, cod_postal)
VALUES ('José Benedito da Silva', 10044455500, 39, 17830000);

INSERT INTO pessoa (nome, cpf, idade, cod_postal)
VALUES ('Maria Helena de Souza', 20044455500, 35, 17800000);

INSERT INTO pessoa (nome, cpf, idade, cod_postal)
VALUES ('Cristiane Pereira', 30044455500, 25, 16204278);

INSERT INTO telefone (cod_pessoa, tel_residencial)