.mode columns
.headers on
.nullvalue NULL

SELECT DISTINCT Pv.sku, Pv.nome, Pv.precoBase
FROM Produto as Pv, Produto as Pc, Videojogo as V, Consola as C, VcompativelComC as VcC
WHERE Pv.sku = V.sku AND Pc.sku = C.sku AND Pc.nome LIKE "%Playstation 4%" AND VcC.skuC = Pc.sku AND VcC.skuV = Pv.sku
ORDER BY Pv.nome ASC;


SELECT sku, nome, precoBase FROM Produto WHERE sku in (
SELECT skuV FROM 
    Produto JOIN (SELECT skuC, skuV FROM Consola JOIN VcompativelComC ON Consola.sku = VcompativelComC.skuC) ON sku = skuC
WHERE nome like "%Playstation 4%")
ORDER BY nome ASC;

--Lista de todos os jogos compatíveis com a Playstation 4, ordenados por ordem alfabética