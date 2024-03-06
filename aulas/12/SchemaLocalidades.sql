-- CRIAÇÃO E USO DO SCHEMA (BD)
CREATE SCHEMA IF NOT EXISTS LOCALIDADES;
USE LOCALIDADES;

-- CRIAÇÃO DAS TABELAS
CREATE TABLE IF NOT EXISTS ESTADO (
	Id INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(50) NOT NULL,
    Sigla VARCHAR(2) NOT NULL
);

CREATE TABLE IF NOT EXISTS CIDADE (
	Id INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(50) NOT NULL,
    Estado_Id INT,
    FOREIGN KEY (Estado_ID) REFERENCES ESTADO(Id)
);

SELECT * FROM CIDADE;
SELECT * FROM ESTADO;

-- INSERÇÃO DE DADOS REAIS
INSERT INTO ESTADO (Nome, Sigla) VALUES
	('São Paulo', 'SP'),
    ('Rio de Janeiro', 'RJ'),
    ('Bahia', 'BA');

INSERT INTO CIDADE (Nome, Estado_ID) VALUES 
	('São Paulo', 1),
    ('Campinas', 1),
    ('Rio de Janeiro', 2),
    ('Niterói', 2),
    ('Salvador', 3),
    ('Fira de Santana', 3);
    
-- Inserção de Cidades Fictícias sem Estado
INSERT INTO CIDADE (Nome, Estado_ID) VALUES
	('Gotham City', NULL),
    ('Metropolis', NULL),
    ('Wonderland', NULL),
    ('Neverland', NULL);

-- -----------------------
-- Consultas SQL com JOINs
-- -----------------------
SELECT CIDADE.Nome, Estado.Nome AS Nome_Estado, ESTADO.Sigla AS UF
FROM CIDADE
INNER JOIN ESTADO ON CIDADE.Estado_ID = ESTADO.ID;



