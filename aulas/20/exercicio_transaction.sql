-- Criar uma transaction que, quando o cliente fizer uma hospedagem
-- Automaticamente adicione um cafe da manhã a sua hospedagem
START TRANSACTION;
SET @CodServico = 1;
SET @dataEntrada = '2024-01-01';
INSERT INTO hospedagem (codChale, codCliente, dataInicio, dataFim, qtdPessoas, desconto, valorFinal) VALUES
	(3, 5, @dataEntrada, '2024-03-01', 3, 0, 370.00);
SET @CodHospedagem = last_insert_id();

INSERT INTO hospedagem_servico VALUES 
	(@CodHospedagem, @CodServico, @dataEntrada);
    
COMMIT;
