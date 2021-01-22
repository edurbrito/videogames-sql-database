.mode columns
.headers on
.nullvalue NULL

SELECT id, valor, idSazonal, idPorPontos
    FROM Compra
    WHERE EXISTS 
        (SELECT * FROM CompraDoProduto 
        WHERE idProduto IN 
            (SELECT sku FROM Produto 
            WHERE idDesconto NOT NULL) 
        AND idCompra = id) 
    AND (idSazonal NOT NULL OR idPorPontos NOT NULL);

-- Compras com um desconto Sazonal ou PorPontos onde foi adquirido
-- pelo menos um produto com desconto Especial