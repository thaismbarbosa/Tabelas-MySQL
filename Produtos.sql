CREATE DATABASE produtos;
USE produtos;

CREATE TABLE produtos(
	id_produto INT PRIMARY KEY AUTO_INCREMENT,
    nome_produto VARCHAR(100) NOT NULL,
    quantidade INT,
	preco DECIMAL(10,2)
    );

INSERT INTO produtos (nome_produto, quantidade, preco)
VALUES 
('Luva de Boxe Profissional', 15, 199.90),
('Kimono Jiu-Jitsu Infantil', 10, 249.50),
('Corda de Pular Speed', 30, 39.99);


