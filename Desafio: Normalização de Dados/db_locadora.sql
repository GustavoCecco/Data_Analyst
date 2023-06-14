
-- Criação do Schema db_locadora
CREATE SCHEMA IF NOT EXISTS `db_locadora`;
USE `db_locadora`;

-- Tabela tb_Combustivel
CREATE TABLE IF NOT EXISTS `tb_Combustivel` (
  `idCombustivel` INT NOT NULL,
  `tipoCombustivel` VARCHAR(20) NULL DEFAULT NULL,
  PRIMARY KEY (`idCombustivel`)
);

-- Tabela tb_Carro
CREATE TABLE IF NOT EXISTS `tb_Carro` (
  `idCarro` INT NOT NULL,
  `kmCarro` INT NULL DEFAULT NULL,
  `classiCarro` VARCHAR(50) NULL DEFAULT NULL,
  `marcaCarro` VARCHAR(80) NULL DEFAULT NULL,
  `modeloCarro` VARCHAR(80) NULL DEFAULT NULL,
  `anoCarro` INT NULL DEFAULT NULL,
  `idCombustivel` INT NULL DEFAULT NULL,
  PRIMARY KEY (`idCarro`),
  INDEX `fk_carrodim_combustivel` (`idCombustivel` ASC) VISIBLE,
  CONSTRAINT `fk_carrodim_combustivel`
    FOREIGN KEY (`idCombustivel`)
    REFERENCES `tb_Combustivel` (`idCombustivel`)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);

-- Tabela tb_Estado
CREATE TABLE IF NOT EXISTS `tb_Estado` (
  `idEstado` INT NOT NULL,
  `estadoCliente` VARCHAR(40) NULL DEFAULT NULL,
  PRIMARY KEY (`idEstado`)
);

-- Tabela tb_Cidade
CREATE TABLE IF NOT EXISTS `tb_Cidade` (
  `idCidade` INT NOT NULL,
  `cidadeCliente` VARCHAR(40) NULL DEFAULT NULL,
  `idEstado` INT NULL DEFAULT NULL,
  PRIMARY KEY (`idCidade`),
  INDEX `fk_cidadedim_estado` (`idEstado` ASC) VISIBLE,
  CONSTRAINT `fk_cidadedim_estado`
    FOREIGN KEY (`idEstado`)
    REFERENCES `tb_Estado` (`idEstado`)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);

-- Tabela tb_Endereco
CREATE TABLE IF NOT EXISTS `tb_Endereco` (
  `idEndereco` INT NOT NULL,
  `idCidade` INT NULL DEFAULT NULL,
  PRIMARY KEY (`idEndereco`),
  INDEX `fk_enderecodim_cidade` (`idCidade` ASC) VISIBLE,
  CONSTRAINT `fk_enderecodim_cidade`
    FOREIGN KEY (`idCidade`)
    REFERENCES `tb_Cidade` (`idCidade`)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);

-- Tabela tb_Cliente
CREATE TABLE IF NOT EXISTS `tb_Cliente` (
  `idCliente` INT NOT NULL,
  `nomeCliente` VARCHAR(100) NULL DEFAULT NULL,
  `idEndereco` INT NULL DEFAULT NULL,
  PRIMARY KEY (`idCliente`),
  INDEX `fk_clientedim_endereco` (`idEndereco` ASC) VISIBLE,
  CONSTRAINT `fk_clientedim_endereco`
    FOREIGN KEY (`idEndereco`)
    REFERENCES `tb_Endereco` (`idEndereco`)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);

-- Tabela tb_Vendedor
CREATE TABLE IF NOT EXISTS `tb_Vendedor` (
  `idVendedor` INT NOT NULL,
  `nomeVendedor` VARCHAR(15) NULL DEFAULT NULL,
  `sexoVendedor` SMALLINT NULL DEFAULT NULL,
  `idEstado` INT NULL DEFAULT NULL,
  PRIMARY KEY (`idVendedor`),
  INDEX `fk_vendedordim_estado` (`idEstado` ASC) VISIBLE,
  CONSTRAINT `fk_vendedordim_estado`
    FOREIGN KEY (`idEstado`)
    REFERENCES `tb_Estado` (`idEstado`)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);

-- Tabela tb_Locacao
CREATE TABLE IF NOT EXISTS `tb_Locacao` (
  `idLocacao` INT NOT NULL,
  `idCliente` INT NULL DEFAULT NULL,
  `idCarro` INT NULL DEFAULT NULL,
  `idVendedor` INT NULL DEFAULT NULL,
  `dataLocacao` DATETIME NULL DEFAULT NULL,
  `horaLocacao` TIME NULL DEFAULT NULL,
  `dataEntrega` DATE NULL DEFAULT NULL,
  `horaEntrega` TIME NULL DEFAULT NULL,
  `qtdDiaria` INT NULL DEFAULT NULL,
  `vlrDiaria` DECIMAL(18,2) NULL DEFAULT NULL,
  PRIMARY KEY (`idLocacao`),
  INDEX `fk_locacaofact_cliente` (`idCliente` ASC) VISIBLE,
  INDEX `fk_locacaofact_carro` (`idCarro` ASC) VISIBLE,
  INDEX `fk_locacaofact_vendedor` (`idVendedor` ASC) VISIBLE,
  CONSTRAINT `fk_locacaofact_carro`
    FOREIGN KEY (`idCarro`)
    REFERENCES `tb_Carro` (`idCarro`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_locacaofact_cliente`
    FOREIGN KEY (`idCliente`)
    REFERENCES `tb_Cliente` (`idCliente`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_locacaofact_vendedor`
    FOREIGN KEY (`idVendedor`)
    REFERENCES `tb_Vendedor` (`idVendedor`)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);

