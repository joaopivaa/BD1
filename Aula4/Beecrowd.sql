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

-- EXIBIR A TEMPERATURA E NÚMERO DE REGISTROS CORRESPONDENTES
SELECT temperature, COUNT(mark) AS number_of_records
FROM records
GROUP BY mark, temperature ORDER BY mark ;

-- EXIBIR O NOME E O DIA DO MÊS EM QUE OS CLIENTES DEVEM PAGAR SUAS PARCELAS
SELECT name, CAST((EXTRACT(DAY FROM payday)) as INT) AS day FROM loan ;

-- EXIBIR 'PODIUM: ' PARA OS 3 PRIMEIROS COLOCADOS, E 'DEMOTED:' PARA OS DOIS ÚLTIMOS DA LIGA
SELECT CONCAT('Podium: ', team) AS name 
FROM league WHERE position IN (SELECT position FROM league ORDER BY position LIMIT 3)
            UNION ALL
SELECT CONCAT('Demoted: ', team) AS name
FROM league WHERE position IN (SELECT position FROM league ORDER BY position DESC LIMIT 2);

-- EXIBIR O NOME DOS PRODUTOS E DA CATEGORIA DOS PRODUTOS QUE TENHAM A QTD MAIOR QUE 100 E DOS SEGUINTES CODS
SELECT p.name, c.name 
FROM products p
INNER JOIN categories c ON c.id = p.id_categories
WHERE p.amount > 100 AND c.id IN (1, 2, 3, 6, 9)
ORDER BY c.id;

-- EXIBIR TODOS OS RICHARDS DAS DIMENSÕES C875 E C774 JUNTO DA PROBABILIDADE DE EXISTÊNCIA (FATOR N)
SELECT lr.name, ROUND((lr.omega * 1.618), 3) AS "Fator N"
FROM life_registry lr
INNER JOIN dimensions d ON d.id = lr.dimensions_id
WHERE d.name IN ('C875', 'C774') AND lr.name LIKE '%Richard%' 
ORDER BY lr.omega ;

-- APLICAR A MÁSCARA PARA TODOS OS CPF'S DOS CLIENTES
SELECT 
    CONCAT(
        SUBSTRING(cpf, 1, 3), '.', 
        SUBSTRING(cpf, 4, 3), '.', 
        SUBSTRING(cpf, 7, 3), '-', 
        SUBSTRING(cpf, 10, 2)
    ) AS CPF
FROM 
    natural_person;

-- EXIBIR O ANO E NOME DOS CLIENTES QUE MOVIMENTARAM PACOTES AZUIS OU DO ANO DE 2015, COM OS ENDEREÇOS SENDO DIFERENTES DE TAIWAN
SELECT p.year, sender.name AS sender, receiver.name AS receiver
FROM packages p
INNER JOIN users AS sender ON p.id_user_sender = sender.id
INNER JOIN users AS receiver ON p.id_user_receiver = receiver.id
WHERE (p.color = 'blue' OR p.year = 2015)
AND (sender.address != 'Taiwan' AND receiver.address != 'Taiwan')
ORDER BY p.year DESC ;

-- EXIBIR O ID E NOME DOS CLIENTES SEM LOCAÇÃO COM ORDENAÇÃO POR ID
SELECT c.id, c.name FROM customers c 
LEFT JOIN locations l ON c.id = l.id_customers
WHERE l.id_customers IS NULL
ORDER BY c.id ;

-- EXIBIR O NOME DOS ALUNOS APROVADOS E SUA NOTA
SELECT CONCAT('Approved: ', name) AS name, grade FROM students
WHERE grade >= 7
ORDER BY grade DESC ; 

-- EXIBIR O ADVOGADO COM MAIS E MENOS CLIENTES, E A MÉDIA DE CLIENTES TOTAL
SELECT name, customers_number
FROM lawyers
WHERE customers_number = (SELECT MAX(customers_number) FROM lawyers)
    UNION ALL
SELECT name, customers_number
FROM lawyers
WHERE customers_number = (SELECT MIN(customers_number) FROM lawyers)
    UNION ALL
SELECT 'Average' AS name, ROUND(AVG(customers_number), 0) AS customers_number
FROM lawyers;

-- EXIBIR NOME DO DEPARTAMENTOS E SUAS DIVISÕES, ALÉM DA MÉDIA SALARIAL E MAIOR SALÁRIO DE CADA DIVISÃO
SELECT
    d.nome AS Departamento,
    div.nome AS Divisao,
    ROUND(AVG(tsalario.salario - tdescontos.descontos), 2) AS media,
    ROUND(MAX(tsalario.salario - tdescontos.descontos), 2) AS maior
FROM departamento d
INNER JOIN divisao div ON d.cod_dep = div.cod_dep
INNER JOIN empregado emp ON div.cod_divisao = emp.lotacao_div
INNER JOIN ( 
             SELECT emp.matr, COALESCE(SUM(v.valor), 0) AS salario
             FROM empregado emp
             LEFT JOIN emp_venc ON emp.matr = emp_venc.matr
             LEFT JOIN vencimento v ON emp_venc.cod_venc = v.cod_venc
             GROUP BY emp.matr
           ) 
             AS tsalario ON emp.matr = tsalario.matr
INNER JOIN (
             SELECT emp.matr, COALESCE(SUM(desconto.valor), 0) AS descontos
             FROM empregado emp
             LEFT JOIN emp_desc ON emp.matr = emp_desc.matr
             LEFT JOIN desconto ON emp_desc.cod_desc = desconto.cod_desc
             GROUP BY emp.matr
           ) 
             AS tdescontos ON emp.matr = tdescontos.matr
GROUP BY div.cod_divisao, div.nome, d.nome
ORDER BY media DESC;

-- EXIBIR NOME DO DEPARTAMENTO, NOME DA DIVISÃO COM A MAIOR MÉDIA SALARIAL E A MÉDIA DA DIVISÃO
