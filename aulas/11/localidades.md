Enunciado: Sistema de Localidades

Você está desenvolvendo um sistema de localidades que precisa armazenar informações sobre cidades e estados. Cada estado deve conter seu nome e Unidade Federativa (UF), enquanto cada cidade deve conter seu nome e, opcionalmente, pertencer a um estado. Siga os passos abaixo para criar as tabelas necessárias:

Criar Tabela de Estados:

Crie uma tabela chamada ESTADO.
Adicione os seguintes campos à tabela:
ID (chave primária, auto-incremento)
Nome (tipo VARCHAR, não nulo)
UF (Unidade Federativa - tipo VARCHAR, não nulo)
Criar Tabela de Cidades:

Crie uma tabela chamada CIDADE.
Adicione os seguintes campos à tabela:
ID (chave primária, auto-incremento)
Nome (tipo VARCHAR, não nulo)
Estado_ID (referência à tabela ESTADO.ID)
Inserir Dados Reais:

Insira dados reais para os estados de São Paulo, Rio de Janeiro e Bahia na tabela ESTADO.
Insira cidades reais associadas a esses estados na tabela CIDADE.
Inserir Dados Fictícios:

Insira algumas cidades fictícias na tabela CIDADE que não estão associadas a nenhum estado.