.mode columns
.headers on
.nullvalue NULL

-- Considera Bundle Como Desconto
SELECT idCompra
FROM
(SELECT DISTINCT idCompra, count(*) as total
FROM CompraDoProduto,Produto,Compra
WHERE idProduto=sku AND sku IN (SELECT sku FROM Produto WHERE idDesconto NOT NULL) AND (idCompra=compra.id AND idSazonal IS NULL AND idPorPontos IS NULL)
GROUP BY nome

INTERSECT

SELECT idCompra,count(idCompra) FROM CompraDoProduto, Compra WHERE idCompra=id GROUP BY idCompra)

UNION

SELECT id
FROM Compra
WHERE idPorPontos NOT NULL OR idSazonal NOT NULL;
----------------------------------
-- Nao Considera Bundle como Desconto
SELECT id
FROM Compra
WHERE id NOT IN
(SELECT DISTINCT idCompra
FROM CompraDoProduto,Produto,Compra
WHERE idProduto=sku AND sku IN (SELECT sku FROM Produto WHERE idDesconto IS NULL) AND (idCompra=compra.id AND idSazonal IS NULL AND idPorPontos IS NULL)
GROUP BY nome)

INTERSECT

SELECT id
FROM Compra
WHERE id NOT IN
(SELECT DISTINCT idCompra
FROM CompraDoBundle,Produto,Compra
WHERE idBundle=sku AND sku IN (SELECT sku FROM Produto WHERE idDesconto IS NULL) AND (idCompra=compra.id AND idSazonal IS NULL AND idPorPontos IS NULL)
GROUP BY nome)

-- Compras com Todos os Produtos com Desconto

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
                    (SELECT sku FROM Produto WHERE idDesconto NOT NULL)
                GROUP BY idCompra
            
        )
    )
    ON id = idCompra;