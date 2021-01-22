.mode columns
.headers on
.nullvalue NULL

SELECT Cl.id, Cl.nome, C.id, C.valor
FROM Compra as C, Cliente as Cl
WHERE (SELECT id FROM Cliente C1 WHERE NOT EXISTS (SELECT * from Cliente C2 WHERE C2.pontos > C1.pontos)) AND C.idcliente = Cl.id;

--Suposto apresentar as compras que o cliente com mais pontos fez, mas está a apresentar as compras que cada cliente fez

SELECT id, valor, dataHora, username FROM Compra NATURAL JOIN (SELECT id AS idCliente, username, max(pontos) FROM Cliente) ORDER BY id;