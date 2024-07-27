-- CRIAÇÃO DO BANCO DE DADOS
CREATE DATABASE mercado_piva ;

-- SELECIONANDO O BANCO DE DADOS
USE mercado_piva ;

-- CRIAÇÃO DA TABELA FORNECEDOR
CREATE TABLE fornecedor (
    cod_fornec int NOT NULL,
    nome varchar(40) NOT NULL,
    fone varchar(20),
    endereco varchar(40),
    cidade varchar(30) DEFAULT 'Birigui',
    estado char(2) DEFAULT 'SP',
    PRIMARY KEY (cod_fornec)
);

-- CRIAÇÃO DA TABELA PRODUTO
CREATE TABLE produto (
    cod_produto int auto_increment NOT NULL,
    nome varchar(40) NOT NULL,
    cod_fornec int NOT NULL,
    preco_uni NUMERIC(10,2),
    qtde int,
    PRIMARY KEY (cod_produto),
    CONSTRAINT fk_fornecedor_produto
        FOREIGN KEY (cod_fornec) REFERENCES fornecedor (cod_fornec)
);

-- INSERINDO FORNECEDORES NA TABELA FORNECEDOR
INSERT INTO fornecedor (cod_fornec, nome, fone, endereco, cidade, estado) VALUES 
(344, 'Alimentos do Bem', 3345666, 'Rua Fundadores', 'São Paulo', 'SP'),
(78, 'Comidas', 8664545, 'Av dos Estados', 'Araçatuba', 'SP'),
(952, 'Rango Quente', 1327790, 'Rua Aclimação', 'Birigui', 'SP'),
(111, 'Quentinhas', 564434, 'Rua Teste', 'Belo Horizonte', 'MG');

-- INSERINDO PRODUTOS NA TABELA PRODUTOS
INSERT INTO produto (cod_produto, nome, cod_fornec, preco_uni, qtde) VALUES 
(1, 'Arroz', 344, 20, 55),
(2, 'Feijão', 78, 16.5, 60),
(3, 'Macarrão', 78, 5, 15),
(4, 'Leite', 344, 3.5, 20),
(5, 'Farinha', 952, 5, 8);

-- VISUALIZAR FORNECEDORES DA TABELA FORNECEDOR
SELECT * FROM fornecedor ;

-- VISUALIZAR PRODUTOS DA TABELA PRODUTOS
SELECT * FROM produto ;

-- ATUALIZANDO O NOME DO FORNECEDOR COMIDAS PARA FOODS
UPDATE fornecedor SET 
    nome = 'Foods'
WHERE cod_fornec = 78 ;

-- ADICIONANDO O CAMPO EMAIL NA TABELA FORNECEDOR
ALTER TABLE fornecedor ADD email varchar(30) ;

-- SELECIONANDO O FORNECEDOR COM O CÓDIGO 78 
SELECT * FROM fornecedor WHERE cod_fornec = 78 ;

-- ADICIONANDO O EMAIL DO FORNECDOR DE CÓDIGO 344
UPDATE fornecedor SET 
    email = 'alimentos@gmail.com'
WHERE cod_fornec = 344 ; 

-- ADICIONANDO O EMAIL DO FORNECDOR DE CÓDIGO 111
UPDATE fornecedor SET 
    email = 'quentinhas@gmail.com'
WHERE cod_fornec = 111 ; 

-- VISUALIZAR OS FORNECEDORES DOS CÓDIGOS ACIMA
SELECT * FROM fornecedor WHERE cod_fornec IN (111, 344) ;

-- EXCLUINDO O CAMPO ENDERECO DOS FORNECEDORES
ALTER TABLE fornecedor DROP endereco ;

-- ATUALIZANDO A QUANTIDADE DO PRODUTO DO ARROZ
UPDATE produto SET 
    qtde = 15
WHERE cod_produto = 1 ; 

-- VISUALIZAR OS VALORES DE ARROZ
SELECT * FROM produto WHERE cod_produto = 1 ;

-- VISUALIZAR TODOS OS FORNECEDORES
SELECT * FROM fornecedor ;

-- VISUALIZAR O NOME DOS PRODUTOS COM PREÇO MAIOR QUE 15
SELECT nome FROM produto WHERE preco_uni > 15 ;

-- VISUALIZAR NOME E COD DOS FORNECEDORES DO ESTADO DE SP
SELECT nome, cod_fornec FROM fornecedor WHERE estado = 'SP' ;

-- VISUALIZAR NOME E O TOTAL DE CADA PRODUTO
SELECT nome, preco_uni * qtde AS total FROM produto ;

-- VISUALIZAR O COD E NOME DO PRODUTO DE COD 78
SELECT cod_produto, nome FROM produto WHERE cod_fornec = 78 ;

-- VISUALIZAR O COD E NOME DO FORNECEDOR DE COD MENOR QUE 100 E DO ESTADO DE SP
SELECT cod_fornec, nome FROM fornecedor WHERE cod_fornec < 100 AND estado = 'SP' ;

-- ATUALIZANDO O NOME DO PRODUTO DE COD 4
UPDATE produto SET 
    nome = 'Leite desnatado'
WHERE cod_produto = 4 ; 

-- ATUALIZANDO A QUANTIDADE DE CADA PRODUTO
UPDATE produto SET 
    qtde = qtde - 1 ;

-- VISUALIZAR NOME E QUANTIDADE DE TODOS OS PRODUTOS
SELECT nome, qtde FROM produto ;

-- ADICIONANDO O CAMPO PAIS PARA A TABELA FORNECEDOR
ALTER TABLE fornecedor ADD pais varchar(30);

-- ATUALIZANDO O PAIS DE TODOS OS FORNECEDORES PARA BRASIL
UPDATE fornecedor SET
    pais = 'Brasil';

