.mode columns
.headers on
.nullvalue NULL

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

-- A soma dos pontos ganhos por cada cliente em Conquistas do tipo NivelPontos e NumeroCompras.