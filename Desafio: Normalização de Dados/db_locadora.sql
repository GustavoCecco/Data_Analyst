-- Criação do banco de dados

CREATE DATABASE db_locadora;
USE db_locadora;

----------------------------------
-- Criando as tabelas
----------------------------------

-- Criação da tabela Cliente
CREATE TABLE tb_Cliente (
  idCliente INT PRIMARY KEY,
  nomeCliente VARCHAR(100),
  idEndereco INT,
  CONSTRAINT fk_cliente_endereco FOREIGN KEY (idEndereco) REFERENCES tb_Endereco (idEndereco)
);

-- Criação da tabela Endereco
CREATE TABLE tb_Endereco (
  idEndereco INT PRIMARY KEY,
  idCidade INT,
  CONSTRAINT fk_endereco_cidade FOREIGN KEY (idCidade) REFERENCES tb_Cidade (idCidade)
);

-- Criação da tabela Cidade
CREATE TABLE tb_Cidade (
  idCidade INT PRIMARY KEY,
  cidadeCliente VARCHAR(40),
  idEstado INT,
  CONSTRAINT fk_cidade_estado FOREIGN KEY (idEstado) REFERENCES tb_Estado (idEstado)
);

-- Criação da tabela Estado
CREATE TABLE tb_Estado (
  idEstado INT PRIMARY KEY,
  estadoCliente VARCHAR(40)
);

-- Criação da tabela Carro
CREATE TABLE tb_Carro (
  idCarro INT PRIMARY KEY,
  kmCarro INT,
  classiCarro VARCHAR(50),
  marcaCarro VARCHAR(80),
  modeloCarro VARCHAR(80),
  anoCarro INT,
  idCombustivel INT,
  CONSTRAINT fk_carro_combustivel FOREIGN KEY (idCombustivel) REFERENCES tb_Combustivel (idCombustivel)
);

-- Criação da tabela Combustivel
CREATE TABLE tb_Combustivel (
  idCombustivel INT PRIMARY KEY,
  tipoCombustivel VARCHAR(20)
);

-- Criação da tabela Locacao
CREATE TABLE tb_Locacao (
  idLocacao INT PRIMARY KEY,
  idCliente INT,
  idCarro INT,
  dataLocacao DATETIME,
  horaLocacao TIME,
  qtdDiaria INT,
  vlrDiaria DECIMAL(18, 2),
  dataEntrega DATE,
  horaEntrega TIME,
  idVendedor INT,
  CONSTRAINT fk_locacao_cliente FOREIGN KEY (idCliente) REFERENCES tb_Cliente (idCliente),
  CONSTRAINT fk_locacao_carro FOREIGN KEY (idCarro) REFERENCES tb_Carro (idCarro),
  CONSTRAINT fk_locacao_vendedor FOREIGN KEY (idVendedor) REFERENCES tb_Vendedor (idVendedor)
);

-- Criação da tabela Vendedor
CREATE TABLE tb_Vendedor (
  idVendedor INT PRIMARY KEY,
  nomeVendedor VARCHAR(15),
  sexoVendedor SMALLINT,
  idEstado INT,
  CONSTRAINT fk_vendedor_estado FOREIGN KEY (idEstado) REFERENCES tb_Estado (idEstado)
);
