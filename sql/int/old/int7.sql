.mode columns
.headers on
.nullvalue NULL

SELECT Estatuto.titulo, max(Cliente.pontos) AS maxPoints, Cliente.username
    FROM Cliente JOIN Estatuto
    ON Cliente.estatuto = Estatuto.id
    GROUP BY Cliente.estatuto;

-- Cliente com o máximo de pontos em cada Estatuto