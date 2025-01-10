-- ATIVIDADE 01 Crie um banco de dados para um serviço de RH de uma empresa, onde o sistema trabalhará com as informações dos colaboradores desta empresa. 


-- Criando o banco de dados
CREATE DATABASE rh_empresa;

-- Selecionando rh_empresa para uso
USE rh_empresa;

-- Criando a tabela
CREATE TABLE colaboradores (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    cargo VARCHAR(50),
    salario DECIMAL(7, 2),
    data_admissao DATE
);

-- Inserindo os registros na tabela colaboradores
INSERT INTO colaboradores (nome, cargo, salario, data_admissao) 
VALUES
('João Oliveira', 'Analista de Sistemas', 3000.00, '2021-06-15'),
('Maria Santos', 'Assistente Administrativo', 1800.00, '2020-03-10'),
('Carlos Silva', 'Desenvolvedor', 2500.00, '2022-01-20'),
('Ana Costa', 'Gerente de RH', 4000.00, '2019-11-05'),
('Lucas Pereira', 'Estagiário', 1200.00, '2023-08-01');

-- Consultas
SELECT * FROM colaboradores;
SELECT * FROM colaboradores WHERE salario > 2000;
SELECT * FROM colaboradores WHERE salario < 2000;

-- Atualizando um registro do salário de maria que houve um reajuste de 100 reais
UPDATE colaboradores 
SET salario = 1900.00 
WHERE id = 2;



