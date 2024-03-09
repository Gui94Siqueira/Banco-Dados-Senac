# Consultas sem JOINS
-- Consulte todos os clientes de São Paulo (SP)
SELECT * 
FROM CLIENTE 
WHERE ESTADO = 'Estado A'; 
-- Selecionar hospedagens com mais de 3 pessoas e desconto igual a 0
SELECT * 
FROM HOSPEDAGEM 
WHERE QtdPessoas > 3 
AND Desconto = 0;
-- Selecionar telefones de clientes com ID 1 ou 2, limitando a 2 resultados
SELECT * 
FROM TELEFONE
WHERE ClienteId = 1
OR ClienteId = 2
LIMIT 2;
-- Selecionar chalés com capacidades entre 4 e 6, ordenaos por valor em alta estação
SELECT * 
FROM chale 
WHERE capacidade BETWEEN 4 AND 6 
ORDER BY valorAltaEstacao DESC;
-- Selecione todos os itens que contenham "de" na descrição, pulando os 2 primeiros resultados
SELECT * 
FROM Iten 
WHERE descricaoItem LIKE '%de%' 
LIMIT 100 OFFSET 2;

# Consultas com JOINS
-- 	Selecione detalhes da hospedagem, incluindo informações do clinte
SELECT hospedagem.*, Cliente.Nome
FROM HOSPEDAGEM 
JOIN CLIENTE ON HOSPEDAGEM.IdCliente = Cliente.Id;
-- Selecionar cháles com os itens associados
SELECT Chale.*, GROUP_CONCAT(iten.Nome) AS itens
FROM chale 
JOIN chale_Item ON chale_Item.IdChale = chale.Id
JOIN ITEN ON chale_item.NomeItem = Iten.Nome
GROUP BY Chale.Id;

-- Selecionar serviços utilizados em uma hospedagem
SELECT servico.*, hospedagem_servico.DataServico 
FROM hospedagem_servico 
JOIN servico ON hospedagem_servico.IdServico = servico.Id
WHERE hospedagem_servico.HospedagemId = 1;

-- Consultar os clientes com seus telefones
SELECT Cliente.Nome, GROUP_CONCAT(telefone.telefone) AS telefone
FROM cliente 
LEFT JOIN telefone ON telefone.ClienteId = cliente.Id
GROUP BY Cliente.Id;
-- Selecionar chalés oculpados em uma data especifica
SELECT Chale.*, hospedagem.DataInicio, hospedagem.dataFim
FROM hospedagem 
JOIN chale ON hospedagem.IdChale = chale.Id 
WHERE '2024-03-05' between hospedagem.dataInicio AND hospedagem.dataFim;

SELECT Chale.*, Servico.*
FROM chale
CROSS JOIN Servico on chale;

SELECT Id, AVG(Capacidade) AS capacidade_media
FROM chale
GROUP BY Id
HAVING capacidade_media > 3;

-- Selecionar os clientes com mais hospedagem registrada
select idCliente, count(*) AS Qtd_hospedagem
from hospedagem
group by IdCliente
having Qtd_hospedagem > 1;

-- Selecionar os serviços com valorr total superior a 100
SELECT hospedagem_servico.IdServico, SUM(servico.valorServico) as Total_valor
FROM hospedagem_servico
JOIN servico on hospedagem_servico.IdServico = servico.id
GROUP BY IdServico
HAVING Total_valor > 40;

-- Criar uma view
CREATE VIEW ViewMediaCapacidade AS
SELECT Id, AVG(capacidade) As media_capacidade
FROM chale
GROUP BY Id;

-- Selecionar dados da view
SELECT * FROM ViewMediaCapacidade;

-- Crie uMa view que infome os dados da hospedagem, com Os dados do cliente, incluindo o telefone
CREATE VIEW ViewHospedagemDadosCliente AS
SELECT cliente.Nome, hospedagem.Estado, telefone.Telefone, telefone.tipo
FROM HOSPEDAGEM
LEFT JOIN Cliente ON hospedagem.IdCliente = cliente.Id
INNER JOIN telefone on hospedagem.IdCliente = telefone.ClienteId;

select * from ViewHospedagemDadosCliente;

-- Criar um indice na coluna idCliente da tabela Telefone
CREATE INDEX idx_idCliente ON telefone(ClienteId);

select * from telefone order by ClienteId desc;


