.mode columns
.headers on
.nullvalue 0

SELECT nome, nr_conquistas 
    FROM Localizacao AS L LEFT JOIN 
        (SELECT localizacao , count(localizacao) AS nr_conquistas 
        FROM Cliente NATURAL JOIN 
            (SELECT idCliente AS id FROM Conquistou) 
        GROUP BY localizacao) C
    ON C.localizacao = L.id
    ORDER BY nr_conquistas DESC;

-- Número de Conquistas por Localização.