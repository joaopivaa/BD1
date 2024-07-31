-- CRIAÇÃO DO BANCO DE DADOS
create database clube ;

-- SELECIONANDO O BANCO DE DADOS
use clube ;

-- CRIAÇÃO DA TABELA SÓCIO
create table socio (
    cod_socio int auto_increment,
    nome varchar(60) NOT NULL,
    endereco varchar(50),
    cidade varchar(30) DEFAULT 'Birigui',
    estado char(2) DEFAULT 'SP',
    cep varchar(9),
    fone varchar(15),
    dt date NOT NULL,
    PRIMARY KEY (cod_socio)
);

-- CRIAÇÃO DA TABELA DEPENDENTE
create table dependente (
    cod_socio int NOT NULL,
    sequencial int NOT NULL,
    nome varchar(60) NOT NULL,
    parentesco varchar(15),
    data_nasc date,
    PRIMARY KEY (cod_socio, sequencial),
    CONSTRAINT fk_socio_dependente
        FOREIGN KEY (cod_socio) REFERENCES socio (cod_socio)
);

-- INSERINDO SÓCIOS NA TABELA SOCIO
INSERT INTO socio (nome, endereco, cidade, estado, cep, fone, dt) VALUES 
('João Santos', 'Rua das Orquideas, 123', 'Birigui', 'SP', '16200-000', '(18) 99999-0001', '2024-01-01'),
('Maria Oliveira', 'Rua Bento da Cruz, 456', 'Garulhos', 'SP', '16200-001', '(18) 99999-0002', '2024-02-01'),
('Carlos Canabarra', 'Rua Castidade, 789', 'Birigui', 'SP', '16200-002', '(18) 99999-0003', '2024-03-01');

-- INSERINDO DEPENDENTES PARA O SÓCIO 1 (João Santos)
INSERT INTO dependente (cod_socio, sequencial, nome, parentesco, data_nasc) VALUES 
(1, 1, 'Ana Silva', 'Neta', '2010-05-10'),
(1, 2, 'Pedro Silva', 'Filho', '2012-07-15');

-- INSERINDO DEPENDENTES PARA O SÓCIO 2 (Maria Oliveira)
INSERT INTO dependente (cod_socio, sequencial, nome, parentesco, data_nasc) VALUES 
(2, 1, 'Beatriz Oliveira', 'Filha', '2011-09-20'),
(2, 2, 'Lucas Oliveira', 'Filha', '2014-11-30');

-- INSERINDO DEPENDENTES PARA O SÓCIO 3 (Carlos Canabarra)
INSERT INTO dependente (cod_socio, sequencial, nome, parentesco, data_nasc) VALUES 
(3, 1, 'Gabriel Souza', 'Primo', '2013-03-25'),
(3, 2, 'Laura Souza', 'Neta', '2016-06-05');

-- VISUALIZAR SÓCIOS DA TABELA SOCIO
SELECT * FROM socio;

-- VISUALIZAR DEPENDENTES DA TABELA DEPENDENTES
SELECT * FROM dependente;

-- ATUALIZANDO VALORES DO ÚLTIMO SÓCIO CADASTRADO
UPDATE socio SET 
    nome = 'Carlos Alberto'
WHERE cod_socio = (SELECT MAX(cod_socio) FROM socio);