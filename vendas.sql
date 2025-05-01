-- Criando o banco de dados
CREATE DATABASE vendas;
USE vendas;

-- Criando tabelas
CREATE TABLE produto (
    id_produto INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(255) NOT NULL,
    preco DECIMAL(10, 2) NOT NULL
);

CREATE TABLE venda (
    id_venda INT PRIMARY KEY AUTO_INCREMENT,
    id_produto INT NOT NULL,
    quantidade INT NOT NULL CHECK (quantidade > 0),
    data_venda DATE NOT NULL,
    FOREIGN KEY (id_produto) REFERENCES produto(id_produto) ON DELETE CASCADE
);

-- Inserindo dados nas tabelas
INSERT INTO produto (nome, preco) VALUES
('Notebook', 3500.00),
('Smartphone', 2000.00),
('Fone de Ouvido', 150.00);

INSERT INTO venda (id_produto, quantidade, data_venda) VALUES
(1, 2, '2025-05-01'), 
(2, 5, '2025-05-01'), 
(3, 10, '2025-05-02'), 
(1, 1, '2025-05-02'), 
(2, 3, '2025-05-03'); 

-- Procedure para relatório 
DELIMITER //
CREATE PROCEDURE RelatorioVendasDiario()
BEGIN
    SELECT 
        p.nome AS 'Nome do Produto',
        SUM(v.quantidade) AS 'Quantidade',
        MAX(v.data_venda) AS 'Data Mais Recente'
    FROM venda v
    INNER JOIN produto p ON v.id_produto = p.id_produto
    GROUP BY p.nome
    ORDER BY p.nome;
END //
DELIMITER ;

-- Chamada do procedure
CALL RelatorioVendasDiario();