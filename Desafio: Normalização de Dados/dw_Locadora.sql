CREATE DATABASE dw_Locadora;

USE dw_Locadora;

-------------------------
-- Dimensões
-------------------------

-- Dimensão Vendedor
SELECT  idVendedor,
		nomeVendedor,
		CASE WHEN sexoVendedor = 1 THEN 'M'
			 WHEN sexoVendedor = 0 THEN 'F'
		ELSE 'ERRO' END AS sexoVendedor,
		idEstado
INTO dw_Locadora..Dim_Vendedor
FROM db_locadora..tb_Vendedor;


-- Dimensão Carro
SELECT idCarro, kmCarro, classiCarro, marcaCarro, modeloCarro, anoCarro, idCombustivel
INTO dw_Locadora..Dim_Carro
FROM db_locadora..tb_Carro;


-- Dimensão Combustivel
SELECT idCombustivel, tipoCombustivel
INTO dw_Locadora..Dim_Combustivel
FROM db_locadora..tb_Combustivel;


-- Criação da tabela de dimensão Cliente incluindo Endereço, Estado e Cidade
CREATE TABLE Dim_Cliente (
  idCliente INT PRIMARY KEY,
  nomeCliente VARCHAR(100),
  idEndereco INT,
  idCidade INT,
  cidadeCliente VARCHAR(40),
  idEstado INT,
  estadoCliente VARCHAR(40)
);


-------------------------
-- Tabela Fato
-------------------------

-- Fato Locação
SELECT idLocacao, idCliente, idCarro, dataLocacao, horaLocacao, qtdDiaria, vlrDiaria, dataEntrega, horaEntrega, idVendedor
INTO dw_locadora..Fato_Locacao
FROM db_locadora..tb_Locacao;







