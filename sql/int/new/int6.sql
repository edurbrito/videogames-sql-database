.mode columns
.headers on
.nullvalue NULL

SELECT id AS idCompra, valor, idSazonal, idPorPontos
    FROM Compra
    WHERE EXISTS 
        (SELECT * FROM CompraDoProduto 
        WHERE idProduto IN 
            (SELECT sku FROM Produto 
            WHERE idDesconto IS NOT NULL) 
        AND idCompra = id) 
    AND (idSazonal IS NOT NULL OR idPorPontos IS NOT NULL);

-- Compras com um Desconto Sazonal ou PorPontos onde foi adquirido pelo menos um produto com Desconto Especial.