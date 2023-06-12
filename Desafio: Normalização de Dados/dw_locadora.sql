-- Criação do banco de dados

CREATE DATABASE IF NOT EXISTS dw_locadora;

USE dw_locadora;

-- -----------------------------------------------------
-- Criação das tabelas Dimensões
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS Dim_Combustivel (
  idCombustivel INT NOT NULL,
  tipoCombustivel VARCHAR(20) NULL DEFAULT NULL,
  PRIMARY KEY (idCombustivel));

-- -----------------------------------------------------
-- Tabela Dim_Carro
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS Dim_Carro (
  idCarro INT NOT NULL,
  kmCarro INT NULL DEFAULT NULL,
  classiCarro VARCHAR(50) NULL DEFAULT NULL,
  marcaCarro VARCHAR(80) NULL DEFAULT NULL,
  modeloCarro VARCHAR(80) NULL DEFAULT NULL,
  anoCarro INT NULL DEFAULT NULL,
  idCombustivel INT NULL DEFAULT NULL,
  PRIMARY KEY (idCarro),
  INDEX fk_carrodim_combustivel (idCombustivel ASC) VISIBLE,
  CONSTRAINT fk_carrodim_combustivel
  FOREIGN KEY (idCombustivel)
  REFERENCES Dim_Combustivel (idCombustivel));


-- -----------------------------------------------------
-- Tabela Dim_Estado
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS Dim_Estado (
  idEstado INT NOT NULL,
  estadoCliente VARCHAR(40) NULL DEFAULT NULL,
  PRIMARY KEY (idEstado));


-- -----------------------------------------------------
-- Tabela Dim_Cidade
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS Dim_Cidade (
  idCidade INT NOT NULL,
  cidadeCliente VARCHAR(40) NULL DEFAULT NULL,
  idEstado INT NULL DEFAULT NULL,
  PRIMARY KEY (idCidade),
  INDEX fk_cidadedim_estado (idEstado ASC) VISIBLE,
  CONSTRAINT fk_cidadedim_estado
  FOREIGN KEY (idEstado)
  REFERENCES Dim_Estado (idEstado));


-- -----------------------------------------------------
-- Tabela Dim_Endereço
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS Dim_Endereço (
  idEndereco INT NOT NULL,
  idCidade INT NULL DEFAULT NULL,
  PRIMARY KEY (idEndereco),
  INDEX fk_enderecodim_cidade (idCidade ASC) VISIBLE,
  CONSTRAINT fk_enderecodim_cidade
  FOREIGN KEY (idCidade)
  REFERENCES Dim_Cidade (idCidade));


-- -----------------------------------------------------
-- Tabela Dim_Cliente
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS Dim_Cliente (
  idCliente INT NOT NULL,
  nomeCliente VARCHAR(100) NULL DEFAULT NULL,
  idEndereco INT NULL DEFAULT NULL,
  PRIMARY KEY (idCliente),
  INDEX fk_clientedim_endereco (idEndereco ASC) VISIBLE,
  CONSTRAINT fk_clientedim_endereco
    FOREIGN KEY (idEndereco)
    REFERENCES Dim_Endereço (idEndereco));


-- -----------------------------------------------------
-- Tabela Dim_Vendedor
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS Dim_Vendedor (
  idVendedor INT NOT NULL,
  nomeVendedor VARCHAR(15) NULL DEFAULT NULL,
  sexoVendedor SMALLINT NULL DEFAULT NULL,
  idEstado INT NULL DEFAULT NULL,
  PRIMARY KEY (idVendedor),
  INDEX fk_vendedordim_estado (idEstado ASC) VISIBLE,
  CONSTRAINT fk_vendedordim_estado
  FOREIGN KEY (idEstado)
  REFERENCES Dim_Estado (idEstado));


-- -----------------------------------------------------
-- Tabela Fato_Locacao
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS Fato_Locacao (
  idLocacao INT NOT NULL,
  idCliente INT NULL DEFAULT NULL,
  idCarro INT NULL DEFAULT NULL,
  idVendedor INT NULL DEFAULT NULL,
  dataLocacao DATETIME NULL DEFAULT NULL,
  horaLocacao TIME NULL DEFAULT NULL,
  dataEntrega DATE NULL DEFAULT NULL,
  horaEntrega TIME NULL DEFAULT NULL,
  qtdDiaria INT NULL DEFAULT NULL,
  vlrDiaria DECIMAL(18,2) NULL DEFAULT NULL,
  PRIMARY KEY (idLocacao),
  INDEX fk_locacaofact_cliente (idCliente ASC) VISIBLE,
  INDEX fk_locacaofact_carro (idCarro ASC) VISIBLE,
  INDEX fk_locacaofact_vendedor (idVendedor ASC) VISIBLE,
  CONSTRAINT fk_locacaofact_carro
    FOREIGN KEY (idCarro)
    REFERENCES Dim_Carro (idCarro),
  CONSTRAINT fk_locacaofact_cliente
    FOREIGN KEY (idCliente)
    REFERENCES Dim_Cliente (idCliente),
  CONSTRAINT fk_locacaofact_vendedor
    FOREIGN KEY (idVendedor)
    REFERENCES Dim_Vendedor (idVendedor));


