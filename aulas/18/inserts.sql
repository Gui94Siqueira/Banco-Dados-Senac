-- INSERINDO DADOS NAS TABELAS
INSERT INTO Cliente (Nome, Endereco, Bairro, Cidade, Estado, CEP, DataNascimento)
VALUES
    ('João Silva', 'Rua Principal, 123', 'Centro', 'Cidade A', 'Estado A', '12345678', '1990-01-01'),
    ('Maria Oliveira', 'Av. Comercial, 456', 'Centro', 'Cidade B', 'Estado B', '23456789', '1985-05-15'),
    ('Carlos Santos', 'Rua Secundária, 789', 'Bairro X', 'Cidade C', 'Estado C', '34567890', '1998-07-20'),
    ('Ana Pereira', 'Av. Principal, 101', 'Bairro Y', 'Cidade D', 'Estado D', '45678901', '1980-11-30'),
    ('Rodrigo Costa', 'Rua da Esquina, 202', 'Bairro Z', 'Cidade E', 'Estado E', '56789012', '1995-03-10'),
    ('Lúcia Lima', 'Av. do Meio, 303', 'Bairro W', 'Cidade F', 'Estado F', '67890123', '1987-09-25'),
    ('Fernanda Alves', 'Rua do Topo, 404', 'Bairro V', 'Cidade G', 'Estado G', '78901234', '2000-12-05');

INSERT INTO Telefone (Telefone, ClienteId, Tipo)
VALUES
    ('111-1111', 1, 'Celular'),
    ('222-2222', 2, 'Residencial'),
    ('333-3333', 3, 'Comercial'),
    ('444-4444', 4, 'Celular'),
    ('555-5555', 5, 'Residencial'),
    ('666-6666', 6, 'Celular'),
    ('777-7777', 7, 'Comercial');

INSERT INTO Chale (Localizacao, Capacidade, ValorAltaEstacao, ValorBaixaEstacao)
VALUES
    ('Chalé Praia', 4, 150.00, 100.00),
    ('Chalé Montanha', 6, 200.00, 120.00),
    ('Chalé Interior', 2, 100.00, 80.00),
    ('Chalé Luxo', 8, 250.00, 150.00),
    ('Chalé Jardim', 3, 120.00, 90.00);

INSERT INTO Iten (Nome, DescricaoItem)
VALUES
    ('Almoço', 'Almoço a self service com variedade de cardapios'),
    ('Motorista', 'Motorista turismo para atender a agenda do hospede');

INSERT INTO Chale_Item (IdChale, NomeItem)
VALUES
    (1, 'Café da Manhã'),
    (1, 'Ar Condicionado'),
    (2, 'TV a Cabo'),
    (3, 'Wi-Fi'),
    (4, 'Piscina Privativa'),
    (5, 'Café da Manhã'),
    (5, 'Ar Condicionado');

INSERT INTO Hospedagem (IdCliente, IdChale, Estado, DataInicio, DataFim, QtdPessoas, Desconto, ValorFinal)
VALUES
    (1, 1, 'Concluída', '2024-03-01 12:00:00', '2024-03-05', 2, 10.00, 540.00),
    (2, 2, 'Concluída', '2024-03-02 14:00:00', '2024-03-07', 4, 20.00, 840.00),
    (3, 3, 'Pendente', '2024-03-03 10:00:00', '2024-03-10', 1, 0.00, 80.00),
    (4, 4, 'Concluída', '2024-03-04 08:00:00', '2024-03-09', 6, 15.00, 1275.00),
    (5, 5, 'Concluída', '2024-03-05 16:00:00', '2024-03-12', 3, 5.00, 340.00),
    (6, 1, 'Pendente', '2024-03-06 18:00:00', '2024-03-08', 2, 0.00, 200.00),
    (7, 2, 'Concluída', '2024-03-07 20:00:00', '2024-03-14', 5, 25.00, 1125.00);

INSERT INTO Servico (NomeServico, ValorServico)
VALUES
    ('Massagem Relaxante', 50.00),
    ('Passeio de Barco', 30.00),
    ('Jantar Romântico', 40.00),
    ('Cesta de Frutas', 20.00),
    ('Serviço de Limpeza', 60.00);

INSERT INTO Hospedagem_Servico (HospedagemId, DataServico, IdServico, ValorServico)
VALUES
    (1, '2024-03-03 14:30:00', 1, 50.00),
    (2, '2024-03-05 10:00:00', 2, 30.00),
    (3, '2024-03-08 12:00:00', 3, 40.00),
    (4, '2024-03-10 15:30:00', 4, 20.00),
    (5, '2024-03-12 18:00:00', 5, 60.00),
    (6, '2024-03-08 20:30:00', 1, 50.00),
    (7, '2024-03-13 14:00:00', 3, 40.00),
    (7, '2024-03-14 08:30:00', 5, 60.00);
