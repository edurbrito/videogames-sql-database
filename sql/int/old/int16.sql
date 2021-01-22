.mode columns
.headers on
.nullvalue NULL

SELECT username, P.nome AS Avaliou, rating 
    FROM Cliente LEFT JOIN 
        (SELECT A.idCliente, A.skuV, A.valor AS rating, P.nome 
            FROM Avaliacao AS A JOIN Produto AS P 
            ON A.skuV = P.sku) P 
    ON idCliente = Cliente.id;

-- Clientes e avaliações que tenham feito ou não