------------------------------------------
-- CRIANDO NOVO BANCO DE DADOS
------------------------------------------
CREATE DATABASE IF NOT EXISTS hotel;
USE hotel;

-----------------------------------------
-- INSERINDO TABELAS AO BANCO DE DADOS
-----------------------------------------
CREATE TABLE IF NOT EXISTS Cliente (
	Id INT PRIMARY KEY AUTO_INCREMENT,
    Nome VARCHAR(50) NOT NULL,
    Endereco VARCHAR(50) NOT NULL,
    Bairro VARCHAR(30) NOT NULL,
    Cidade VARCHAR(30) NOT NULL,
    Estado VARCHAR(30) NOT NULL,
    CEP VARCHAR(8) NOT NULL,
    DataNascimento DATE NOT NULL
);

CREATE TABLE IF NOT EXISTS Telefone (
    Telefone VARCHAR(13) NOT NULL,
    ClienteId INT,
    tipo VARCHAR(11) NOT NULL,
    PRIMARY KEY (Telefone, ClienteId),
    FOREIGN KEY (ClienteId) REFERENCES Cliente(Id)
);

CREATE TABLE IF NOT EXISTS Chale (
	Id INT PRIMARY KEY AUTO_INCREMENT,
    Localizacao VARCHAR(50) NOT NULL,
    Capacidade INT NOT NULL,
    ValorAltaEstacao DECIMAL (10, 2) NOT NULL,
    ValorBaixaEstacao DECIMAL (10, 2) NOT NULL
);

CREATE TABLE IF NOT EXISTS Iten (
	Nome VARCHAR(30) PRIMARY KEY,
    DescricaoItem VARCHAR(150) NOT NULL
);

CREATE TABLE IF NOT EXISTS Chale_Item (
	IdChale INT,
    NomeItem VARCHAR (30) NOT NULL,
    PRIMARY KEY (IdChale, NomeItem),
    FOREIGN KEY (IdChale) REFERENCES Chale(Id),
    FOREIGN KEY (NomeItem) REFERENCES Iten(Nome)
);

CREATE TABLE IF NOT EXISTS Hospedagem(
	Id INT PRIMARY KEY AUTO_INCREMENT,
    IdCliente INT NOT NULL,
    IdChale INT NOT NULL,
    Estado VARCHAR(30) NOT NULL,
    DataInicio DATETIME DEFAULT CURRENT_TIMESTAMP,
    DataFim DATE NOT NULL,
    QtdPessoas INT DEFAULT 0,
    Desconto DECIMAL (10, 2) DEFAULT 0.0,
    ValorFinal DECIMAL (10, 2) NOT NULL,
    FOREIGN KEY (IdChale) REFERENCES Chale(Id),
    FOREIGN KEY (IdCliente) REFERENCES Cliente(Id)
);


CREATE TABLE IF NOT EXISTS Servico (
	Id INT PRIMARY KEY AUTO_INCREMENT,
    NomeServico VARCHAR(150) NOT NULL,
    ValorServico DECIMAL (10, 2) NOT NULL
);

CREATE TABLE IF NOT EXISTS Hospedagem_Servico (
	HospedagemId INT,
    DataServico DATETIME DEFAULT CURRENT_TIMESTAMP,
    IdServico INT,
    ValorServico DECIMAL (10, 2) NOT NULL,
    PRIMARY KEY (HospedagemId, IdServico),
    FOREIGN KEY (HospedagemId) REFERENCES Hospedagem(Id),
    FOREIGN KEY (IdServico) REFERENCES Servico(Id)   
);

