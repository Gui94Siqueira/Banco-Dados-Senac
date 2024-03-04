-----------------------
-- Consultas Básicas
-----------------------

SELECT * FROM ALUNO;

-- SELECT
-- FROM
-- WHERE
-- ORDER BY

SELECT *
FROM aluno
WHERE matricula > 3;

SELECT *
FROM aluno
WHERE matricula > 3
ORDER BY nome;

-- Operadores Matematicos e Lógicos

SELECT * FROM disciplina;

SELECT nome, horas
FROM disciplina
WHERE horas >= 40 AND horas <= 50;

-- Aliases para Melhor Legibilidade

SELECT nome AS nome_disciplina, horas AS carga_horaria
FROM disciplina;

-- Exiba da tabela professor, todos os professores por ordem alfábetica
-- Onde o professor tenha ID maior do que 2 e menor do que 6
-- Não exibindo a especialização e mudando a coluna "Nome" para "NOme_Professor"

SELECT id, nome AS Nome_Professor
FROM professor
WHERE Id > 2 AND Id < 6
ORDER BY nome;

-- Exemplo: Contar quantas disciplinas existem
SELECT COUNT(*) AS QuantidadeDeDisciplinas
FROM disciplina
WHERE horas > 50;
 
-- informe quantas matrículas foram feitas para o curso de id 2
SELECT COUNT(*) AS Quantidade_Matriculas
FROM matricula
WHERE Curso_ID = 2;

-- Exemplo: Selecinar professor com especialização que envolva tecnologia
SELECT *
FROM professor
WHERE especializacao LIKE '%Tecnologia%';

-- Exercicio: Selecione todos os cursos que terminem com "medicina" ou começem com a letra "D"
SELECT *
FROM curso
WHERE nome LIKE '%medicina' OR nome LIKE 'd%';

-- UtiLizando o DISTINCT para obter Valores Distintos
SELECT DISTINCT especializacao FROM professor;

---------------------------------------------
-- Consultas Intermediárias
---------------------------------------------

-- Exemplo 1: Combinar dados de aluno e matricula usando INNER JOIN
SELECT aluno.nome, aluno.cpf, matricula.DataMatricula
FROM aluno
INNER JOIN matricula ON aluno.Matricula = matricula.Aluno_ID;

-- Exemplo 2: Combinar daods dde professor e disciplina usando INNER JOIN
SELECT * 
FROM professor
