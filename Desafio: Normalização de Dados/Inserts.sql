INSERT INTO tb_Combustivel (idCombustivel, tipoCombustivel)
VALUES
    (1, 'Gasolina'),
    (2, 'Etanol'),
    (3, 'Diesel');

INSERT INTO tb_Carro (idCarro, kmCarro, classiCarro, marcaCarro, modeloCarro, anoCarro, idCombustivel)
VALUES
    (1, 10000, 'Sedan', 'Toyota', 'Corolla', 2019, 1),
    (2, 5000, 'Hatchback', 'Volkswagen', 'Golf', 2018, 2),
    (3, 8000, 'SUV', 'Ford', 'Escape', 2020, 3),
    (4, 12000, 'Sedan', 'Honda', 'Civic', 2017, 1),
    (5, 6000, 'Hatchback', 'Renault', 'Clio', 2016, 2),
    (6, 9000, 'SUV', 'Chevrolet', 'Traverse', 2021, 3),
    (7, 15000, 'Sedan', 'Nissan', 'Sentra', 2015, 1),
    (8, 7000, 'Hatchback', 'Ford', 'Fiesta', 2017, 2),
    (9, 10000, 'SUV', 'Toyota', 'RAV4', 2022, 3),
    (10, 20000, 'Sedan', 'Hyundai', 'Elantra', 2014, 1),
    (11, 8000, 'Hatchback', 'Volkswagen', 'Polo', 2019, 2),
    (12, 11000, 'SUV', 'Ford', 'Explorer', 2020, 3),
    (13, 13000, 'Sedan', 'Honda', 'Accord', 2016, 1),
    (14, 9000, 'Hatchback', 'Renault', 'Megane', 2017, 2),
    (15, 10000, 'SUV', 'Chevrolet', 'Equinox', 2021, 3),
    (16, 17000, 'Sedan', 'Nissan', 'Altima', 2015, 1),
    (17, 10000, 'Hatchback', 'Ford', 'Focus', 2018, 2),
    (18, 12000, 'SUV', 'Toyota', 'Highlander', 2022, 3),
    (19, 21000, 'Sedan', 'Hyundai', 'Sonata', 2014, 1),
    (20, 10000, 'Hatchback', 'Volkswagen', 'Up!', 2019, 2);
    
    INSERT INTO tb_Estado (idEstado, estadoCliente)
VALUES
    (1, 'Rio de Janeiro'),
    (2, 'Paraná'),
    (3, 'Rio Grande do Sul'),
    (4, 'Pernambuco'),
    (5, 'Sergipe'),
    (6, 'Rondônia'),
    (7, 'Tocantins'),
    (8, 'Mato Grosso'),
    (9, 'Santa Catarina'),
    (10, 'Paraíba');
    
    INSERT INTO tb_Cidade (idCidade, cidadeCliente, idEstado)
VALUES
    (1, 'Rio de Janeiro', 1),
    (2, 'Curitiba', 2),
    (3, 'Porto Alegre', 3),
    (4, 'Recife', 4),
    (5, 'Aracaju', 5),
    (6, 'Porto Velho', 6),
    (7, 'Palmas', 7),
    (8, 'Cuiabá', 8),
    (9, 'Florianópolis', 9),
    (10, 'João Pessoa', 10),
    (11, 'Niterói', 1),
    (12, 'Londrina', 2),
    (13, 'Pelotas', 3),
    (14, 'Olinda', 4),
    (15, 'São Cristóvão', 5),
    (16, 'Ji-Paraná', 6),
    (17, 'Gurupi', 7),
    (18, 'Várzea Grande', 8),
    (19, 'Blumenau', 9),
    (20, 'Campina Grande', 10);
    
    INSERT INTO tb_Endereco (idEndereco, idCidade)
VALUES
    (1, 1),
    (2, 2),
    (3, 3),
    (4, 4),
    (5, 5),
    (6, 6),
    (7, 7),
    (8, 8),
    (9, 9),
    (10, 10),
    (11, 11),
    (12, 12),
    (13, 13),
    (14, 14),
    (15, 15),
    (16, 16),
    (17, 17),
    (18, 18),
    (19, 19),
    (20, 20);
    
    INSERT INTO tb_Cliente (idCliente, nomeCliente, idEndereco)
VALUES
    (1, 'Ana Silva', 1),
    (2, 'Pedro Santos', 2),
    (3, 'Mariana Oliveira', 3),
    (4, 'Rafaela Costa', 4),
    (5, 'Lucas Souza', 5),
    (6, 'Isabela Almeida', 6),
    (7, 'Gustavo Ferreira', 7),
    (8, 'Juliana Carvalho', 8),
    (9, 'Matheus Lima', 9),
    (10, 'Sofia Rodrigues', 10),
    (11, 'Guilherme Pereira', 11),
    (12, 'Laura Gonçalves', 12),
    (13, 'Fernando Santos', 13),
    (14, 'Amanda Oliveira', 14),
    (15, 'Diego Silva', 15),
    (16, 'Beatriz Costa', 16),
    (17, 'Carlos Sousa', 17),
    (18, 'Carolina Almeida', 18),
    (19, 'Ricardo Ferreira', 19),
    (20, 'Larissa Carvalho', 20),
    (21, 'Thiago Castro', 1),
    (22, 'Gabriela Fernandes', 2),
    (23, 'Bruno Santos', 3),
    (24, 'Eduarda Lima', 4),
    (25, 'Leonardo Costa', 5),
    (26, 'Ana Clara Almeida', 6),
    (27, 'Rafaela Fernandes', 7),
    (28, 'Marcos Castro', 8),
    (29, 'Carolina Lima', 9),
    (30, 'Ricardo Souza', 10);
    
    INSERT INTO tb_Vendedor (idVendedor, nomeVendedor, sexoVendedor, idEstado)
VALUES
    (1, 'João', 1, 1),
    (2, 'Maria', 0, 2),
    (3, 'Pedro', 1, 3),
    (4, 'Ana', 0, 4),
    (5, 'José', 1, 5),
    (6, 'Fernanda', 0, 6),
    (7, 'Carlos', 1, 7),
    (8, 'Laura', 0, 8),
    (9, 'Paulo', 1, 9),
    (10, 'Luiza', 0, 10);
    
-- Definir a variável
SET @row := 0;

-- Definir a variável
SET @row := 0;


  `tmp_Locacao`;






