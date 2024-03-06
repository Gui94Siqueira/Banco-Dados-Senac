-- DML (INSERT - UPDATE - DELETE)
USE gestaoacademica;

INSERT INTO aluno (Matricula, nome, cpf) values 
	(5, 'Pedro Rocha' , '56789012345'),
    (6, 'Monica Souza', '67890123456'),
    (7, 'Fábio Silva' , '78901234567');

select * from aluno;

-- Insira os cursos Ciência da Computação, Engenharia Civil, Administração
-- Medicina e Arquitetura na tabela gestaoacademica.curso
select * from curso;

INSERT INTO curso (id, nome) values
	(1, 'Ciência da Computação'),
    (2, 'Engenharia Civil'),
    (3, 'Administração'),
    (4, 'Medicina'),
    (5, 'Arquitetura');
    
-- Cadastre o aluno de ID 1 nos crusos de ID 3 e 5.
-- Cadastre o aluno de ID 2 nos cursos de ID 2 e 4.
-- Cadastre o aluno de ID 3 nos cursos de ID 2 e 5.
-- Para cadastrar uma data, use o formato '2024-02-23'

INSERT INTO matricula (aluno_id, curso_id, data_matricula) values
	(1, 2, '2024-02-01'),
    (1, 5, '2024-02-02'),
    (2, 2, '2024-01-02'),
    (2, 5, '2024-02-01');
    
select * from matricula;
INSERT INTO matricula (aluno_id, curso_id, data_matricula) values
	(3, 2, '2024-01-15'),
    (3, 5, '2024-01-29');
    
select * from professor;
-- Cadastre 5 professores e 3 disciplinas
-- Associe cada professor a ao menos uma disciplina
INSERT INTO professor (id, nome, especializacao) values
	(1, 'Huguinho', 'Tecnologia'),
    (2, 'Zezinho', 'Idiomas'),
    (3, 'Luiziho', 'Cálculo'),
    (4, 'Tico', 'Tecnologia'),
    (5, 'Teco', 'Idiomas');

select * from disciplina;
INSERT INTO disciplina (id, horas, nome) values
	(1, 40, 'Matemática "Avançada" II'),
    (2, 50, "Inglês Técnico"),
    (3, 45, "Linguagem de Programação");

-- Associação dentre professores e disciplinas
select * from professor_disciplina;
INSERT INTO professor_disciplina values
	(1, 1),
    (2, 2),
    (3, 3),
    (4, 1),
    (5, 2);

-- DDL Update
UPDATE professor 
SET especializacao = 'Inteligencia Artifical' 
WHERE id = 5;

select * from disciplina;

UPDATE disciplina
SET nome = 'Matemática Avançada', horas = 80
WHERE ID = 1; 

-- Update de toas as horas para 40 onde Horas for maior que 40
UPDATE disciplina
SET horas = 40
WHERE horas > 40;

-- DML Delete
DELETE FROM disciplina WHERE id = 3;