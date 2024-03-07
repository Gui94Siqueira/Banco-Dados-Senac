CREATE DATABASE IF NOT EXISTS compras;

USE compras;

CREATE TABLE IF NOT EXISTS Cliente (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    Nome VARCHAR(50) NOT NULL,
    Sobrenome VARCHAR(50) NOT NULL,
    Email VARCHAR(50) NOT NULL,
    DataCriacao DATETIME DEFAULT CURRENT_TIMESTAMP,
    DataAtualizacao DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    Telefone VARCHAR(15)
);

CREATE TABLE IF NOT EXISTS Produto(
    ID INT PRIMARY KEY AUTO_INCREMENT,
    Nome VARCHAR(50) NOT NULL,
    Preco DECIMAL(10, 2) CHECK (Preco >= 0),
    Tipo ENUM('Eletrônico', 'Vestuário', 'Alimentício') NOT NULL,
    DataCriacao DATETIME DEFAULT CURRENT_TIMESTAMP,
    DataAtualizacao DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    Quantidade INT DEFAULT 0 CHECK (Quantidade >= 0)
);

CREATE TABLE IF NOT EXISTS pedido (
	id INT PRIMARY KEY AUTO_INCREMENT,
    clienteId INT NOT NULL,
    dataPedido DATE NOT NULL,
    FOREIGN KEY (clienteId) REFERENCES cliente (id)
);

CREATE TABLE IF NOT EXISTS itensPedido (
	pedidoId INT,
    produtoId INT,
    quantidade INT NOT NULL,
    PRIMARY KEY (pedidoId, produtoId),
    FOREIGN KEY (pedidoId) REFERENCES pedido(id),
    FOREIGN KEY (produtoId) REFERENCES produto(id)
);

-- Inserção de dados na tabela Produto
INSERT INTO Produto (Nome, Preco, Tipo, Quantidade) VALUES
    ('Monitor', 400.00, 'Eletrônico', 5),
    ('Mouse', 30.00, 'Eletrônico', 20),
    ('Teclado', 50.00, 'Eletrônico', 15),
    ('Livro', 20.00, 'Livro', 50),
    ('Cadeira', 150.00, 'Móveis', 10),
    ('Câmera', 200.00, 'Eletrônico', 8),
    ('Camiseta', 25.00, 'Vestuário', 40),
    ('Chocolate', 5.00, 'Alimentício', 80),
    ('Smartwatch', 120.00, 'Eletrônico', 12),
    ('Tênis', 80.00, 'Vestuário', 25);

-- Inserção de dados na tabela Cliente
INSERT INTO Cliente (Nome, Sobrenome, Email, Telefone) VALUES
    ('Carlos', 'Silva', 'carlos@email.com', '123456789'),
    ('Ana', 'Oliveira', 'ana@email.com', NULL),
    ('Carlos', 'Santos', 'carlos2@email.com', '987654321'),
    ('Mariana', 'Pereira', 'mariana@email.com', '555555555'),
    ('Ana', 'Pereira', 'ana2@email.com', '987654321'),
    ('Roberto', 'Silva', 'roberto@email.com', '111222333');

-- Inserção de dados na tabela Pedido
INSERT INTO Pedido (ClienteID, DataPedido) VALUES
    (1, '2024-03-01'),
    (2, '2024-03-01'),
    (3, '2024-03-02'),
    (4, '2024-03-02'),
    (5, '2024-03-03'),
    (6, '2024-03-03'),
    (1, '2024-03-04'),
    (2, '2024-03-04'),
    (3, '2024-03-05'),
    (4, '2024-03-05'),
    (5, '2024-03-06'),
    (6, '2024-03-06');
    
-- Inserção de dados na tabela ItensPedido
INSERT INTO ItensPedido (PedidoID, ProdutoID, Quantidade) VALUES
    (1, 1, 2),
    (1, 2, 5),
    (2, 3, 10),
    (3, 4, 1),
    (4, 5, 3),
    (4, 2, 2),
    (5, 1, 3),
    (6, 3, 8),
    (7, 5, 2),
    (8, 1, 1),
    (9, 4, 5),
    (10, 2, 3);