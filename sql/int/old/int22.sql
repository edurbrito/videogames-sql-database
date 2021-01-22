.mode columns
.headers on
.nullvalue NULL

SELECT nome, count(stock) as Total_products
From Marca
NATURAL JOIN
(SELECT marca as id, stock
FROM Produto)
GROUP BY nome
Order By Total_products DESC;

-- Numero de produtos existentes de cada marca