.mode columns
.headers on
.nullvalue NULL

SELECT P.sku, P.nome, P.precoBase, printf("%.2f", P.precoBase * (1-D.percentagem)) AS PrecoComDesconto   
    FROM Produto AS P, Videojogo AS V, DescontoEspecial AS D
    WHERE P.sku = V.sku AND P.idDesconto = D.id AND P.stock > 3
    ORDER BY PrecoComDesconto DESC;

SELECT P.sku, P.nome, P.precoBase, printf("%.2f", P.precoBase * (1-D.percentagem)) AS PrecoComDesconto
FROM (Produto AS P NATURAL JOIN Videojogo) JOIN DescontoEspecial AS D 
ON P.idDesconto = D.id
WHERE P.stock > 3
ORDER BY PrecoComDesconto DESC;

-- Ponte
-- Seleciona os Videojogos que tem desconto especial e stock maior que 3 e apresenta-os por ordem decrescente de preço