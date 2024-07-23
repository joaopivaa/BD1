-- CRIAÇÃO DO BANCO DE DADOS
create database IFSP ;
DEFAULT CHARSET = utf8 ;
DEFAULT COLLATE = utf8_general_ci ;

-- SELECIONANDO O BANCO DE DADOS
use IFSP ;

-- CRIAÇÃO DA TABELA CIDADE
create table cidade (
    id int auto_increment,
    nome varchar(100) NOT NULL,
    estado varchar(002) NOT NULL,
    PRIMARY KEY (id)
);

-- CRIAÇÃO DA TABELA CLIENTE
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


-- INSERINDO VALORES NA TABELA CIDADE
INSERT INTO cidade (nome, estado)
VALUES ('Birigui', 'SP');

-- INSERINDO VALORES NA TABELA CIDADE
INSERT INTO cidade (id, nome, estado)
VALUES (10, 'Coroados', 'SP');

-- INSERINDO VALORES NA TABELA CIDADE
INSERT INTO cidade (id, nome, estado)
VALUES (100, 'Lucélia', 'SP');

-- INSERINDO VALORES NA TABELA CLIENTE
INSERT INTO cliente (nome, email, id_cidade, endereco, numero, bairro, data_nasc)
VALUES ('Murilo Silva', 'murilo@gmail.com', 10, 'Rua Pedro Cavalo', 750, 'Portal da Perola', '1963-08-10');

-- INSERINDO VALORES NA TABELA CLIENTE
INSERT INTO cliente (nome, email, id_cidade, endereco, numero, bairro, data_nasc)
VALUES ('Cássio Neto', 'cassioneto@gmail.com', 10, 'Rua Tiradentes', 20, 'Campos Limpos', '1983-12-5');

-- VISUALIZAR VALORES DA TABELA CIDADE
select * from cidade ;

--ATUALIZANDO VALORES NA TABELA CIDADE
UPDATE cidade SET 
    nome = 'Belo Horizonte',
    estado = 'MG'
WHERE id = 1 ;

--ATUALIZANDO VALORES NA TABELA CIDADE
UPDATE cliente SET 
    nome = 'Cocão',
    email = 'cocao@gmail.com',
    id_cidade = 100
WHERE id = 2 ;


-- DELETAR O BANCO
drop database IF EXISTS ifsp ;