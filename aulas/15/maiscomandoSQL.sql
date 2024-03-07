-- ENCONTRA PRODUTOS COM O PRECO ENTRE 50 E 150 REAIS 

SELECT * 
FROM PRODUTO
WHERE preco >= 50 AND PRECO <= 150;

SELECT * FROM produto
WHERE preco BETWEEN 50 AND 150;

-- MOSTRE TUDO DOS PRODUTOS COM ID 1, 5 E 7
SELECT *
FROM PRODUTO
WHERE ID = 1 OR ID = 5 OR ID = 7;

SELECT * FROM produto
WHERE id IN (1, 3, 7);

-- MOSTRE TODOS OS CLIENTES EM QUE O SOBRENOME TERMINE COM "a"alter
SELECT *
FROM CLIENTE
WHERE sobrenome LIKE "%a";

-- MOSTRE OS 5 PRODUTOS MAIS CAROS DA LOJA
SELECT * FROM PRODUTO
ORDER BY preco DESC
LIMIT 5;

-- LISTANDO OS PRODUTOS POR PAGINA, CADA PÁGIA CBENDO 2 PRODUTOS, ME MOSTRE A PÁGINA 3
SELECT * FROM produto
LIMIT 2 OFFSET 4;

-- CONSULTAR OS PEDIDOS FEITOS ENTRE 2024-03-01 E 2024-03-05, LIMITANDO A 5 RESULTADOS
SELECT * FROM pedido WHERE dataPedido BETWEEN '2024-03-01' AND '2024-03-05'
ORDER BY dataPedido
LIMIT 5;