-- -----------------------------------------------------
-- Inserindo dados nas tabelas
-- -----------------------------------------------------
-- Inserção de dados na tabela Dim_Combustivel
INSERT INTO Dim_Combustivel (idCombustivel, tipoCombustivel) VALUES
  (1, 'Gasolina'),
  (2, 'Etanol'),
  (3, 'Diesel');


-- Inserção de dados na tabela Dim_Carro
INSERT INTO Dim_Carro (idCarro, kmCarro, classiCarro, marcaCarro, modeloCarro, anoCarro, idCombustivel) VALUES
  (1, 5000, 'Sedan', 'Toyota', 'Corolla', 2021, 1),
  (2, 10000, 'SUV', 'Honda', 'HR-V', 2020, 2),
  (3, 8000, 'Hatchback', 'Volkswagen', 'Gol', 2019, 1),
  (4, 12000, 'Sedan', 'Chevrolet', 'Cruze', 2022, 3),
  (5, 15000, 'SUV', 'Ford', 'EcoSport', 2018, 1);


-- Inserção de dados na tabela Dim_Estado
INSERT INTO Dim_Estado (idEstado, estadoCliente) VALUES
  (1, 'São Paulo'),
  (2, 'Rio de Janeiro'),
  (3, 'Minas Gerais'),
  (4, 'Rio Grande do Sul'),
  (5, 'Santa Catarina');


-- Inserção de dados na tabela Dim_Cidade
INSERT INTO Dim_Cidade (idCidade, cidadeCliente, idEstado) VALUES
  (1, 'São Paulo', 1),
  (2, 'Rio de Janeiro', 2),
  (3, 'Belo Horizonte', 3),
  (4, 'Passo Fundo', 4),
  (5, 'Chapeco', 5);
  

-- Inserção de dados na tabela Dim_Endereço
INSERT INTO Dim_Endereço (idEndereco, idCidade) VALUES
  (1, 1),
  (2, 2),
  (3, 3),
  (4, 4),
  (5, 5);


-- Inserção de dados na tabela Dim_Cliente
INSERT INTO Dim_Cliente (idCliente, nomeCliente, idEndereco) VALUES
  (1, 'João Silva', 1),
  (2, 'Maria Santos', 2),
  (3, 'Pedro Oliveira', 3),
  (4, 'Fernanda Oliveira', 4),
  (5, 'Rafael Souza', 5),
  (6, 'Juliana Rodrigues', 4),
  (7, 'Lucas Santos', 5),
  (8, 'Mariana Almeida', 3),
  (9, 'Gustavo Ferreira', 1),
  (10, 'Carolina Lima', 2),
  (11, 'Pedro Henrique', 4),
  (12, 'Larissa Silva', 5),
  (13, 'Rodrigo Costa', 3);


-- Inserção de dados na tabela Dim_Vendedor
INSERT INTO Dim_Vendedor (idVendedor, nomeVendedor, sexoVendedor, idEstado) VALUES
  (1, 'Carlos', 1, 1),
  (2, 'Ana', 0, 2),
  (3, 'José', 1, 3),
  (4, 'Ana Paula', 0, 1),
  (5, 'Lucas Oliveira', 1, 2),
  (6, 'Mariana Santos', 0, 3),
  (7, 'Pedro Almeida', 1, 1),
  (8, 'Carolina', 0, 4),
  (9, 'Rodrigo Costa', 1, 5),
  (10, 'Isabela Silva', 0, 1),
  (11, 'Rafaela Sousa', 0, 4),
  (12, 'Marcelo Santos', 1, 5),
  (13, 'Fernanda', 0, 1);


-- Inserção de dados na tabela Fato_Locacao
INSERT INTO Fato_Locacao (idLocacao, idCliente, idCarro, idVendedor, dataLocacao, horaLocacao, dataEntrega, horaEntrega, qtdDiaria, vlrDiaria) VALUES
  (1, 1, 1, 1, '2023-01-01', '10:00:00', '2023-01-02', '10:00:00', 1, 100),
  (2, 2, 2, 2, '2023-02-01', '11:00:00', '2023-02-02', '11:00:00', 2, 150),
  (3, 3, 3, 3, '2023-03-01', '12:00:00', '2023-03-02', '12:00:00', 3, 200),
  (4, 4, 4, 4, '2023-04-01', '13:00:00', '2023-04-02', '13:00:00', 1, 100),
  (5, 5, 5, 5, '2023-05-01', '14:00:00', '2023-05-02', '14:00:00', 2, 150),
  (6, 6, 5, 6, '2023-06-01', '15:00:00', '2023-06-02', '15:00:00', 3, 200),
  (7, 7, 3, 7, '2023-07-01', '16:00:00', '2023-07-02', '16:00:00', 4, 250),
  (8, 8, 2, 8, '2023-08-01', '17:00:00', '2023-08-02', '17:00:00', 2, 150),
  (9, 9, 1, 9, '2023-09-01', '18:00:00', '2023-09-02', '18:00:00', 3, 200),
  (10, 10, 3, 10, '2023-10-01', '19:00:00', '2023-10-02', '19:00:00', 1, 100),
  (11, 11, 4, 11, '2023-11-01', '20:00:00', '2023-11-02', '20:00:00', 2, 150),
  (12, 12, 5, 12, '2023-12-01', '21:00:00', '2023-12-02', '21:00:00', 3, 200),
  (13, 13, 2, 13, '2024-01-01', '22:00:00', '2024-01-02', '22:00:00', 4, 250);


SELECT * FROM dim_cliente;

