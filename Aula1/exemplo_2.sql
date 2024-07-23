create table caixa_postal (
    cod_postal varchar(8) NOT NULL,
    localidade varchar(45) NOT NULL,
    PRIMARY KEY (cod_postal)
):

create table pessoa (
    cod_pessoa int NOT NULL,
    cpf varchar(11) NOT NULL UNIQUE,
    nome varchar(60) NOT NULL,
    idade int check (idade > 0),
    cod_postal varchar(8) NOT NULL,
    PRIMARY KEY (cod_pessoa),
    FOREIGN KEY (cod_postal) REFERENCES
                             caixa_postal (cod_postal)
):

INSERT INTO pessoa (nome, cpf, idade, cod_postal)
VALUES ('José Benedito da Silva', );

INSERT INTO pessoa (nome, cpf, idade, cod_postal)
VALUES ('Maria Helena de Souza');

INSERT INTO pessoa (nome, cpf, idade, cod_postal)
VALUES (17800000, 'Flórida Paulista');

INSERT INTO pessoa (nome, cpf, idade, cod_postal)
VALUES (17800000, 'Flórida Paulista');

INSERT INTO caixa_postal (cod_postal, localidade)
VALUES (17830000, 'Adamantina');

INSERT INTO caixa_postal (cod_postal, localidade)
VALUES (16204278, 'Birigui');

INSERT INTO caixa_postal (cod_postal, localidade)
VALUES (17800000, 'Flórida Paulista');