# Locadora Database

Este repositório contém os códigos SQL para criar um banco de dados para uma locadora de veículos. O banco de dados é composto por várias tabelas que armazenam informações sobre clientes, carros, locações e vendedores. Além disso, também foram criadas visualizações para facilitar o acesso aos dados.

## Modelagem do banco de dados

O modelo de entidade e relacionamento do banco de dados é composto pelas seguintes tabelas:

- **tb_Cliente**: Armazena informações sobre os clientes da locadora, como ID, nome e endereço.
- **tb_Endereco**: Armazena informações sobre os endereços dos clientes, incluindo ID, cidade e estado.
- **tb_Cidade**: Armazena informações sobre as cidades, como ID, nome da cidade e ID do estado.
- **tb_Estado**: Armazena informações sobre os estados, como ID e nome do estado.
- **tb_Carro**: Armazena informações sobre os carros disponíveis para locação, como ID, quilometragem, classificação, marca, modelo, ano e tipo de combustível.
- **tb_Combustivel**: Armazena informações sobre os tipos de combustível disponíveis, como ID e tipo de combustível.
- **tb_Locacao**: Armazena informações sobre as locações de carros, como ID, ID do cliente, ID do carro, data de locação, hora de locação, quantidade diária, valor diário, data de entrega, hora de entrega e ID do vendedor.
- **tb_Vendedor**: Armazena informações sobre os vendedores da locadora, como ID, nome, sexo e ID do estado.

## Modelagem dimensional
Além do modelo de entidade e relacionamento, também foi criado um modelo dimensional para o banco de dados. O modelo dimensional é composto pelas seguintes tabelas:

- **Dim_Vendedor**: Tabela de dimensão que armazena informações sobre os vendedores.
- **Dim_Carro**: Tabela de dimensão que armazena informações sobre os carros.
- **Dim_Combustivel**: Tabela de dimensão que armazena informações sobre os tipos de combustível.
- **Dim_Cliente**: Tabela de dimensão que armazena informações sobre os clientes, incluindo endereço, cidade e estado.
- **Fato_Locacao**: Tabela fato que armazena informações sobre as locações de carros.

## Views
Foram criadas algumas visualizações (views) para facilitar o acesso aos dados do banco de dados. As views disponíveis são:

- **vw_carros_por_combustivel**: Retorna os carros com suas respectivas marcas e modelos, juntamente com o tipo de combustível associado a cada um.
- **vw_locacoes_detalhadas**: Fornece detalhes sobre as locações, incluindo informações do cliente, carro e vendedor envolvidos.
- **vw_locacoes_por_cidade**: Retorna as informações das locações juntamente com o nome do cliente e a cidade do cliente.

## Arquivo Power BI
Além do banco de dados, também está disponível um arquivo do Power BI que utiliza as informações do banco de dados para criar visualizações e relatórios interativos. O arquivo do Power BI permite uma análise mais aprofundada dos dados e pode ser acessado para obter insights sobre as locações de carros.

### [Dashboard Locadora]: (https://app.powerbi.com/view?r=eyJrIjoiMGYxODUyMGUtZGEzNS00ZTRiLTg1OGQtODBlYWZkNWZiYjRlIiwidCI6IjBmN2MyNzgxLTJmMTItNDEzYS1hNmI4LTlhNTQ1M2I5MWFmNCJ9)

