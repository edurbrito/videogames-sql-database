.mode columns
.headers on
.nullvalue NULL

SELECT idCliente, sum(pontos) AS PontosGanhos
    FROM Conquistou NATURAL JOIN 
        ( SELECT id AS idConquista, pontos 
            FROM Conquista 
            WHERE id IN 
                (SELECT id FROM NivelPontos 
                UNION 
                SELECT id FROM NumeroCompras)
        ) Conquista
GROUP BY idCliente;

-- Total de pontos ganho por cada cliente em Conquistas do tipo NivelPontos e NumeroCompras