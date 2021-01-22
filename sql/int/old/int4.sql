.mode columns
.headers on
.nullvalue NULL

SELECT DISTINCT B.id, B.nome, B.preco
    FROM Bundle AS B, BcontemP AS BcP, Produto AS P, Acessorio AS A
    WHERE BcP.idB = B.id AND BcP.skuP = P.sku AND P.sku = A.sku

INTERSECT

SELECT DISTINCT B.id, B.nome, B.preco
    FROM Bundle AS B, BcontemP AS BcP, Produto AS P, Consola AS C
    WHERE BcP.idB = B.id AND BcP.skuP = P.sku AND P.sku = C.sku
    ORDER BY B.preco DESC;

-- Ponte
-- Apresenta os bundles constituídos por uma consola e um acessório, ordenados por ordem decrescente de preços