.mode columns
.headers on
.nullvalue NULL

SELECT avg(valor) AS Media FROM Compra WHERE 
id IN (
SELECT idCompra AS id FROM CompraDoProduto AS CP JOIN (
    SELECT sku FROM Produto
    EXCEPT 
    SELECT sku FROM Videojogo WHERE dataLancamento > "2018-01-01") P 
ON CP.idProduto = P.sku ) AND dataHora > "2020-04-10 0:0:0";

-- Média do valor de compras efetuadas desde o dia 2020-04-10 de produtos únicos
-- que não sejam de Videojogos recentes, isto é, lançados a partir de 2018