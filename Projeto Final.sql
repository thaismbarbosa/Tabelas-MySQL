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

CREATE TABLE vendas(
    id_venda INT PRIMARY KEY AUTO_INCREMENT,
    data_venda DATETIME DEFAULT CURRENT_TIMESTAMP,
    total_venda DECIMAL(10,02)
);

CREATE TABLE itens_venda(
    id_item_venda INT PRIMARY KEY AUTO_INCREMENT,
    id_venda INT NOT NULL,
    id_produto INT NOT NULL,
    quantidade_vendida INT NOT NULL,
    preco_unitario DECIMAL(10,02) NOT NULL,
    FOREIGN KEY (id_venda) REFERENCES vendas(id_venda),
    FOREIGN KEY (id_produto) REFERENCES produtos(id_produto)
);

INSERT INTO vendas (total_venda) VALUES (439.79);

INSERT INTO itens_venda(id_venda, id_produto, quantidade_vendida, preco_unitario)
VALUES(1,1,2,199.90);
INSERT INTO itens_venda(id_venda, id_produto, quantidade_vendida, preco_unitario)
VALUES(1,3,1,39.99);

UPDATE produtos
SET quantidade = quantidade - 2
WHERE id_produto = 1;

UPDATE produtos
SET quantidade = quantidade - 1
WHERE id_produto = 3;

SELECT * FROM vendas;
