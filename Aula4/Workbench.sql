-- SELECT f.nome, c.descricao, c.salario, ci.nome
-- FROM funcionario f, cargo c, cidade ci
-- WHERE f.idcargo = c.idcargo AND f.idcidade = ci.idcidade;

-- SELECT * FROM produto LIMIT 4 ;

-- SELECT f.nome, ci.nome, cp.valor, cp.situacao
-- FROM fornecedor f, cidade ci, contapagar cp
-- WHERE f.idcidade = ci.idcidade AND cp.idfornecedor = f.idfornecedor;

-- SELECT f.nome, ci.nome, cp.valor, cp.situacao
-- FROM contapagar cp
-- INNER JOIN fornecedor f ON f.idfornecedor = cp.idfornecedor
-- INNER JOIN cidade ci ON f.idcidade = ci.idcidade
-- WHERE cp.situcao = 'Aberto' ;


SELECT * FROM curso ;

SELECT * FROM aluno ;

SELECT nome, ano FROM curso ;

SELECT carga_horaria, nome, descricao FROM curso
WHERE carga_horaria > 100;

SELECT id, nome, carga_horaria FROM curso
WHERE ano = 2021 AND carga_horaria <= 100;

SELECT descricao FROM curso 
WHERE  descricao IS NULL;

SELECT carga_horaria FROM curso
WHERE carga_horaria >= 50 AND carga_horaria <= 150;

SELECT nome, matricula FROM aluno
WHERE matricula IN (2, 5, 8);

SELECT * FROM curso
WHERE nome  LIKE '%dados%';

SELECT * FROM aluno
WHERE nome LIKE '_a%';

SELECT nome, matricula FROM aluno
ORDER BY nome ASC;

SELECT * FROM curso
ORDER BY nome DESC;

SELECT nome, ano FROM curso
WHERE ano IN (2022, 2023)
ORDER BY ano DESC
AND ORDER BY nome ASC;

SELECT nome, cidade FROM aluno
WHERE id_curso IS NULL;

SELECT * FROM aluno
WHERE nome LIKE '%o'
AND id_curso IN (1, 3, 6, 8);

SELECT a.nome, c.nome
FROM aluno a
INNER JOIN curso c ON c.id = a.id_curso ; 

SELECT c.nome, c.carga_horaria, a.nome, a.cidade
FROM aluno a
INNER JOIN curso c ON c.id = a.id_curso 
WHERE carga_horaria < 100 ;

SELECT c.nome, c.descricao, a.nome, a.dt_nascimento
FROM aluno a
INNER JOIN curso c ON c.id = a.id_curso
WHERE a.nome LIKE '%r%'
ORDER BY a.matricula DESC; 

18) Buscar nome e a descrição do curso, nome e a dt de nascimento do aluno
no qual o nome do aluno tem a letra r no nome, ordenado por matricula 
decrescente
19) Buscar a quantidade de cursos cadastrados
20) Listar as cidades dos alunos sem repetições dos nomes da cidade
21) Listar todas as cargas horárias cadastradas sem repetições
22) Buscar a maior e a menor carga horária cadastrada
23) Buscar a média das cargas horárias