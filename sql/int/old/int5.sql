.mode columns
.headers on
.nullvalue NULL

SELECT Pa.nome AS Acessorio, Pv.nome AS Videojogo, (Pa.precoBase + Pv.precoBase) AS PrecoConjunto
    FROM 
    AcompativelComC AS AcC JOIN VcompativelComC AS VcC ON AcC.skuC = VcC.skuC,
    Produto AS Pc, Produto AS Pa, Produto AS Pv
    WHERE Pc.sku = AcC.skuC AND Pc.nome = 'Nintendo Switch Light' 
    AND Pa.sku = AcC.skuA AND Pv.sku = VcC.skuV
    AND PrecoConjunto BETWEEN 40 AND 70
    ORDER BY PrecoConjunto ASC;

-- Ponte
-- Sugere pares de acessórios e videojogos compatíveis com a Nintendo Switch Light, cujo preço total está
-- compreendido entre 40 e 70 euros, ordenado por ordem crescente de preços