CREATE DATABASE compras;

USE compras;

CREATE TABLE Cliente (
    ClienteID INT PRIMARY KEY,
    Nome VARCHAR(50),
    Email VARCHAR(50)
);

CREATE TABLE Produto(
    ProdutoID INT PRIMARY KEY,
    NomeProduto VARCHAR(50),
    Preco DECIMAL(10, 2)
);


CREATE TABLE Pedido (
    PedidoID INT PRIMARY KEY,
    ClienteID INT,
    DataPedido DATE,
    FOREIGN KEY (ClienteID) REFERENCES Cliente(ClienteID)
);

CREATE TABLE ItensPedido (
    PedidoID INT,
    ProdutoID INT,
    Quantidade INT,
    PRIMARY KEY(PedidoID, ProdutoID),
    FOREIGN KEY (PedidoID) REFERENCES Pedido(PedidoID),
    FOREIGN KEY (ProdutoID) REFERENCES Produto(ProdutoID)
);