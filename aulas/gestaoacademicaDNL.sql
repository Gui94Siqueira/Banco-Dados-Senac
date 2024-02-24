-- DML (INSERT - UPDATE - DELETE)
USE gestaoacademica;

INSERT INTO aluno (Matricula, nome) VALUES 
    (8, 'Guilherme Santos');

SELECT * FROM aluno;

-- Insira os cursos Ciência da Computação, Engenharia Civil, Administração
-- Medicina e Arquitetura na tabela gestaoacademica.curso

INSERT INTO curso VALUES
	(1, 'Ciência da computação'),
    (2, 'Engenharia Civil'),
    (3, 'Administração'),
    (4, 'Medicina'),
    (5, 'Arquitetura');
    
select * from curso;

-- Cadastre o aluno de ID 1 nos cursos ID 3 e 5.
-- Cadastre o aluno de ID 2 nos cursos ID 2 e 4.
-- Cadastre o aluno de ID 3 nos cursos ID 2 e 5.
-- Para cadastrar uma data, use o farmato '2024-02-23'.

INSERT INTO matricula VALUES
	(1, 3, '2024-02-23'),
    (1, 5, '2024-02-23'),
    (2, 2, '2024-02-24'),
    (2, 4, '2024-02-24'),
    (3, 2, '2024-02-25'),
    (3, 5, '2024-02-25');


SELECT * FROM matricula;

INSERT INTO professor (Id, Nome, Especializacao) VALUES
	(1, 'Cristiano Maia', 'Front-end'),
    (2, 'Nerilso Viana', 'Mobile-end'),
    (3, 'Aécio Mendes', 'Back-end'),
    (4, 'Fulano Silva', 'Ciências Contabeis'),
    (5, 'Beltrando Souza', 'Matematica');
    
SELECT * FROM DISCIPLINA;

INSERT INTO disciplina (Id, Nome, Horas) VALUES
	(1, 'Front-end', 36),
    (2, 'Back-end', 38),
    (3, 'Mobile', 42),
    (4, 'Matematica', 26),
    (5, 'Português', 40);
    
INSERT INTO professor_disciplina (Professor_ID, Disciplina_ID) VALUES
	(1, 1),
    (2, 2),
    (3, 3),
    (4, 4),
    (5, 5);
    
select * from professor_disciplina;

-- DLL Update
UPDATE professor
SET especializacao = 'Inteligencia Artificial'
WHERE ID = 5;

SELECT * FROM disciplina;

UPDATE disciplina
	SET horas = 40
	WHERE Horas > 40;

UPDATE disciplina
	SET Nome = 'Fisica', Horas = 40
    WHERE ID = 1;

UPDATE disciplina
	SET horas = 40
	WHERE horas > 40;
    
-- DLL DELETE

DELETE FROM displina WHERE Id = 3;
	





