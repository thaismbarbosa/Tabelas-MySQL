CREATE DATABASE estoque;
USE estoque;

CREATE TABLE produtos(
    id_produto INT PRIMARY KEY AUTO_INCREMENT,
    nome_produto VARCHAR(100),
    quantidade INT,
    preco DECIMAL(10,2)
);

CREATE TABLE fornecedores(
    id_fornecedor INT PRIMARY KEY AUTO_INCREMENT,
    nome_fornecedor VARCHAR(100)
);

CREATE TABLE estoque(
    id_estoque INT PRIMARY KEY AUTO_INCREMENT,
    id_produto INT,
    id_fornecedor INT,
    quantidade INT,
    data_entrada DATE,
    FOREIGN KEY (id_produto) REFERENCES produtos(id_produto),
    FOREIGN KEY (id_fornecedor) REFERENCES fornecedores(id_fornecedor)
);

INSERT INTO produtos (nome_produto, quantidade, preco) VALUES
('Luva de Boxe Profissional', 15, 199.90),
('Kimono Jiu-Jitsu Infantil', 10, 249.50),
('Corda de Pular Speed', 30, 39.99);

INSERT INTO fornecedores (nome_fornecedor) VALUES
('Fornecedor A'),
('Fornecedor B'),
('Fornecedor C');

INSERT INTO estoque (id_produto, id_fornecedor, quantidade, data_entrada) VALUES
(1, 1, 10, '2025-07-01'),
(2, 2, 5, '2025-07-15'),
(3, 3, 20, '2025-07-20');

SELECT p.nome_produto, f.nome_fornecedor, e.quantidade, e.data_entrada
FROM estoque AS e
LEFT JOIN produtos AS p ON e.id_produto = p.id_produto
LEFT JOIN fornecedores AS f ON e.id_fornecedor = f.id_fornecedor
UNION
SELECT p.nome_produto, f.nome_fornecedor, e.quantidade, e.data_entrada
FROM estoque AS e
RIGHT JOIN produtos AS p ON e.id_produto = p.id_produto
RIGHT JOIN fornecedores AS f ON e.id_fornecedor = f.id_fornecedor;


	




