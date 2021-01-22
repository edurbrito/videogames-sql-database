.mode columns
.headers on
.nullvalue NULL

SELECT sku, nome, stock-qtd AS new_stock 
FROM Produto JOIN 
    (SELECT skuP, sum(quantidade) AS qtd FROM BcontemP GROUP BY skuP) 
    ON Produto.sku = skuP 
WHERE new_stock < 3;

-- Produtos em risco de esgotar se for comprado um Bundle de cada um que os contenham