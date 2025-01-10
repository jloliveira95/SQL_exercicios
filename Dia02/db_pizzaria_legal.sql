-- Atividade 2 Crie um banco de dados para um serviço de uma Pizzaria. O nome do Banco de dados deverá ter o seguinte nome db_pizzaria_legal. 

-- Criação do banco de dados
CREATE DATABASE db_pizzaria_legal;
USE db_pizzaria_legal;

-- Criação da tabela tb_categorias
CREATE TABLE tb_categorias (
    id_categoria INT AUTO_INCREMENT PRIMARY KEY, -- Chave primária
    nome_categoria VARCHAR(50) NOT NULL, 		 -- Nome da categoria
    descricao VARCHAR(255) 						 -- Descrição da categoria
);

-- Inserção de dados na tabela tb_categorias
INSERT INTO tb_categorias (nome_categoria, descricao) 
VALUES
('Tradicional', 'Pizzas clássicas com sabores tradicionais'),
('Especial', 'Pizzas com combinações de ingredientes especiais'),
('Doce', 'Pizzas com sabores doces'),
('Vegetariana', 'Pizzas sem carne, focadas em vegetais e queijos'),
('Premium', 'Pizzas com ingredientes premium e sabores sofisticados');

-- Criação da tabela tb_pizzas
CREATE TABLE tb_pizzas (
    id_pizza INT AUTO_INCREMENT PRIMARY KEY, 							-- Chave primária
    nome_pizza VARCHAR(50) NOT NULL, 									-- Nome da pizza
    valor DECIMAL(10, 2) NOT NULL,										-- Valor da pizza
    tamanho VARCHAR(20), 												-- Tamanho da pizza (exemplo: Grande, Média)
    estoque INT, 														-- Quantidade disponível no estoque
    id_categoria INT, 													-- Chave estrangeira que referencia a tabela tb_categorias
    FOREIGN KEY (id_categoria) REFERENCES tb_categorias(id_categoria)	-- Criação da relação
);

-- Inserção de dados na tabela tb_pizzas
INSERT INTO tb_pizzas (nome_pizza, valor, tamanho, estoque, id_categoria) 
VALUES
('Mussarela', 40.00, 'Grande', 10, 1),
('Calabresa', 45.00, 'Grande', 8, 1),
('Quatro Queijos', 60.00, 'Média', 5, 2),
('Frango com Catupiry', 50.00, 'Grande', 7, 2),
('Chocolate', 35.00, 'Grande', 12, 3),
('Prestígio', 42.00, 'Média', 6, 3),
('Vegetariana', 55.00, 'Grande', 4, 4),
('Trufa Negra', 95.00, 'Grande', 2, 5);

-- SELECT que retorne todas as pizzas com valor maior do que R$ 45,00, no intervalo R$ 50,00 e R$ 100,00
SELECT * FROM tb_pizzas WHERE valor > 45.00;
SELECT * FROM tb_pizzas WHERE valor BETWEEN 50.00 AND 100.00;

-- SELECT utilizando o operador LIKE, buscando pizzas com a letra M no nome
SELECT * FROM tb_pizzas WHERE nome_pizza LIKE '%M%';

-- SELECT utilizando INNER JOIN para unir tb_pizzas e tb_categorias
SELECT 
    p.id_pizza, 
    p.nome_pizza, 
    p.valor, 
    p.tamanho, 
    c.nome_categoria 
FROM tb_pizzas p
INNER JOIN tb_categorias c ON p.id_categoria = c.id_categoria;

-- SELECT utilizando INNER JOIN para unir tb_pizzas e tb_categorias com uma categoria específica (Doce)
SELECT 
    p.id_pizza, 
    p.nome_pizza, 
    p.valor, 
    p.tamanho, 
    c.nome_categoria 
FROM tb_pizzas p
INNER JOIN tb_categorias c ON p.id_categoria = c.id_categoria
WHERE c.nome_categoria = 'Doce';
