.mode columns
.header on
.nullvalue NULL

PRAGMA foreign_keys = ON;

.print ''
.print 'Tabela "Avaliacao" e "Videojogo" inicial:'
.print ''

SELECT * FROM Avaliacao;

.print ''

SELECT sku, rating FROM Videojogo
WHERE sku = 14 OR sku = 17;

.print ''
.print 'Feitas (mais) algumas Avaliações ao Videojogo com sku 14: '
.print ''

INSERT INTO Avaliacao(idCliente,skuV,valor) VALUES (2,14,5);
INSERT INTO Avaliacao(idCliente,skuV,valor) VALUES (1,14,5);

SELECT * FROM Avaliacao;

.print ''
.print 'Verifica-se que o seu rating, depois das operações de inserção,'
.print 'terá o valor (5+5+4)/3 = 5'
.print ''

SELECT sku, rating FROM Videojogo
WHERE sku = 14;

.print ''
.print 'Feita uma (a primeira) Avaliação ao Videojogo com sku 17: '
.print ''

INSERT INTO Avaliacao(idCliente,skuV,valor) VALUES (2,17,3);

SELECT * FROM Avaliacao;

.print ''
.print 'Verifica-se que o seu rating, depois das operações de inserção,'
.print 'terá o valor 3'
.print ''

SELECT sku, rating FROM Videojogo
WHERE sku = 17;

.print ''
.print 'Se as Avaliações inseridas anteriormente forem agora apagadas: '
.print ''
.print 'Removendo a Avaliação do Cliente 2 no Videojogo 14'
.print 'E a Avaliação do Cliente 1 ao mesmo videojogo,'
.print 'Ficará com rating (4)/1 = 4'
.print 'Removendo a Avaliação do Cliente 2 no Videojogo 17'
.print 'Ficará com rating NULL'
.print ''

DELETE FROM Avaliacao WHERE idCliente = 2 AND skuV = 14;
DELETE FROM Avaliacao WHERE idCliente = 1 AND skuV = 14;
DELETE FROM Avaliacao WHERE idCliente = 2 AND skuV = 17;

SELECT * FROM Avaliacao;

.print ''

SELECT sku, rating FROM Videojogo
WHERE sku = 14 OR sku = 17;

.print ''
.print 'Se Avaliações inseridas anteriormente forem agora alteradas: '
.print ''
.print 'Alterando a Avaliação do Cliente 2 no Videojogo 28 para valor 1,'
.print 'Ficará com rating (1+3)/2 = 2'
.print 'Alterando a Avaliação do Cliente 3 no Videojogo 22 para valor 2'
.print 'Ficará com rating (2)/1 = 2'
.print ''

UPDATE Avaliacao SET valor = 1 WHERE idCliente = 2 AND skuV = 28;
UPDATE Avaliacao SET valor = 2 WHERE idCliente = 3 AND skuV = 22;

SELECT * FROM Avaliacao;

.print ''

SELECT sku, rating FROM Videojogo
WHERE sku = 28 OR sku = 22;