-- -------------------------------
-- DDL - Criação de Banco de Dados
-- -------------------------------
CREATE SCHEMA IF NOT EXISTS gestaoacademica;
USE gestaoacademica;

-- ------------------------
-- DDL - Criação de Tabelas
-- ------------------------
CREATE TABLE IF NOT EXISTS gestaoacademica.aluno(
	Matricula INT AUTO_INCREMENT,
    Nome VARCHAR(50) NOT NULL,
    Cpf VARCHAR(11) NOT NULL UNIQUE,
    PRIMARY KEY(Matricula)
);

CREATE TABLE IF NOT EXISTS gestaoacademica.curso(
	Id INT AUTO_INCREMENT,
    Nome VARCHAR(50) NULL DEFAULT NULL,    
    PRIMARY KEY(Id)
);

CREATE TABLE IF NOT EXISTS disciplina(
	Id INT AUTO_INCREMENT,
    Nome VARCHAR(50) NULL DEFAULT NULL,
    Horas INT NOT NULL DEFAULT 0,
    PRIMARY KEY(Id)
);

CREATE TABLE IF NOT EXISTS gestaoacademica.professor(
	Id INT AUTO_INCREMENT,
    Nome VARCHAR(100) NOT NULL,
    Especializacao VARCHAR(50) NULL DEFAULT NULL,
    PRIMARY KEY (Id)
);

CREATE TABLE IF NOT EXISTS matricula(
	Aluno_ID INT,
    Curso_ID INT,
    DataMatricula DATE NOT NULL,
    PRIMARY KEY (Aluno_ID, Curso_ID),
    FOREIGN KEY (Aluno_ID) REFERENCES Aluno(Matricula),
    FOREIGN KEY (Curso_ID) REFERENCES Curso(Id)
);

CREATE TABLE IF NOT EXISTS disciplinas_cursos(
	Disciplina_ID INT,
    Curso_ID INT,
    PRIMARY KEY (Disciplina_ID, Curso_ID),
    FOREIGN KEY (Disciplina_ID) REFERENCES Disciplina(Id),
	FOREIGN KEY (Curso_ID) REFERENCES Curso(Id)
);

CREATE TABLE IF NOT EXISTS professores_disciplinas(
	Professor_ID INT,
    Disciplina_ID INT,
    PRIMARY KEY (Professor_ID, Disciplina_ID),
    FOREIGN KEY (Professor_ID) REFERENCES Professor(Id),
    FOREIGN KEY (Disciplina_ID) REFERENCES Disciplina(Id)
);

-- -----------------------------------
-- DML - Inserção de Dados nas Tabelas
-- -----------------------------------
INSERT INTO Aluno (Nome, Cpf) VALUES 
	('Carlos Silva', '12345678901'),
    ('Pedro Rocha', '23456789012'),
    ('Monica Souza', '34567890123'),
    ('Fabio Silva', '45678901234'),
    ('Ana Oliveira', '56789012345'),
    ('Lucas Santos', '67890123456'),
    ('Eduarda Lima', '78901234567'),
    ('Rafaela Pereira', '89012345678');

INSERT INTO Curso (Nome) VALUES
	('Ciência da Computação'),
    ('Engenharia Civil'),
    ('Administração'),
    ('Medicina'),
    ('Arquitetura'),
    ('Psicologia'),
    ('Engenharia Elétrica'),
    ('Direito'),
    ('Biomedicina'),
    ('Design Gráfico');

INSERT INTO Matricula(Aluno_ID, Curso_ID, DataMatricula) VALUES
	(1, 2, '2024-02-01'),
    (1, 5, '2024-02-02'),
    (2, 2, '2024-01-02'),
    (2, 5, '2024-02-01'),
    (3, 2, '2024-01-15'),
    (3, 5, '2024-01-29'),
    (4, 4, '2024-03-10'),
    (3, 1, '2024-02-18'),
    (4, 2, '2024-01-25'),
    (1, 3, '2024-03-01'),
    (2, 4, '2024-02-12');
    
INSERT INTO Professor (Nome, Especializacao) VALUES
	('Huguinho', 'Tecnologia'),
    ('Zezinho', 'Idiomas'),
    ('Luizinho', 'Cálculo'),
    ('Tico', 'Tecnologia'),
    ('Teco', 'Idiomas'),
    ('Carla Mendes', 'Psicologia'),
    ('Vinícius Almeida', 'Engenharia Elétrica'),
    ('Camila Oliveira', 'Direito'),
    ('Bruno Fernandes', 'Biomedicina'),
    ('Laura Santos', 'Design Gráfico');

INSERT INTO Disciplina (Nome, Horas) VALUES
	('Matemática "Avançada" II', 40),
    ('Inglês Técnico', 50),
    ('Linguagem de Programação', 45),
    ('Psicologia Social', 30),
    ('Sistemas Elétricos', 60),
    ('Direito Civil', 45),
    ('Microbiologia', 50),
    ('Ilustração Digital', 40);

INSERT INTO Professores_Disciplinas (Professor_ID, Disciplina_ID) VALUES
	(1, 1),
    (2, 2),
    (3, 3),
    (4, 1),
    (5, 2),
    (6, 4),
    (7, 5),
    (8, 1),
    (9, 2),
    (10, 3);

INSERT INTO Disciplinas_Cursos(Disciplina_ID, Curso_ID) VALUES
	(1, 1),
    (2, 2),
    (3, 3),
    (4, 4),
    (5, 5);