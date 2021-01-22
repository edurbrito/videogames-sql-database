.mode columns
.headers on
.nullvalue NULL

SELECT id, dataHora, valor, idCliente 
    FROM Compra JOIN
    (
        SELECT idCompra FROM CompraDoBundle 

        EXCEPT

        SELECT idCompra FROM CompraDoProduto

        UNION

        SELECT idCompra FROM (

            SELECT idCompra, count(*) AS nrProdutos
                FROM CompraDoProduto
                GROUP BY idCompra

            INTERSECT

            SELECT idCompra, count(*) AS nrProdutos
                FROM CompraDoProduto 
                WHERE idProduto IN
                    (SELECT sku FROM Produto WHERE idDesconto IS NOT NULL)
                GROUP BY idCompra
        )
    )
    ON id = idCompra;

-- Compras em que foram adquiridos apenas Bundles ou todos os Produtos comprados tinham Desconto.
