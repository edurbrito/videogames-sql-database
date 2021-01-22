.mode columns
.headers on
.nullvalue NULL

SELECT sku, nome FROM Produto NATURAL JOIN Acessorio 
WHERE EXISTS (SELECT skuP FROM BcontemP WHERE skuP = sku);

-- Acessorios associados a pelo menos 1 Bundle
