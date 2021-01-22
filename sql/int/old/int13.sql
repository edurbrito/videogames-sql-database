.mode columns
.headers on
.nullvalue NULL

SELECT sku, nome, precoBase, nrAcomp 
    FROM Produto JOIN
        (SELECT skuC, count(*) AS nrAcomp FROM AcompativelComC GROUP BY skuC) 
        ON sku = skuC 
    ORDER BY nrAcomp DESC, precoBase DESC
    LIMIT 3;

-- 3 primeiras Consolas com maior número de Acessorios Compatíveis