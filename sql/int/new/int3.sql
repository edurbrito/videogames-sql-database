.mode columns
.headers on
.nullvalue NULL

SELECT sku, nome, precoBase, nrAcomp 
    FROM Produto JOIN
        (SELECT skuC, count(*) AS nrAcomp FROM AcompativelComC GROUP BY skuC) 
        ON sku = skuC 
    ORDER BY nrAcomp DESC, precoBase DESC
    LIMIT 3;

-- Mostra as 3 primeiras Consolas com maior número de Acessorios Compatíveis e, no caso de empate, ordenadas pelo valor descendente de preço.
