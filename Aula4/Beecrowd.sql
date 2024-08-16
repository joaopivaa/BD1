-- EXIBIR O NOME DOS PRODUTOS E DO FORNECEDOR, PARA OS PRODUTOS DO FORNECEDOR 'AJAX SA'
SELECT pd.name, pv.name
FROM products pd
INNER JOIN providers pv ON pv.id = pd.id_providers 
WHERE pv.name = 'Ajax SA' ;

-- EXIBIR O NOME DOS CLIENTES QUE SÃO PESSOAS JURÍDICAS
SELECT c.name
FROM customers c
INNER JOIN legal_person lp ON c.id = lp.id_customers;

-- EXIBIR O ID, A SENHA ATUAL, E A SENHA EM MD5 DE CADA USUÁRIO
SELECT id, password, MD5(password) AS MD5 from account ;

-- SUBSTITUIR TODO CARACTERE 'H1' POR 'X'
UPDATE virus SET name = REPLACE(name,'H1','X');
SELECT name FROM virus ;

-- SUBSTITUIR TODO CARACTERE 'H1' POR 'X' (OUTRA MANEIRA)
SELECT REPLACE(name,'H1', 'X') FROM virus ;

-- EXIBIR OS SALÁRIOS DOS MÉDICOS COM 1 CASA DECIMAL E ORDENAR EM ORDEM DECRESCENTE
SELECT d.name, ROUND(SUM((a.hours * 150) + ((ws.bonus * 0.01) * (a.hours * 150))), 1) AS salary
FROM doctors d
INNER JOIN attendances a ON d.id = a.id_doctor
INNER JOIN work_shifts ws ON a.id_work_shift = ws.id
GROUP BY d.name ORDER BY salary DESC;

-- EXIBIR O NOME DOS PRODUTOS E FORNECEDORES, ONDE O PRODUTO CUSTE MAIS QUE 1000 E SEJA DA CATEGORIA 'SUPER LUXURY'
SELECT pd.name, pv.name, pd.price
FROM products pd
INNER JOIN providers pv ON pv.id = pd.id_providers
INNER JOIN categories c ON c.id = pd.id_categories
WHERE pd.price > 1000  AND c.name = 'Super Luxury' ;

-- EXIBIR O NOME DO PRODUTO, FORNECEDOR E CATEGORIA DOS PRODUTOS DO FORNECEDOR 'SANSUS SA' COM A CATEGORIA 'IMPORTED'
SELECT pd.name, pv.name, c.name
FROM products pd
INNER JOIN providers pv ON pv.id = pd.id_providers
INNER JOIN categories c ON c.id = pd.id_categories
WHERE pv.name = 'Sansul SA' AND c.name = 'Imported';

-- EXIBIR O NOME DOS CLIENTES E O NÚMERO DO PEDIDO PARA TODOS FEITOS NO 1° SEMESTRE DE 2016
SELECT c.name, o.id
FROM orders o
INNER JOIN customers c ON c.id = o.id_customers
WHERE o.orders_date BETWEEN '2016-01-01' AND '2016-06-30' ;

-- EXIBIR O NOME DOS PRODUTOS COM QTD ENTRE 10 E 20 DO FORNECEDOR COM INICIAL P
SELECT pd.name
FROM products pd
INNER JOIN providers pv ON pv.id = pd.id_providers
WHERE pd.amount >= 10 AND pd.amount <= 20 AND pv.name LIKE 'P%';

-- EXIBIR A QUANTIDADE DE CIDADES QUE A EMPRESA ALCANÇOU
SELECT COUNT(DISTINCT city) FROM customers ;

-- EXIBIR A QUANTIDADE DE CARACTERES DE CADA NOME EM ORDEM DECRESCENTE SEGUNDO A QUANTIDADE
SELECT name, LENGTH(name) AS length FROM people ORDER BY length DESC;

-- EXIBIR O NOME DAS PESSOAS E O VALOR DA TAXA A SER PAGA AO GOVERNO, COM DUAS CASAS DECIMAIS
SELECT name, ROUND((salary * 0.1), 2) 
FROM people
WHERE salary > 3000 ; 

-- EXIBIR O VALOR MAIS FREQUENTE (MODA ESTATÍSTICA)
SELECT amount AS most_frequent_value
FROM value_table
GROUP BY amount ORDER BY COUNT(amount) DESC LIMIT 1;

-- EXIBIR O NOME DO TIME, NUM DE PARTIDAS, VIT, DER, EMP E PONTOS
SELECT t.name, COUNT(*) AS matches,
	-- VITÓRIAS
    SUM(CASE
        WHEN (m.team_1_goals > m.team_2_goals AND t.id = m.team_1)
		OR (m.team_2_goals > m.team_1_goals AND t.id = m.team_2) THEN 1 ELSE 0 END) AS victories,
    -- DERROTAS
    SUM(CASE
        WHEN (m.team_1_goals < m.team_2_goals AND t.id = m.team_1)
		OR (m.team_2_goals < m.team_1_goals AND t.id = m.team_2) THEN 1 ELSE 0 END) AS defeats,
    -- EMPATES
    SUM(CASE
	    WHEN (m.team_1_goals = m.team_2_goals)
		THEN 1 ELSE 0 END) AS draws,
    -- PONTUAÇÃO
    SUM(CASE
        WHEN (m.team_1_goals = m.team_2_goals) THEN 1
        WHEN (m.team_1_goals > m.team_2_goals AND t.id = m.team_1)
		OR (m.team_2_goals > m.team_1_goals AND t.id = m.team_2) THEN 3 ELSE 0 END) AS score
FROM matches m
INNER JOIN teams t ON t.id = m.team_1 OR t.id = m.team_2 
GROUP BY t.name ORDER BY score DESC;

-- EXIBIR O CPF, NOME DO DEPARTAMENTO E DOS EMPREGADOS QUE NÃO TRABALHAM EM UM PROJETO
SELECT e.cpf, e.enome, d.dnome 
FROM empregados e
LEFT JOIN trabalha t ON e.cpf = t.cpf_emp
INNER JOIN departamentos d ON e.dnumero = d.dnumero
WHERE t.pnumero IS NULL
ORDER BY e.cpf;

-- EXIBIR NOME DOS CANDIDATOS E SUA PONTUAÇÃO FINAL, ORDENANDO A LISTAGEM PELOS RESULTADOS
SELECT c.name, ROUND(((s.math*2) + (s.specific*3) + (s.project_plan*5))/10.0,2) AS avg
FROM candidate c
INNER JOIN score s ON s.candidate_id = c.id
ORDER BY avg DESC ;