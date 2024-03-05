-------------------------------
-- Selecionar todos os alunos
-------------------------------
SELECT * FROM aluno;

-------------------------------
-- Selecionar apenas os nomes e CPFs dos alunos
-------------------------------
SELECT ALUNO.Nome, Aluno.Cpf
FROM ALUNO;

-------------------------------
-- Selecionar alunos matriculados após uma data específica
-------------------------------
SELECT ALUNO.Nome, MATRICULA.DataMatricula
FROM MATRICULA
INNER JOIN ALUNO ON MATRICULA.Aluno_ID = ALUNO.Matricula
WHERE MATRICULA.DataMatricula > '2024-01-15';

-------------------------------
-- Contar quantas disciplinas existem com carga horária maior que X
-------------------------------
SELECT COUNT(*)
FROM DISCIPLINA
WHERE DISCIPLINA.Horas > 40;

-- SELECT * FROM DISCIPLINA;

-------------------------------
-- Contar quantas matrículas existem para cada curso
-------------------------------
SELECT Curso.Nome as Curso, Curso_ID, COUNT(*) AS Total
FROM MATRICULA
JOIN CURSO ON Curso_ID = Curso.Id
GROUP BY Nome;

-------------------------------
-- Contar quantas disciplinas cada professor leciona
-------------------------------
SELECT professor.Nome as Professor, Professor_ID, COUNT(*) AS Total
FROM Professores_disciplinas
JOIN Professor ON Professor_ID = professor.Id
GROUP BY Nome;

-------------------------------
-- Combinar nome do aluno e data da matrícula
-------------------------------
SELECT ALUNO.Nome, MATRICULA.DataMatricula
FROM MATRICULA
INNER JOIN ALUNO ON Aluno_ID = Aluno.Matricula;

-------------------------------
-- Combinar nome do curso e nome do aluno
-------------------------------
SELECT CURSO.Nome as Curso, ALUNO.Nome as Aluno
FROM MATRICULA
INNER JOIN CURSO ON Curso_ID = CURSO.Id
LEFT JOIN ALUNO ON Aluno_ID = ALUNO.Matricula;


-------------------------------
-- Contar quantos alunos se matricularam em cada curso
-------------------------------
SELECT Aluno.nome as Curso, Curso.Nome, COUNT(*) AS Total
FROM MATRICULA
JOIN CURSO ON Curso_ID = Curso.Id
JOIN ALUNO ON Aluno_ID = ALUNO.Matricula
GROUP BY Matricula;
