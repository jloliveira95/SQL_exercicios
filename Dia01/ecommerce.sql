-- Atividade 2 Crie um banco de dados para um e-commerce, onde o sistema trabalhará com as informações dos produtos deste e-commerce. 

-- Criar a nova base de dados (banco de dados)
CREATE DATABASE ecommerce;
USE ecommerce;

-- Criar a tabela produtos
CREATE TABLE produtos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    descricao VARCHAR(255),
    preco DECIMAL(6, 2) NOT NULL,
    estoque INT NOT NULL
);

-- Inserir dados
INSERT INTO produtos (nome, descricao, preco, estoque) 
VALUES
('Notebook', 'Notebook 15 polegadas, 16GB RAM', 3500.00, 10),
('Smartphone', 'Smartphone com câmera 48MP', 1500.00, 25),
('Fone de Ouvido', 'Fone de ouvido Bluetooth', 300.00, 50),
('Mouse', 'Mouse ergonômico sem fio', 120.00, 40),
('Teclado Mecânico', 'Teclado RGB mecânico', 600.00, 30),
('Monitor', 'Monitor 24 polegadas Full HD', 800.00, 20),
('Carregador', 'Carregador universal rápido', 200.00, 100),
('Cadeira Gamer', 'Cadeira ergonômica para jogos', 1200.00, 5);

-- mostrando produtos baseando em 500 reais maior e menor
SELECT * FROM produtos WHERE preco > 500;
SELECT * FROM produtos WHERE preco < 500;

-- Atualizar o preço do Fone de Ouvido
UPDATE produtos
SET preco = 350.00
WHERE id = 3;

