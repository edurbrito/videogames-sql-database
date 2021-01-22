.mode columns
.headers on
.nullvalue NULL

SELECT sku, nome, percentagem, stock
FROM Produto
NATURAL JOIN
(SELECT percentagem
FROM DescontoEspecial)
 GROUP By nome
 ORDER By sku ASC;

 --Produtos que tem desconto especial