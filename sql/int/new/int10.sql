.mode columns
.headers on
.nullvalue NULL

-- Bundles - Bundles

SELECT CB1.idBundle AS Artigo1, CB2.idBundle AS Artigo2, CB1.idCompra, "Bundle - Bundle" AS Par, count(*) AS Frequencia
    FROM CompraDoBundle As CB1, CompraDoBundle AS CB2
    WHERE CB1.idBundle < CB2.idBundle AND CB1.idCompra = CB2.idCompra
    GROUP BY Artigo1, Artigo2

UNION

-- Produtos - Produtos

SELECT CP1.idProduto AS Artigo1, CP2.idProduto AS Artigo2, CP1.idCompra, "Produto - Produto" AS Par, count(*) AS Frequencia
    FROM CompraDoProduto As CP1, CompraDoProduto AS CP2
    WHERE CP1.idProduto < CP2.idProduto AND CP1.idCompra = CP2.idCompra
    GROUP BY Artigo1, Artigo2

UNION

-- Produtos - Bundles

SELECT CP.idProduto AS Artigo1, CB.idBundle AS Artigo2, CP.idCompra, "Produto - Bundle" AS Par, count(*) AS Frequencia
    FROM CompraDoProduto As CP, CompraDoBundle AS CB
    WHERE CP.idCompra = CB.idCompra
    GROUP BY Artigo1, Artigo2
    ORDER BY Frequencia;

-- Pares de Produtos/Bundles mais vezes comprados juntos.