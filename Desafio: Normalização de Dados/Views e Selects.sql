-- Criando Views para consultas

/* Junção entre as tabelas Dim_Carro e Dim_Combustivel para obter informações sobre a marca e o modelo dos carros,
 juntamente com o tipo de combustível associado a cada carro. */
    
CREATE VIEW vw_carros_por_combustivel AS
SELECT c.marcaCarro, c.modeloCarro, co.tipoCombustivel
FROM Dim_Carro c
INNER JOIN Dim_Combustivel co ON c.idCombustivel = co.idCombustivel;

SELECT * FROM vw_carros_por_combustivel;


/* Junções entre as tabelas Dim_Cliente, Dim_Endereço, Dim_Cidade e Dim_Estado para obter o nome dos clientes,
 juntamente com o estado em que residem. */

CREATE VIEW vw_clientes_por_estado AS
SELECT cl.nomeCliente, e.estadoCliente
FROM Dim_Cliente cl
INNER JOIN Dim_Endereço en ON cl.idEndereco = en.idEndereco
INNER JOIN Dim_Cidade ci ON en.idCidade = ci.idCidade
INNER JOIN Dim_Estado e ON ci.idEstado = e.idEstado;

SELECT * FROM vw_clientes_por_estado;

-- Consulta para obter informações dos clientes por estado. 
SELECT *
FROM vw_clientes_por_estado
WHERE estadoCliente = 'São Paulo';


-- Junção da tabela Dim_Vendedor com a tabela Fato_Locacao para calcular o total de vendas realizado por cada vendedor.

CREATE VIEW vw_vendas_por_vendedor AS
SELECT v.nomeVendedor, COUNT(*) AS total_vendas
FROM Dim_Vendedor v
INNER JOIN Fato_Locacao l ON v.idVendedor = l.idVendedor
GROUP BY v.nomeVendedor;

SELECT * FROM vw_vendas_por_vendedor;


-- Agrupa as locações na tabela Fato_Locacao por data de locação

CREATE VIEW vw_locacoes_por_data AS
SELECT DATE(dataLocacao) AS data, COUNT(*) AS total_locacoes
FROM Fato_Locacao
GROUP BY DATE(dataLocacao);

SELECT * FROM vw_locacoes_por_data;


