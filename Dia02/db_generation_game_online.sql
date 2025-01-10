-- ATIVIDADE 01 Crie um banco de dados para um serviço de um Games Online. 

-- Criando o banco de dados
CREATE DATABASE db_generation_game_online;

-- Usando o banco de dados criado
USE db_generation_game_online;

-- Criando a tabela tb_classes
CREATE TABLE tb_classes (
    id INT AUTO_INCREMENT PRIMARY KEY,  -- Chave primária
    nome VARCHAR(50) NOT NULL,          -- Nome da classe
    descricao TEXT                      -- Descrição da classe
);

-- Criando a tabela tb_personagens
CREATE TABLE tb_personagens (
    id INT AUTO_INCREMENT PRIMARY KEY,                 -- Chave primária
    nome VARCHAR(50) NOT NULL,                         -- Nome do personagem
    poder_ataque INT NOT NULL,                         -- Poder de ataque
    poder_defesa INT NOT NULL,                         -- Poder de defesa
    id_classe INT,                                     -- Chave estrangeira
    FOREIGN KEY (id_classe) REFERENCES tb_classes(id)  -- Relacionamento com a tabela tb_classes
);

-- Inserindo 5 registros na tabela tb_classes
INSERT INTO tb_classes (nome, descricao) VALUES
('Guerreiro', 'Classe focada no combate físico e resistência.'),
('Mago', 'Classe focada em magias e ataques a distância.'),
('Arqueiro', 'Classe focada em ataques à distância e velocidade.'),
('Assassino', 'Classe focada em furtividade e ataques rápidos.'),
('Clérigo', 'Classe focada em cura e suporte aos aliados.');

-- Inserindo 8 registros na tabela tb_personagens
INSERT INTO tb_personagens (nome, poder_ataque, poder_defesa, id_classe) VALUES
('Arthur', 2500, 1500, 1),    -- Guerreiro
('Merlin', 1800, 1000, 2),    -- Mago
('Lia', 2200, 1300, 3),       -- Arqueiro
('Dante', 2800, 2000, 4),     -- Assassino
('Eloise', 1500, 1800, 5),    -- Clérigo
('Ragnar', 2600, 1700, 1),    -- Guerreiro
('Saphira', 2100, 1100, 2),   -- Mago
('Kai', 2400, 1200, 3);       -- Arqueiro

-- SELECT para retornar personagens com poder de ataque maior que 2000 e entre 1000 e 2000
SELECT * FROM tb_personagens WHERE poder_ataque > 2000;
SELECT * FROM tb_personagens WHERE poder_defesa BETWEEN 1000 AND 2000;

-- SELECT com operador LIKE buscando a letra C no nome dos personagens
SELECT * FROM tb_personagens WHERE nome LIKE '%a%';

-- SELECT com INNER JOIN unindo tb_personagens e tb_classes
SELECT p.nome AS personagem, p.poder_ataque, p.poder_defesa, c.nome AS classe
FROM tb_personagens p
INNER JOIN tb_classes c ON p.id_classe = c.id;

-- SELECT com INNER JOIN para trazer apenas os personagens da classe "Arqueiro"
SELECT p.nome AS personagem, p.poder_ataque, p.poder_defesa, c.nome AS classe
FROM tb_personagens p
INNER JOIN tb_classes c ON p.id_classe = c.id
WHERE c.nome = 'Arqueiro';
