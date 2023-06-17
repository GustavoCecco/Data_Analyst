CREATE DATABASE dw_Locadora;

USE dw_Locadora;

-------------------------
-- Dimens�es
-------------------------

-- Dimens�o Vendedor
SELECT  idVendedor,
		nomeVendedor,
		CASE WHEN sexoVendedor = 1 THEN 'M'
			 WHEN sexoVendedor = 0 THEN 'F'
		ELSE 'ERRO' END AS sexoVendedor,
		idEstado
INTO dw_Locadora..Dim_Vendedor
FROM db_locadora..tb_Vendedor;


-- Dimens�o Carro
SELECT idCarro, kmCarro, classiCarro, marcaCarro, modeloCarro, anoCarro, idCombustivel
INTO dw_Locadora..Dim_Carro
FROM db_locadora..tb_Carro;


-- Dimens�o Combustivel
SELECT idCombustivel, tipoCombustivel
INTO dw_Locadora..Dim_Combustivel
FROM db_locadora..tb_Combustivel;


-- Cria��o da tabela de dimens�o Cliente incluindo Endere�o, Estado e Cidade
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

-- Fato Loca��o
SELECT idLocacao, idCliente, idCarro, dataLocacao, horaLocacao, qtdDiaria, vlrDiaria, dataEntrega, horaEntrega, idVendedor
INTO dw_locadora..Fato_Locacao
FROM db_locadora..tb_Locacao;







