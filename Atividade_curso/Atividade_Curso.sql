################## DDL
-- 1. Crie uma tabela chamada Fornecedor para armazenar informações sobre os fornecedores do sistema.
-- id, nome, endereço, telefone, email e uma observação (text)
USE sistema_vendas;

CREATE TABLE IF NOT EXISTS Fornecedor (
	Id INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(100) NOT NULL,
    Endereco VARCHAR(50) NOT NULL,
    Telefone VARCHAR(13) NOT NULL,
    Email VARCHAR(100) NOT NULL,
    Observacao TEXT
);

-- 2. Adicione uma coluna chamada CNPJ à tabela Fornecedor para armazenar os números de CNPJ dos fornecedores.
ALTER TABLE Fornecedor
	ADD COLUMN CNPJ VARCHAR(14) NOT NULL;

-- 3. Adicione uma chave estrangeira à tabela Fornecedor para relacioná-la à tabela Categoria, representando a categoria do fornecedor.
ALTER TABLE Fornecedor
	ADD COLUMN CategoriaID INT,
	ADD FOREIGN KEY (CategoriaID) REFERENCES Categoria(Id);

-- 4. Modifique o tipo da coluna Telefone na tabela Fornecedor para armazenar números de telefone com no máximo 15 caracteres.
ALTER TABLE Fornecedor
	CHANGE Telefone Telefone VARCHAR(15) NOT NULL;

-- 5. Remova a coluna Observacao da tabela Fornecedor, pois não é mais necessária.
ALTER TABLE Fornecedor
	DROP COLUMN Observacao;

-- 6. Remova a tabela Fornecedor do banco de dados, se existir.
DROP TABLE IF EXISTS Fornecedor;

#################### DML
-- 0. Crie ao menos 5 registros para cada tabela, ignorando o gerneciamento de usuários. Um dos clientes deverá ter o seu nome
-- inserts para a tabela cliente
INSERT INTO cliente (Nome, Email, Telefone, UsuarioAtualizacao, Ativo) VALUES
	('Guilherme Siqueira', 'Guilherme@mail', '11910023747', '2024-03-14', 1),
    ('Gabriela Cara de Panela', 'Gabriela@mail', '11912345615', '2024-03-20',1),
    ('Rafael Mesquita', 'Rafinho@mail', '11910025060', '2024-03-20',1),
    ('Natan Pereira', 'Natan@mail', '11910026070', '2024-03-22',1),
    ('Camila Andrade', 'Cammis@mail', '11910028090', '2024-03-23',1);

-- Inserts adicionais para a tabela Categoria
INSERT INTO Categoria (Nome, Descricao, UsuarioAtualizacao)
VALUES 
    ('Informática', 'Produtos relacionados à informática', 1),
    ('Acessórios', 'Diversos acessórios para uso pessoal', 1),
    ('Alimentos', 'Alimentos de diversas categorias', 1),
    ('Beleza', 'Produtos de beleza e cuidados pessoais', 1),
    ('Esportes', 'Artigos esportivos para diversas atividades', 1);

-- Inserts adicionais para a tabela FormaPagamento
INSERT INTO FormaPagamento (Nome, Descricao, UsuarioAtualizacao)
VALUES 
    ('Dinheiro', 'Pagamento em espécie', 1),
    ('Pix', 'Pagamento via sistema Pix', 1),
    ('Cheque', 'Pagamento por cheque', 1),
    ('PayPal', 'Pagamento online via PayPal', 1),
    ('PicPay', 'Pagamento via aplicativo PicPay', 1);

-- Inserts adicionais para a tabela Produto
INSERT INTO Produto (Nome, Descricao, Preco, CategoriaID, UsuarioAtualizacao)
VALUES 
    ('Notebook', 'Computador portátil para uso pessoal', 2500.00, 1, 1),
    ('Colar', 'Acessório feminino para decoração', 50.00, 2, 1),
    ('Arroz', 'Pacote de arroz branco', 8.00, 3, 1),
    ('Shampoo', 'Shampoo para cabelos normais', 15.00, 4, 1),
    ('Bola de Futebol', 'Bola oficial para partidas de futebol', 80.00, 5, 1);

-- Inserts adicionais para a tabela Pedido
INSERT INTO Pedido (ClienteID, DataPedido, FormaPagamento, Status, UsuarioAtualizacao)
VALUES 
    (4, '2024-03-14 13:00:00', 1, 'Entregue', 1),
    (5, '2024-03-14 14:30:00', 3, 'Cancelado', 1),
    (1, '2024-03-14 15:45:00', 2, 'Em andamento', 1),
    (2, '2024-03-14 16:00:00', 4, 'Pendente', 1),
    (3, '2024-03-14 17:15:00', 5, 'Concluído', 1);

-- Inserts adicionais para a tabela ItemPedido
INSERT INTO ItemPedido (PedidoID, ProdutoID, Quantidade, UsuarioAtualizacao)
VALUES 
    (4, 2, 1, 1),
    (5, 3, 2, 1),
    (1, 4, 3, 1),
    (2, 5, 1, 1),
    (3, 1, 2, 1);

-- Inserts adicionais para a tabela GrupoUsuario
INSERT INTO GrupoUsuario (Nome, Descricao, UsuarioAtualizacao)
VALUES 
    ('Usuários Premium', 'Grupo de usuários com assinatura premium', 1),
    ('Usuários VIP', 'Grupo de usuários com status VIP', 1),
    ('Usuários Básicos', 'Grupo de usuários com acesso básico', 1),
    ('Usuários Teste', 'Grupo de usuários para testes', 1),
    ('Usuários Convidados', 'Grupo de usuários convidados', 1);

