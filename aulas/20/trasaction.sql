-- 0 Iniciando a transação
START TRANSACTION;

-- INSERINDO UM NOVO PEDIDO
INSERT INTO pedido (ClienteId, dataPedido) VALUES (1, '2024-03-12');
SET @novoPedidoID = last_insert_id();

-- 2 inserindo os itens do pedido
insert into itenspedido(pedidoId, produtoId, quantidade)
	VALUES (@novoPedidoID, 4, 6);
    
-- 3 Atualizando a quantidade do produto no estoque
UPDATE produto SET quantidade = quantidade - 6 WHERE ID = 4;

-- Desfazendo a transaçãoptimize
COMMIT;