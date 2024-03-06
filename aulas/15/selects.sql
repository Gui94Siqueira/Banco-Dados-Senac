-- SELECT TUDO TABELA X
SELECT * FROM PEDIDO;

-- SELECT COM CONTAGEM TOTAL DE REGISTROS
SELECT COUNT(*) AS Tolal_Pedidos 
FROM PEDIDO;

-- SELECT QUANTOS PEDIDOS CADA CLIENTE FEZ
SELECT ClienteId, COUNT(*)
FROM pedido
GROUP BY clienteId;

-- SELECIONAR O TOTAL DE ITENS POR PEDIDO
SELECT pedidoId, COUNT(*) AS ProdutosPorPedidos
FROM itenspedido
GROUP BY pedidoId;

-- SELECIONAR PRODUTOS MAIS VENDIDOS
SELECT produtoId, SUM(quantidade) as MaisVendidos
FROM itensPedido
GROUP BY produtoId
ORDER BY MaisVendidos DESC;

-- LISTE OS CLIENTES INFORMANDO: 
-- TOTAL GASTO, MEDIA DE PRODUTOS, DATA DO PRIMEIRO E O ÚLTIMO PEDIDO
SELECT
	cliente.Nome,
    COUNT(*) AS NumPedidos,
    SUM(produto.preco * itenspedido.quantidade) AS TotalGasto,
    AVG(itenspedido.quantidade) AS MediaProdutosPorPedido,
    MIN(pedido.dataPedido) AS Dataprimeiro,
    MAX(pedido.dataPedido) as DataUltimo
FROM pedido
JOIN itenspedido ON pedido.id = itenspedido.pedidoId
JOIN produto ON itenspedido.produtoId = produto.id
JOIN cliente ON pedido.clienteId = cliente.id
GROUP BY pedido.clienteId;