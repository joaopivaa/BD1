-- EXIBIR O CÓDIGO E NOME DOS PRODUTOS COM A CATEGORIA INICIANDO EM 'SUPER'
SELECT prod.id, prod.name FROM products prod
    JOIN categories ctgr ON prod.id_categories = ctgr.id
WHERE ctgr.name LIKE 'super%';

-- EXIBIR AS CIDADES DOS FORNECEDORES EM ORDEM ALFABÉTICA
SELECT city FROM providers ORDER BY name;

-- ++ SEM REPETIR CIDADES
SELECT DISTINCT city FROM providers ORDER BY city ASC;

-- EXIBIR O MAIOR E MENOR PREÇO DOS PRODUTOS CADASTRADOS
SELECT MAX(price), MIN(price) FROM products;

-- EXIBIR TODAS AS CIDADES ONDE UMA LOCADORA POSSUI CLIENTES
SELECT city from customers;

-- EXIBIR O ID E NOME DOS FILMES QUE ESTEJAM COM O PREÇO MENOR QUE 2.0
SELECT m.id as id, m.name as name FROM movies m, prices p
WHERE m.id_prices = p.id AND p.value < 2.00 ;

-- EXIBIR A MÉDIA DE PREÇO DOS PRODUTOS, COM DUAS CASAS DECIMAIS DEPOIS DO PONTO
SELECT ROUND(AVG(price), 2) FROM products;

-- EXIBIR O ID E NOME DOS FILMES QUE SEJAM DO GÊNERO AÇÃO
SELECT m.id, m.name FROM movies m, genres g
WHERE m.id_genres = g.id AND g.description = 'Action' ;

-- EXIBIR O NOME DOS CLIENTES E A DATA DE ALOCAÇÃO DAS LOCAÇÕES REALIZADAS EM SETEMBRO
SELECT c.name, r.rentals_date FROM customers c, rentals r
WHERE c.id = r.id_customers AND r.rentals_date BETWEEN '2016-09-01' AND '2016-09-30' ;

                -- OU
SELECT c.name, r.rentals_date FROM customers c
    JOIN rentals r ON c.id = r.id_customers
WHERE r.rentals_date BETWEEN '2016-09-01' AND '2016-09-30' ;

-- EXIBIR O NOME E A QUANTIDADE DE PRODUTOS DE CADA CATEGORIA
SELECT c.name, SUM(p.amount) AS sum 
FROM products p
    JOIN categories c ON p.id_categories = c.id
GROUP BY c.id ;

                -- OU
SELECT c.name, SUM(p.amount) AS sum 
FROM products p, categories c 
WHERE p.id_categories = c.id
GROUP BY c.id ;