-- Inserts adicionais para a tabela Permissao
INSERT INTO Permissao (Nome, Descricao, UsuarioAtualizacao)
VALUES 
    ('Gerenciar Clientes', 'Permissão para gerenciar clientes', 1),
    ('Editar Pedidos', 'Permissão para editar informações de pedidos', 1),
    ('Aprovar Pagamentos', 'Permissão para aprovar pagamentos pendentes', 1),
    ('Visualizar Relatórios', 'Permissão para visualizar relatórios de vendas', 1),
    ('Acessar Painel Administrativo', 'Permissão para acessar o painel de administração do sistema', 1);

-- 1. Atualizar o nome de um cliente:
UPDATE cliente 
SET Nome = 'Gabriela Paulino' 
WHERE id = 2;

-- 2. Deletar um produto
-- primeiro foi criado um produto sem uma FK devido a problema de deleção em cascata
INSERT INTO produto (Nome, Descricao, Preco, UsuarioAtualizacao)
VALUES
	('Bola', 'Bola futsal uso em quadra', 250.00, 1);
    
-- deletando produto
DELETE FROM produto WHERE Id = 6;


-- 3. Alterar a categoria de um produto:
UPDATE produto 
SET categoriaID = 2 
WHERE id = 4;

-- select * from produto;
-- 4. Inserir um novo cliente:
INSERT INTO cliente (Nome, Email, Telefone, UsuarioAtualizacao, Ativo) VALUES
	('Sofia Silva', 'Sofria@mail', '11910024020', '2024-03-14', 1);

-- select * from cliente;
-- 5. Inserir um novo pedido:
INSERT INTO Pedido (ClienteID, DataPedido, FormaPagamento, Status, UsuarioAtualizacao)
VALUES 
    (4, '2024-03-14 21:00:00', 2, 'Entregue', 2);

-- 6. Atualizar o preço de um produto:
UPDATE produto 
SET preco = 4000.00
WHERE id = 1;

-- SELECT * FROM produto;

############## DQL - Sem Joins
-- 1. Selecione todos os registros da tabela Produto:
SELECT * FROM produto;

-- 2. Selecione apenas o nome e o preço dos produtos da tabela Produto:
SELECT Nome, preco FROM produto;

-- 3. Selecione os produtos da tabela Produto ordenados por preço, do mais barato para o mais caro:
SELECT * FROM produto ORDER BY preco;

-- 4. Selecione os produtos da tabela Produto ordenados por preço, do mais caro para o mais barato:
SELECT * FROM Produto ORDER BY preco DESC;

-- 5. Selecione os nomes distintos das categorias da tabela Categoria:
SELECT DISTINCT Nome
FROM categoria;

-- 6. Selecione os produtos da tabela Produto cujo preço esteja entre $10 e $50:
SELECT * 
FROM produto
WHERE preco BETWEEN 10 AND 50;

-- 7. Selecione os produtos da tabela Produto, mostrando o nome como "Nome do Produto" e o preço como "Preço Unitário":
SELECT Nome AS Nome_do_produto, preco AS Preco_unitário
FROM produto;

-- 8. Selecione os produtos da tabela Produto, adicionando uma coluna calculada "Preço Total" multiplicando a quantidade pelo preço:
SET @quantidade = 3;

SELECT * , SUM(produto.preco * @quantidade) AS Preco_total
FROM produto;

-- 9. Selecione os produtos da tabela Produto, mostrando apenas os 10 primeiros registros:
SELECT * 
FROM PRODUTO
LIMIT 10;
-- 10. Selecione os produtos da tabela Produto, pulando os primeiros 5 registros e mostrando os 10 seguintes:
SELECT *
FROM PRODUTO
LIMIT 10 OFFSET 5;

############# DQL - Joins
-- 1. Selecione o nome do produto e sua categoria:
SELECT produto.Nome, categoria.Nome
FROM produto
INNER JOIN categoria ON produto.categoriaID = categoria.Id;
-- 2. Selecione o nome do cliente e o nome do produto que ele comprou:
SELECT *
FROM pedido
INNER JOIN produto on produto.ID = ProdutoID
RIGHT JOIN itempedido ON produto.Id = itempedido.produtoID;



select * from pedido;
-- 3. Selecione todos os produtos, mesmo aqueles que não têm uma categoria associada:


-- 4. Selecione todos os clientes, mesmo aqueles que não fizeram nenhum pedido:


-- 5. Selecione todas as categorias, mesmo aquelas que não têm produtos associados:


-- 6. Selecione todos os produtos, mesmo aqueles que não foram pedidos:



############### DQL com joins e demais filtros
-- 1. Selecione o nome da categoria e o número de produtos nessa categoria, apenas para categorias com mais de 5 produtos:


-- 2. Selecione o nome do cliente e o total de pedidos feitos por cada cliente:


-- 3. Selecione o nome do produto, o nome da categoria e a quantidade total de vendas para cada produto:


-- 4. Selecione o nome da categoria, o número total de produtos nessa categoria e o número de pedidos para cada categoria:


-- 5. Selecione o nome do cliente, o número total de pedidos feitos por esse cliente e a média de produtos por pedido, apenas para clientes que tenham feito mais de 3 pedidos:


##### Crie uma View qualquer para qualquer um dos joins desenvolvidos

##### Crie uma transaction que cadastra um cliente e faça uma venda
-- Início da transação

-- Inserir um novo cliente


-- Inserir um novo pedido para o cliente


-- Inserir itens no pedido


-- Commit da transação (confirmação das alterações)