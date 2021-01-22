.mode columns
.headers on
.nullvalue NULL

SELECT nome, vezesComprado
        FROM Produto NATURAL JOIN 
                (SELECT skuP AS sku, quantidade * b_qtd AS vezesComprado
                        FROM BcontemP JOIN
                                (SELECT idBundle, sum(quantidade) AS b_qtd
                                        FROM CompraDoBundle
                                        GROUP BY idBundle)
                        ON idB = idBundle
                UNION
                SELECT idProduto AS sku, sum(quantidade) AS vezesComprado
                    FROM CompraDoProduto
                    GROUP BY idProduto) 
        ORDER BY vezesComprado DESC;

-- Produtos mais vezes comprados, incluindo em Bundles.