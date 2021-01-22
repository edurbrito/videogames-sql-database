.mode columns
.headers on
.nullvalue NULL

SELECT  *, valor / (1-percentagem) AS semDesconto FROM
(SELECT C.id, valor, percentagem, 'sazonal' AS tipo FROM Compra AS C
JOIN DescontoSazonal AS Ds ON C.idSazonal = Ds.id
UNION
SELECT C.id, valor, percentagem, 'pontos' AS tipo FROM Compra AS C
JOIN DescontoPorPontos AS Dp ON C.idPorPontos = Dp.id);

-- Valor sem desconto de compras com um desconto por pontos ou sazonal