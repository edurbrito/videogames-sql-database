.mode columns
.headers on
.nullvalue NULL

SELECT idCliente, username, avg(valor)
from Compra 
NATURAL JOIN 
(Select id AS idCliente, username
From Cliente)
GROUP By username

-- Média das compras realizadas por cada cliente