-- VISUALIZAR O COD, NOME E PAIS DE TODOS OS FORNECEDORES
SELECT cod_fornec, nome, pais FROM fornecedor ;

-- INSERINDO UM FORNECEDOR ESTRANGEIRO
INSERT INTO fornecedor (cod_fornec, nome, fone, cidade, estado, email, pais) VALUES
(572, 'Urubu do Pix', 3245669, 'Gana','CA', 'jorge@hotmail.com', 'Angola');

-- EXCLUINDO TODOS OS FORNCEDORES BRASILEIROS QUE NÃO SÃO DO ESTADO DE SP
DELETE FROM fornecedor WHERE pais = 'Brasil' AND estado != 'SP';


-- OUTRO BANCO DE DADOS --

-- CRIAÇÃO DO BANCO DE DADOS
CREATE DATABASE escritorio_piva ;

-- SELECIONANDO O BANCO DE DADOS
USE escritorio_piva ;

-- CRIAÇÃO DA TABELA DEPARTAMENTO
CREATE TABLE departamento (
    num_depto INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100),
    localizacao VARCHAR(100)
);

-- CRIAÇÃO DA TABELA GERENTE
CREATE TABLE gerente (
    cod_gerente INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(40),
    num_depto INT,
    CONSTRAINT fk_gerente_departamento
        FOREIGN KEY (num_depto) REFERENCES departamento (num_depto)
);

-- CRIAÇÃO DA TABELA EMPREGADO
CREATE TABLE empregado (
    cod_emp INT PRIMARY KEY AUTO_INCREMENT,
    nome varchar(40),
    endereco varchar(40),
    cidade varchar(30),
    estado char(2),
    fone varchar(20),
    dt_admissao DATE, 
    num_depto INT,
    salario DECIMAL(10,2),
    CONSTRAINT fk_empregado_departamento
        FOREIGN KEY (num_depto) REFERENCES departamento (num_depto)
);

-- CRIAÇÃO DA TABELA PROJETO
CREATE TABLE projeto (
    num_projeto INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100),
    descricao VARCHAR(250),
    num_depto int,
    CONSTRAINT fk_projeto_departamento
        FOREIGN KEY (num_depto) REFERENCES departamento (num_depto)
);

-- CRIAÇÃO DA TABELA TRABALHA EM
CREATE TABLE trabalha_Em (
    cod_emp INT,
    num_projeto INT,
    total_horas_semanais DECIMAL(4,2),
    PRIMARY KEY (cod_emp, num_projeto),
    CONSTRAINT fk_empregado_trabalha
        FOREIGN KEY (cod_emp) REFERENCES empregado (cod_emp),
    CONSTRAINT fk_projeto_trabalha
        FOREIGN KEY (num_projeto) REFERENCES projeto (num_projeto)
);

-- INSERINDO DEPARTAMENTOS NA TABELA DEPARTAMENTO
INSERT INTO departamento (nome, localizacao) VALUES
('Recursos Humanos', 'Bloco A'),
('Desenvolvimento', 'Bloco B'),
('Marketing', 'Bloco C');

-- INSERINDO GERENTES NA TABELA GERENTE
INSERT INTO gerente (nome, num_depto) VALUES
('Luva de Pedreiro', 1),
('Senhor dos Aneis', 2),
('Amostradinho', 3);

-- INSERINDO EMPREGADOS NA TABELA EMPREGADOS
INSERT INTO empregado (nome, endereco, cidade, estado, fone, dt_admissao, num_depto, salario) VALUES
('Cristiano Ronaldo', 'Rua Aclimação , Nº 27', 'Guarulhos', 'SP', '(18) 11111-1111', '2020-01-15', 1, 3245.73),
('John Kennedy', 'Av dos Estados, Nº 892', 'Parati', 'RJ', '(11) 22222-2222', '2019-06-01', 2, 4329.98),
('Kaik Rocha', 'Rua Fundadores, Nº 71', 'Belo Horizonte', 'MG', '(31) 33333-3333', '2021-03-20', 3, 3817.31);

-- INSERINDO PROJETOS NA TABELA PROJETO
INSERT INTO projeto (nome, descricao, num_depto) VALUES
('GymFit', 'Desenvolvimento de software', 2),
('Atrações Fodas', 'Campanha de marketing', 3),
('Jubileu na Turquia', 'Treinamento de RH', 1);

-- INSERINDO VALORES NA TABELA TRABALHA_EM
INSERT INTO trabalha_Em (cod_emp, num_projeto, total_horas_semanais) VALUES
(1, 3, 20),
(2, 1, 30),
(3, 2, 25);

-- VISUALIZAR NOME E LOCALIZACAO DOS DEPARTAMENTOS
SELECT nome, localizacao FROM departamento ;

-- VISUALIZAR OS DADOS DE EMPREGADOS COM SALARIO MAIOR OU IGUAL A 3000
SELECT * FROM empregado WHERE salario >= 3000 ;

-- VISUALIZAR O NOME DOS GERENTES
SELECT nome FROM gerente ;

-- VISUALIZAR O NOME, SALARIO E SALARIO ATUALIZADO NA TABELA EMPREGADO
SELECT nome, salario, salario + (salario * 0.10) AS 'salario atualizado' FROM empregado ;

-- ATUALIZAR O SALARIO DE TODOS OS EMPREGADOS EM 10%
UPDATE empregado SET
    salario = salario + (salario * 0.10) ;

-- ADICIONAR O CAMPO TIPO_PROJETO NA TABELA PROJETO
ALTER TABLE projeto ADD tipo_projeto VARCHAR(15);

-- ADICIONAR VALORES EM TIPO_PROJETO PARA TODOS OS PROJETOS
UPDATE projeto SET
    tipo_projeto = 'grande';