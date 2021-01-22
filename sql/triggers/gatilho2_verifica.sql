.mode columns
.header on
.nullvalue NULL

PRAGMA foreign_keys = ON;

.print ''
.print 'Tabelas "Produto" e "CompraDoProduto" inicial:'
.print ''

SELECT sku, stock FROM Produto WHERE sku = 19;

.print ''

SELECT * FROM CompraDoProduto;

.print ''
.print '-- Um Cliente comprou 2 unidades do Produto com sku 19 --'
.print 'A compra é registada e o stock do Produto é atualizado:'
.print ''

INSERT INTO Compra(id, idCliente, valor, dataHora, pontos, idSazonal, idPorPontos)
VALUES (6,1,149.97,"2020-04-18 18:13:19",149,NULL,NULL);

INSERT INTO CompraDoProduto VALUES (6,19,2);

SELECT sku, stock FROM Produto WHERE sku = 19;

.print ''

SELECT * FROM CompraDoProduto;

.print ''
.print '#############################################'
.print ''
.print 'Tabelas "Produto" e "CompraDoBundle" inicial:'
.print ''

SELECT Produto.sku, Produto.stock FROM Produto JOIN BcontemP ON Produto.sku = BcontemP.skuP WHERE BcontemP.idB = 7;

.print ''

SELECT * FROM CompraDoBundle;

.print ''
.print '-- Um Cliente comprou 2 unidades do Bundle com id 7 --'
.print 'A compra é registada e o stock dos Produtos envolvidos é atualizado:'
.print ''

INSERT INTO Compra(id, idCliente, valor, dataHora, pontos, idSazonal, idPorPontos)
VALUES (7,1,797.92,"2020-04-19 18:13:19",797,NULL,NULL);

INSERT INTO CompraDoBundle VALUES (7,7,2);

SELECT Produto.sku, Produto.stock FROM Produto JOIN BcontemP ON Produto.sku = BcontemP.skuP WHERE BcontemP.idB = 7;

.print ''

SELECT * FROM CompraDoBundle;