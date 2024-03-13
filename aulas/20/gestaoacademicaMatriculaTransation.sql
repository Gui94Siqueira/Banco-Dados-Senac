-- Adicione na tabela gestaoacademica.aluno a coluna "matriculado"
USE gestaoacademica;

ALTER TABLE aluno
ADD COLUMN Matriculado BOOLEAN DEFAULT FALSE;

-- Crie uma transaction que, ao matricular um aluno em um curso
-- mude a coluna matriculado para 'true';
START TRANSACTION;
SET @alunoID = 5;
-- matriculando novo aluno em um curso
INSERT INTO gestaoacademica.matricula (Aluno_ID, Curso_ID, DataMatricula)
	VALUES (@alunoID, 10, '2024-03-12');

-- alterando status do aluno para matriculado = true
UPDATE aluno SET Matriculado = TRUE WHERE Matricula = @alunoID;

COMMIT;

SELECT * FROM aluno;