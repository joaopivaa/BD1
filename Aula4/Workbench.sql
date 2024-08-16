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

-- EXIBE TODOS OS CURSOS
SELECT * FROM curso ;

-- EXIBE TODOS OS ALUNOS 
SELECT * FROM aluno ;

-- EXIBE NOME E ANO DOS CURSOS
SELECT nome, ano FROM curso ;

-- EXIBE CARGA HORÁRIA, NOME E DESCRIÇÃO DOS CURSOS COM CARGA HORÁRIA MAIOR QUE 100
SELECT carga_horaria, nome, descricao FROM curso
WHERE carga_horaria > 100;

-- EXIBE O ID, NOME E CARGA HORÁRIA DOS CURSOS DO ANO DE 2021 COM CARGA MENOR OU IGUAL A 100
SELECT id, nome, carga_horaria FROM curso
WHERE ano = 2021 
    AND carga_horaria <= 100;

-- EXIBE OS CURSOS SEM DESCRIÇÃO
SELECT descricao FROM curso 
WHERE descricao IS NULL;

-- EXIBE OS CURSOS COM CARGA HORÁRIA ENTRE 50 E 150
SELECT carga_horaria FROM curso
WHERE carga_horaria >= 50 AND carga_horaria <= 150;

-- EXIBE NOME E MATRÍCULA DOS ALUNOS 2, 5 E 8
SELECT nome, matricula FROM aluno
WHERE matricula IN (2, 5, 8);

-- EXIBE OS CURSOS COM 'DADOS' NO SEU NOME
SELECT * FROM curso
WHERE nome  LIKE '%dados%';

-- EXIBE OS ALUNOS COM 'A' NA SEGUNDA LETRA DO NOME
SELECT * FROM aluno
WHERE nome LIKE '_a%';

-- EXIBE NOME E MATRÍCULA DOS ALUNOS EM ORDEM ALFABÉTICA
SELECT nome, matricula FROM aluno
ORDER BY nome ASC;

-- EXIBE OS CURSOS EM ORDEM DECRESCENTE DE NOME
SELECT * FROM curso
ORDER BY nome DESC;

-- EXIBE NOME E ANO DOS CURSOS ENTRE 2022 E 2023 POR ANO DECRESCENTE E NOME ASCENDENTE
SELECT nome, ano FROM curso
WHERE ano IN (2022, 2023)
ORDER BY ano DESC
AND ORDER BY nome ASC;

-- EXIBE NOME E CIDADE DOS ALUNOS SEM CURSO
SELECT nome, cidade FROM aluno
WHERE id_curso IS NULL;

-- EXIBE ALUNOS COM NOME TERMINADO EM 'O' COM OS CURSOS 1, 3, 6 E 8
SELECT * FROM aluno
WHERE nome LIKE '%o'
AND id_curso IN (1, 3, 6, 8);

-- EXIBE O NOME DO ALUNO E O NOME DO SEU CURSO 
SELECT a.nome, c.nome
FROM aluno a
INNER JOIN curso c ON c.id = a.id_curso ; 

-- EXIBE NOME DO CURSO, CARGA, NOME E CIDADE DO ALUNO COM CARGA MENOR QUE 100 
SELECT c.nome, c.carga_horaria, a.nome, a.cidade
FROM aluno a
INNER JOIN curso c ON c.id = a.id_curso 
WHERE carga_horaria < 100 ;

-- EXIBE NOME E DESCRIÇÃO DO CURSO, NOME E DT_NASC DO ALUNO COM LETRA 'R' NO NOME EM ORDEM DECRESCENTE DE MATRÍCULA
SELECT c.nome, c.descricao, a.nome, a.dt_nascimento
FROM aluno a
INNER JOIN curso c ON c.id = a.id_curso
WHERE a.nome LIKE '%r%'
ORDER BY a.matricula DESC; 

-- EXIBE QUANTOS CURSOS TEM CADASTRADOS
SELECT COUNT(*) AS QUANTIDADE FROM curso ;

-- EXIBE AS CIDADES COM NOMES DISTINTOS
SELECT DISTINCT cidade FROM aluno ;

-- EXIBE AS CARGAS HORÁRIAS SEM REPETIÇÃO
SELECT DISTINCT carga_horaria FROM curso ORDER BY carga_horaria ASC;

-- EXIBE A MAIOR E MENOR CARGA HORÁRIA
SELECT MAX(carga_horaria) AS MAIOR, MIN(carga_horaria) AS MENOR FROM curso ;

-- EXIBE A MÉDIA ENTRE AS CARGAS HORÁRIAS
SELECT AVG(carga_horaria) AS MEDIA FROM curso;