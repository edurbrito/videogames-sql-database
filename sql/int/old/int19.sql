.mode columns
.headers on
.nullvalue NULL

SELECT nome, p_qtd
        FROM Produto NATURAL JOIN 
                ( SELECT skuP AS sku, quantidade * b_qtd AS p_qtd
                        FROM BcontemP JOIN
                                (SELECT idBundle, count(idBundle) * quantidade AS b_qtd
                                        FROM CompraDoBundle
                                        GROUP BY idBundle)
                        ON idB = idBundle
                UNION
                SELECT idProduto AS sku, count(idProduto) * quantidade AS p_qtd
                        FROM CompraDoProduto
                        GROUP BY idProduto) 
        ORDER BY p_qtd DESC;

-- Produtos Mais Comprados incluindo em Bundles