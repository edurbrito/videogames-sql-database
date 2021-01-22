###### Fáceis

### 1. 
#### Apresenta os videojogos lançados em 2019, ordenados por ordem crescente da sua data de lançamento.

```sql

SELECT P.nome, V.dataLancamento
    FROM Produto AS P, Videojogo AS V
    WHERE P.sku = V.sku AND V.dataLancamento BETWEEN '2019-01-01' AND '2019-12-31'
    ORDER BY V.dataLancamento ASC;

```

### 2.
#### Apresenta os bundles constituídos por uma consola e um acessório, ordenados por ordem decrescente de preço.

```sql

SELECT DISTINCT B.id, B.nome, B.preco
    FROM Bundle AS B, BcontemP AS BcP, Produto AS P, Acessorio AS A
    WHERE BcP.idB = B.id AND BcP.skuP = P.sku AND P.sku = A.sku

INTERSECT

SELECT DISTINCT B.id, B.nome, B.preco
    FROM Bundle AS B, BcontemP AS BcP, Produto AS P, Consola AS C
    WHERE BcP.idB = B.id AND BcP.skuP = P.sku AND P.sku = C.sku
    ORDER BY B.preco DESC;

```

### 3.
#### Mostra as 3 primeiras Consolas com maior número de Acessorios Compatíveis e, no caso de empate, ordenadas pelo valor descendente de preço.

```sql

SELECT sku, nome, precoBase, nrAcomp 
    FROM Produto JOIN
        (SELECT skuC, count(*) AS nrAcomp FROM AcompativelComC GROUP BY skuC) 
        ON sku = skuC 
    ORDER BY nrAcomp DESC, precoBase DESC
    LIMIT 3;

```

>--------

###### Médias

### 4.
####  Soma dos pontos ganhos por cada cliente em Conquistas do tipo NivelPontos e NumeroCompras.

```sql

SELECT username, sum(Conquista.pontos) AS NvPontosNmCompras, Cliente.pontos AS TotalCliente
    FROM Conquistou NATURAL JOIN 
        (SELECT id AS idConquista, pontos 
            FROM Conquista 
            WHERE id IN 
                (SELECT id FROM NivelPontos 
                UNION 
                SELECT id FROM NumeroCompras)
        ) Conquista JOIN Cliente ON idCliente = id
    GROUP BY idCliente;

```

### 5.
#### Número de Conquistas por Localização.

```sql

SELECT nome, nr_conquistas 
    FROM Localizacao AS L LEFT JOIN 
        (SELECT localizacao , count(localizacao) AS nr_conquistas 
        FROM Cliente NATURAL JOIN 
            (SELECT idCliente AS id FROM Conquistou) 
        GROUP BY localizacao) C
    ON C.localizacao = L.id
    ORDER BY nr_conquistas DESC;

```

### 6.
#### Compras com um Desconto Sazonal ou PorPontos onde foi adquirido pelo menos um produto com desconto Especial.

```sql

SELECT id AS idCompra, valor, idSazonal, idPorPontos
    FROM Compra
    WHERE EXISTS 
        (SELECT * FROM CompraDoProduto 
        WHERE idProduto IN 
            (SELECT sku FROM Produto 
            WHERE idDesconto IS NOT NULL) 
        AND idCompra = id) 
    AND (idSazonal IS NOT NULL OR idPorPontos IS NOT NULL);

```

>--------

###### Difíceis

### 7.
#### Pares de Clientes que fizeram exatamente a mesma avaliação ao mesmo Videojogo.

```sql

SELECT C1.username, C2.username, valor, P.nome AS Videojogo
    FROM Produto P, 
        Cliente C1, 
        Cliente C2, 
        (SELECT A1.idCliente AS id1, A2.idCliente AS id2, A1.valor AS valor, A1.skuV AS skuV
            FROM Avaliacao A1, Avaliacao A2
            WHERE id1 < id2 AND A1.valor = A2.valor AND A1.skuV=A2.skuV)
    WHERE P.sku = skuV AND C1.id = id1 AND C2.id = id2;

```

### 8.
#### Produtos mais comprados, incluindo em Bundles.

```sql

SELECT nome, vezesComprado
        FROM Produto NATURAL JOIN 
                (SELECT skuP AS sku, quantidade * b_qtd AS vezesComprado
                        FROM BcontemP JOIN
                                (SELECT idBundle, count(idBundle) * quantidade AS b_qtd
                                        FROM CompraDoBundle
                                        GROUP BY idBundle)
                        ON idB = idBundle
                UNION
                SELECT idProduto AS sku, count(idProduto) * quantidade AS vezesComprado
                    FROM CompraDoProduto
                    GROUP BY idProduto) 
        ORDER BY vezesComprado DESC;

```

### 9.
#### Compras em que foram adquiridos apenas Bundles ou todos os Produtos comprados tinham Desconto.

```sql

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

```

### 10.
#### Pares de Produtos/Bundles mais vezes comprados juntos.

```sql

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

```