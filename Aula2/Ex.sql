create database mercado_piva ;

use mercado_piva ;

create table fornecedor (
    cod_fornec int NOT NULL,
    nome varchar(40) NOT NULL,
    fone varchar(20),
    endereco varchar(40),
    cidade varchar(30) DEFAULT 'Birigui',
    estado char(2) DEFAULT 'SP',
    PRIMARY KEY (cod_fornec)
);

create table produto (
    cod_produto int auto_increment NOT NULL,
    nome varchar(40) NOT NULL,
    cod_fornec int NOT NULL,
    preco_uni NUMERIC(10.2),
    qtde int,
    PRIMARY KEY (cod_produto),
    CONSTRAINT fk_fornecedor_produto
        FOREIGN KEY (cod_fornec) REFERENCES fornecedor (cod_fornec)
);

INSERT INTO fornecedor (cod_fornec, nome, fone, endereco, cidade, estado) VALUES 
(344, 'Alimentos do Bem', 3345666, 'Rua Fundadores', 'São Paulo', 'SP'),
(78, 'Comidas', 8664545, 'Av dos Estados', 'Araçatuba', 'SP'),
(952, 'Rango Quente', 1327790, 'Rua Aclimação', 'Birigui', 'SP'),
(111, 'Quentinhas', 564434, 'Rua Teste', 'Belo Horizonte', 'MG');

INSERT INTO produto (cod_produto, nome, cod_fornec, preco_uni, qtde) VALUES 
(1, 'Arroz', 344, 20, 55),
(2, 'Feijão', 78, 16.5, 60),
(3, 'Macarrão', 78, 5, 15),
(4, 'Leite', 344, 3.5, 20),
(5, 'Farinha', 952, 5, 8);

select * from fornecedor ;

select * from produto ;

UPDATE fornecedor SET 
    nome = 'Foods'
WHERE cod_fornec = 78 ;

alter table fornecedor add email varchar(30) ;

select * from fornecedor where cod_fornec = 78 ;

UPDATE fornecedor SET 
    email = 'alimentos@gmail.com'
WHERE cod_fornec = 344 ; 

UPDATE fornecedor SET 
    email = 'quentinhas@gmail.com'
WHERE cod_fornec = 111 ; 

select * from fornecedor where cod_fornec in (111, 344) ;

alter table fornecedor drop email ;

UPDATE produto SET 
    qtde = 15
WHERE cod_produto = 1 ; 

select * from produto where cod_produto = 1 ;

select * from fornecedor ;

select nome from produto where preco_uni > 15 ;

select nome, cod_fornec from fornecedor where estado = 'SP' ;

-- PAREI AQUI
select nome from produto 

select cod_produto, nome from produto where cod_fornec = 78 ;

select cod_fornec, nome from fornecedor where cod_fornec < 100 and estado = 'SP' ;

UPDATE produto SET 
    nome = 'Leite desnatado'
WHERE cod_produto = 4 ; 

UPDATE produto SET 
    qtde = qtde - 1 ;