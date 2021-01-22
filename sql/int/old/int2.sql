.mode columns
.headers on
.nullvalue NULL

SELECT DISTINCT P.sku, P.nome, P.stock 
    FROM Produto AS P, Consola AS C, Marca AS M
    WHERE P.sku = C.sku AND P.marca = M.id AND M.nome LIKE "%Sony%" 
    AND (P.nome LIKE "%Light%" OR P.nome LIKE "%Slim%")
    ORDER BY P.stock DESC;

-- Ponte
-- Apresenta consolas Light ou Slim da marca Sony por ordem decrescente de stock