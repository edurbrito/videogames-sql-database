.mode columns
.headers on
.nullvalue NULL

SELECT id, username, email, reviews
FROM Cliente JOIN (
    SELECT idCliente, count(*) AS reviews 
    FROM Avaliacao 
    GROUP BY idCliente 
    HAVING reviews >= 2) Reviews 
ON Cliente.id = Reviews.idCliente;

-- Informação e número de avaliações feitas por Clientes com pelo menos duas avaliações
