-----------------------------
-- Criando Views
-----------------------------

-- View de Carros por Combustível
-- Essa view retorna os carros com suas respectivas marcas e modelos, juntamente com o tipo de combustível associado a cada um.

CREATE VIEW vw_carros_por_combustivel AS
SELECT
    c.marcaCarro,
    c.modeloCarro,
    co.tipoCombustivel
FROM
    Dim_Carro c
    INNER JOIN Dim_Combustivel co ON c.idCombustivel = co.idCombustivel;

-- Select que irá retornar apenas os modelos e marcas que o tipo de combustivel é Gasolina
SELECT *
FROM vw_carros_por_combustivel
WHERE tipoCombustivel = 'Gasolina';


-- View de Locações com Cliente, Carro e Vendedor
-- Essa view fornece detalhes sobre as locações, incluindo informações do cliente, carro e vendedor envolvidos.

CREATE VIEW vw_locacoes_detalhadas AS
SELECT
    l.idLocacao,
    c.nomeCliente,
    ca.marcaCarro,
    v.nomeVendedor
FROM
    Fato_Locacao l
    INNER JOIN Dim_Cliente c ON l.idCliente = c.idCliente
    INNER JOIN Dim_Carro ca ON l.idCarro = ca.idCarro
    INNER JOIN Dim_Vendedor v ON l.idVendedor = v.idVendedor;


SELECT * FROM vw_locacoes_detalhadas;


-- View de locações por cidade
-- Essa view irá trazer as informações das locações juntamente com o nome do cliente e a cidade do cliente

CREATE VIEW vw_locacoes_por_cidade AS
SELECT 
		l.idLocacao, 
		c.nomeCliente, 
		c.cidadeCliente
FROM 
		Fato_Locacao l
		INNER JOIN Dim_Cliente c ON l.idCliente = c.idCliente;


SELECT * FROM vw_locacoes_por_cidade;




