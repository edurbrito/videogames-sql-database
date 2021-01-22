.mode columns
.headers on
.nullvalue NULL

SELECT username, pontos, localizacao
FROM Cliente

EXCEPT

SELECT username, pontos, localizacao
FROM Cliente
WHERE id NOT IN (SELECT idcliente FROM Compra)
ORDER BY pontos ASC;

-- Mostra o username, pontos e localizacao dos clientes que realizaram pelo menos uma compra, por ordem crescente de pontos