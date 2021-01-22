PRAGMA FOREIGN_KEYS = ON;

-- Marca

INSERT INTO Marca(id,nome) VALUES (1,'Nintendo');
INSERT INTO Marca(id,nome) VALUES (2,'Valve Corporation');
INSERT INTO Marca(id,nome) VALUES (3,'Rockstar Games');
INSERT INTO Marca(id,nome) VALUES (4,'Electronic Arts');
INSERT INTO Marca(id,nome) VALUES (5,'Activision Blizzard');
INSERT INTO Marca(id,nome) VALUES (6,'Sony Computer Entertainment');
INSERT INTO Marca(id,nome) VALUES (7,'Ubisoft');
INSERT INTO Marca(id,nome) VALUES (8,'Sega Games Co. Ltd');
INSERT INTO Marca(id,nome) VALUES (9,'Microsoft');
INSERT INTO Marca(id,nome) VALUES (10,'Naughty Dog Inc');

-- DescontoEspecial

INSERT INTO DescontoEspecial(id,percentagem,descricao,dataInicio,dataFim) VALUES (1,0.5,'Especial Corona','2020-03-13','2020-05-31');
INSERT INTO DescontoEspecial(id,percentagem,descricao,dataInicio,dataFim) VALUES (2,0.3,'Ofertas Surpresa','2020-04-06','2020-04-13');
INSERT INTO DescontoEspecial(id,percentagem,descricao,dataInicio,dataFim) VALUES (3,0.1,'Desconto Playstation','2020-05-01','2020-05-08');
INSERT INTO DescontoEspecial(id,percentagem,descricao,dataInicio,dataFim) VALUES (4,0.15,'Temporada ESports','2020-04-16','2020-04-23');

-- DescontoSazonal

INSERT INTO DescontoSazonal(id,percentagem,descricao,dataInicio,dataFim) VALUES (1,0.1,'Promocao Primavera','2020-04-01','2020-04-03');
INSERT INTO DescontoSazonal(id,percentagem,descricao,dataInicio,dataFim) VALUES (2,0.15,'Semana da Pascoa','2020-04-06','2020-04-13');
INSERT INTO DescontoSazonal(id,percentagem,descricao,dataInicio,dataFim) VALUES (3,0.1,'Black Week','2020-04-23','2020-04-30');

-- DescontoPorPontos

INSERT INTO DescontoPorPontos(id,percentagem,descricao,pontosMinimo,pontosMaximo) VALUES (1,0.2,'Desconto Platinum',5000,9223372036854775806);
INSERT INTO DescontoPorPontos(id,percentagem,descricao,pontosMinimo,pontosMaximo) VALUES (2,0.15,'Desconto Premium',1000,4999);
INSERT INTO DescontoPorPontos(id,percentagem,descricao,pontosMinimo,pontosMaximo) VALUES (3,0.12,'Desconto Experienced',300,999);
INSERT INTO DescontoPorPontos(id,percentagem,descricao,pontosMinimo,pontosMaximo) VALUES (4,0.09,'Desconto Amateur',100,299);
INSERT INTO DescontoPorPontos(id,percentagem,descricao,pontosMinimo,pontosMaximo) VALUES (5,0.05,'Desconto Newbie',0,99);

-- Produto

INSERT INTO Produto(sku,nome,precoBase,stock,marca) VALUES (1,'Cabo USB',7.99,10,6);
INSERT INTO Produto(sku,nome,precoBase,stock,marca) VALUES (2,'Comando PS4',59.90,10,6);
INSERT INTO Produto(sku,nome,precoBase,stock,marca) VALUES (3,'Capa Nintendo Super Mario',19.90,7,1);
INSERT INTO Produto(sku,nome,precoBase,stock,marca) VALUES (4,'Oculos VR',83.90,3,2);
INSERT INTO Produto(sku,nome,precoBase,stock,marca) VALUES (5,'Volante NeedForSpeed',78.90,4,4);

INSERT INTO Produto(sku,nome,precoBase,stock,marca) VALUES (6,'Nintendo Switch',267.29,5,1);
INSERT INTO Produto(sku,nome,precoBase,stock,marca) VALUES (7,'Nintendo Switch Light',178.19,6,1);
INSERT INTO Produto(sku,nome,precoBase,stock,marca) VALUES (8,'Playstation 4 Slim',242.99,3,6);
INSERT INTO Produto(sku,nome,precoBase,stock,marca) VALUES (9,'Playstation 4 Pro',403.29,5,6);
INSERT INTO Produto(sku,nome,precoBase,stock,marca) VALUES (10,'XBox One',403.29,5,9);

INSERT INTO Produto(sku,nome,precoBase,stock,marca) VALUES (11,'Super Mario Bros U Deluxe',60.94,5,1);
INSERT INTO Produto(sku,nome,precoBase,stock,marca) VALUES (12,'Pokemon Mistery Dungeon',59.99,4,1);
INSERT INTO Produto(sku,nome,precoBase,stock,marca) VALUES (13,'The Legend of Zelda: Breath of the Wild',64.99,4,1);
INSERT INTO Produto(sku,nome,precoBase,stock,marca, idDesconto) VALUES (14,'FIFA 20',39.99,7,4,4);
INSERT INTO Produto(sku,nome,precoBase,stock,marca) VALUES (15,'GTA San Andreas',29.99,2,3);
INSERT INTO Produto(sku,nome,precoBase,stock,marca, idDesconto) VALUES (16,'Luigis Mansion 3',59.99,5,1,2);
INSERT INTO Produto(sku,nome,precoBase,stock,marca) VALUES (17,'Assassins Creed: The Rebel Collection',42.99,2,7);
INSERT INTO Produto(sku,nome,precoBase,stock,marca) VALUES (18,'Sonic Mania Plus',29.99,1,8);
INSERT INTO Produto(sku,nome,precoBase,stock,marca) VALUES (19,'Call of Duty: Modern Warfare',49.99,3,5);
INSERT INTO Produto(sku,nome,precoBase,stock,marca, idDesconto) VALUES (20,'Uncharted 4: A Thiefs End',14.99,3,10,3);
INSERT INTO Produto(sku,nome,precoBase,stock,marca, idDesconto) VALUES (21,'Minecraft',29.99,12,9,1);
INSERT INTO Produto(sku,nome,precoBase,stock,marca) VALUES (22,'Far Cry 5',17.99,4,7);
INSERT INTO Produto(sku,nome,precoBase,stock,marca) VALUES (23,'Need For Speed Heat',44.99,5,4);
INSERT INTO Produto(sku,nome,precoBase,stock,marca, idDesconto) VALUES (24,'Forza Horizon 4',19.99,2,9,4);
INSERT INTO Produto(sku,nome,precoBase,stock,marca) VALUES (25,'The Sims 4',49.99,6,4);
INSERT INTO Produto(sku,nome,precoBase,stock,marca) VALUES (26,'GTA 5',19.99,3,2);
INSERT INTO Produto(sku,nome,precoBase,stock,marca) VALUES (27,'Red Dead Redemption 2',59.99,8,3);
INSERT INTO Produto(sku,nome,precoBase,stock,marca, idDesconto) VALUES (28,'The Last of Us',15.40,2,10,3);
INSERT INTO Produto(sku,nome,precoBase,stock,marca) VALUES (29,'Call of Duty: Ghosts',19.99,2,5);
INSERT INTO Produto(sku,nome,precoBase,stock,marca) VALUES (30,'Football Manager 2020',49.49,5,8);

INSERT INTO Produto(sku,nome,precoBase,stock,marca) VALUES (31,'Figura Steve Minecraft',9.99,4,9);
INSERT INTO Produto(sku,nome,precoBase,stock,marca) VALUES (32,'Mapa Los Santos GTA 5', 4.90,2,3);
INSERT INTO Produto(sku,nome,precoBase,stock,marca) VALUES (33,'Lamina Assassins Creed',25.90,5,7);
INSERT INTO Produto(sku,nome,precoBase,stock,marca) VALUES (34,'Super Mario Cogumelo',13.90,2,1);

-- Acessorio

INSERT INTO Acessorio(sku, cor, conexao, tamanho, versao) VALUES (1,NULL,'USB Tipo C', '3m',NULL);
INSERT INTO Acessorio(sku, cor, conexao, tamanho, versao) VALUES (2,'Azul','USB Tipo B',NULL,'DualShock 4 Black V2');
INSERT INTO Acessorio(sku, cor, conexao, tamanho, versao) VALUES (3,NULL,NULL,'Switch V2','Aniversario Nintendo');
INSERT INTO Acessorio(sku, cor, conexao, tamanho, versao) VALUES (4,'Branco','USB Tipo C',NULL,'V7');
INSERT INTO Acessorio(sku, cor, conexao, tamanho, versao) VALUES (5,'Preto','USB Tipo B',NULL,'G27-V2');

-- Consola

INSERT INTO Consola(sku, cor, cpu, grafica, armazenamento, versao) VALUES (6,'Azul e Vermelho Neon','Quadcore 1.02 GHz','Nvidia Tegra X1','32GB','Switch V2');
INSERT INTO Consola(sku, cor, cpu, grafica, armazenamento, versao) VALUES (7,'Cinza','Dualcore 1.02 GHz','Nvidia Slim','16GB','Light V3');
INSERT INTO Consola(sku, cor, cpu, grafica, armazenamento, versao) VALUES (8,'Preto','Octacore 1.60 GHz','AMD GCN Radeon','250GB','Slim 2019');
INSERT INTO Consola(sku, cor, cpu, grafica, armazenamento, versao) VALUES (9,'Preto','Dual Quadcore 2.13 GHz','AMD GCN++ Radeon V3','1TB','Pro X1');
INSERT INTO Consola(sku, cor, cpu, grafica, armazenamento, versao) VALUES (10,'Branco','Octacore 1.55 GHz','Nvidia Geforce','500GB','One V2020');

-- Videojogo

INSERT INTO Videojogo(sku, idadeMinima, rating, dataLancamento) VALUES (11,3, NULL,'2019-01-10');
INSERT INTO Videojogo(sku, idadeMinima, rating, dataLancamento) VALUES (12,7, NULL,'2020-03-06');
INSERT INTO Videojogo(sku, idadeMinima, rating, dataLancamento) VALUES (13,3, NULL,'2017-03-03');
INSERT INTO Videojogo(sku, idadeMinima, rating, dataLancamento) VALUES (14,3, 4,'2019-09-24');
INSERT INTO Videojogo(sku, idadeMinima, rating, dataLancamento) VALUES (15,18,NULL,'2015-09-15');
INSERT INTO Videojogo(sku, idadeMinima, rating, dataLancamento) VALUES (16,3, NULL,'2019-10-31');
INSERT INTO Videojogo(sku, idadeMinima, rating, dataLancamento) VALUES (17,18,NULL,'2019-12-06');
INSERT INTO Videojogo(sku, idadeMinima, rating, dataLancamento) VALUES (18,3, NULL,'2018-07-17');
INSERT INTO Videojogo(sku, idadeMinima, rating, dataLancamento) VALUES (19,18,NULL,'2019-10-25');
INSERT INTO Videojogo(sku, idadeMinima, rating, dataLancamento) VALUES (20,14,NULL,'2016-05-10');
INSERT INTO Videojogo(sku, idadeMinima, rating, dataLancamento) VALUES (21,3, NULL,'2009-05-17');
INSERT INTO Videojogo(sku, idadeMinima, rating, dataLancamento) VALUES (22,18,5,'2018-03-27');
INSERT INTO Videojogo(sku, idadeMinima, rating, dataLancamento) VALUES (23,3, NULL,'2019-11-08');
INSERT INTO Videojogo(sku, idadeMinima, rating, dataLancamento) VALUES (24,3, NULL,'2018-09-28');
INSERT INTO Videojogo(sku, idadeMinima, rating, dataLancamento) VALUES (25,3, 5,'2014-09-02');
INSERT INTO Videojogo(sku, idadeMinima, rating, dataLancamento) VALUES (26,18,NULL,'2013-09-17');
INSERT INTO Videojogo(sku, idadeMinima, rating, dataLancamento) VALUES (27,16,NULL,'2018-10-26');
INSERT INTO Videojogo(sku, idadeMinima, rating, dataLancamento) VALUES (28,16,3,'2013-06-14');
INSERT INTO Videojogo(sku, idadeMinima, rating, dataLancamento) VALUES (29,14,NULL,'2013-11-05');
INSERT INTO Videojogo(sku, idadeMinima, rating, dataLancamento) VALUES (30,3, NULL,'2019-10-31');

-- Merchandising

INSERT INTO Merchandising(sku,variante) VALUES (31,'12cm');
INSERT INTO Merchandising(sku,variante) VALUES (32,'24x30cm');
INSERT INTO Merchandising(sku,variante) VALUES (33,'Material PVC');
INSERT INTO Merchandising(sku,variante) VALUES (34,'15cm');

-- AcompativelComC

INSERT INTO AcompativelComC(skuA,skuC) VALUES (1,6);
INSERT INTO AcompativelComC(skuA,skuC) VALUES (1,7);
INSERT INTO AcompativelComC(skuA,skuC) VALUES (1,8);
INSERT INTO AcompativelComC(skuA,skuC) VALUES (1,9);
INSERT INTO AcompativelComC(skuA,skuC) VALUES (1,10);
INSERT INTO AcompativelComC(skuA,skuC) VALUES (2,8);
INSERT INTO AcompativelComC(skuA,skuC) VALUES (2,9);
INSERT INTO AcompativelComC(skuA,skuC) VALUES (3,6);
INSERT INTO AcompativelComC(skuA,skuC) VALUES (3,7);
INSERT INTO AcompativelComC(skuA,skuC) VALUES (4,8);
INSERT INTO AcompativelComC(skuA,skuC) VALUES (4,9);
INSERT INTO AcompativelComC(skuA,skuC) VALUES (5,8);
INSERT INTO AcompativelComC(skuA,skuC) VALUES (5,9);
INSERT INTO AcompativelComC(skuA,skuC) VALUES (5,10);

-- VcompativelComC

INSERT INTO VcompativelComC(skuV,skuC) VALUES (11,6);
INSERT INTO VcompativelComC(skuV,skuC) VALUES (11,7);
INSERT INTO VcompativelComC(skuV,skuC) VALUES (12,6);
INSERT INTO VcompativelComC(skuV,skuC) VALUES (12,7);
INSERT INTO VcompativelComC(skuV,skuC) VALUES (13,8);
INSERT INTO VcompativelComC(skuV,skuC) VALUES (13,9);
INSERT INTO VcompativelComC(skuV,skuC) VALUES (14,8);
INSERT INTO VcompativelComC(skuV,skuC) VALUES (14,9);
INSERT INTO VcompativelComC(skuV,skuC) VALUES (14,10);
INSERT INTO VcompativelComC(skuV,skuC) VALUES (15,8);
INSERT INTO VcompativelComC(skuV,skuC) VALUES (15,9);
INSERT INTO VcompativelComC(skuV,skuC) VALUES (16,6);
INSERT INTO VcompativelComC(skuV,skuC) VALUES (16,7);
INSERT INTO VcompativelComC(skuV,skuC) VALUES (17,8);
INSERT INTO VcompativelComC(skuV,skuC) VALUES (17,9);
INSERT INTO VcompativelComC(skuV,skuC) VALUES (17,10);
INSERT INTO VcompativelComC(skuV,skuC) VALUES (18,6);
INSERT INTO VcompativelComC(skuV,skuC) VALUES (18,7);
INSERT INTO VcompativelComC(skuV,skuC) VALUES (18,8);
INSERT INTO VcompativelComC(skuV,skuC) VALUES (18,9);
INSERT INTO VcompativelComC(skuV,skuC) VALUES (18,10);
INSERT INTO VcompativelComC(skuV,skuC) VALUES (19,8);
INSERT INTO VcompativelComC(skuV,skuC) VALUES (19,9);
INSERT INTO VcompativelComC(skuV,skuC) VALUES (19,10);
INSERT INTO VcompativelComC(skuV,skuC) VALUES (20,8);
INSERT INTO VcompativelComC(skuV,skuC) VALUES (20,9);
INSERT INTO VcompativelComC(skuV,skuC) VALUES (21,6);
INSERT INTO VcompativelComC(skuV,skuC) VALUES (21,7);
INSERT INTO VcompativelComC(skuV,skuC) VALUES (21,8);
INSERT INTO VcompativelComC(skuV,skuC) VALUES (21,9);
INSERT INTO VcompativelComC(skuV,skuC) VALUES (21,10);
INSERT INTO VcompativelComC(skuV,skuC) VALUES (22,8);
INSERT INTO VcompativelComC(skuV,skuC) VALUES (22,9);
INSERT INTO VcompativelComC(skuV,skuC) VALUES (22,10);
INSERT INTO VcompativelComC(skuV,skuC) VALUES (23,8);
INSERT INTO VcompativelComC(skuV,skuC) VALUES (23,9);
INSERT INTO VcompativelComC(skuV,skuC) VALUES (23,10);
INSERT INTO VcompativelComC(skuV,skuC) VALUES (24,10);
INSERT INTO VcompativelComC(skuV,skuC) VALUES (25,8);
INSERT INTO VcompativelComC(skuV,skuC) VALUES (25,9);
INSERT INTO VcompativelComC(skuV,skuC) VALUES (25,10);
INSERT INTO VcompativelComC(skuV,skuC) VALUES (26,8);
INSERT INTO VcompativelComC(skuV,skuC) VALUES (26,9);
INSERT INTO VcompativelComC(skuV,skuC) VALUES (26,10);
INSERT INTO VcompativelComC(skuV,skuC) VALUES (27,8);
INSERT INTO VcompativelComC(skuV,skuC) VALUES (27,9);
INSERT INTO VcompativelComC(skuV,skuC) VALUES (27,10);
INSERT INTO VcompativelComC(skuV,skuC) VALUES (28,8);
INSERT INTO VcompativelComC(skuV,skuC) VALUES (28,9);
INSERT INTO VcompativelComC(skuV,skuC) VALUES (29,8);
INSERT INTO VcompativelComC(skuV,skuC) VALUES (29,9);
INSERT INTO VcompativelComC(skuV,skuC) VALUES (29,10);
INSERT INTO VcompativelComC(skuV,skuC) VALUES (30,6);
INSERT INTO VcompativelComC(skuV,skuC) VALUES (30,7);

-- Bundle

INSERT INTO Bundle(id,nome,preco,descricao) VALUES (1,'Pack Switch Bros',295.41,'Nintendo Switch + Super Mario Bros U Deluxe');
INSERT INTO Bundle(id,nome,preco,descricao) VALUES (2,'Pack Switch Bros Light',215.22,'Nintendo Switch Light + Super Mario Bros U Deluxe');
INSERT INTO Bundle(id,nome,preco,descricao) VALUES (3,'Pack FIFA PS4',362.97,'PS4 Pro + FIFA 20');
INSERT INTO Bundle(id,nome,preco,descricao) VALUES (4,'Pack GTA PS4',236.69,'Pack PS4 Slim + GTA V');
INSERT INTO Bundle(id,nome,preco,descricao) VALUES (5,'Pack CoD PS4',263.69,'Pack PS4 Slim + Call of Duty: Modern Warface');
INSERT INTO Bundle(id,nome,preco,descricao) VALUES (6,'Pack Cod PS4 Pro',407.96,'Pack PS4 Pro + Call of Duty: Modern Warface');
INSERT INTO Bundle(id,nome,preco,descricao) VALUES (7,'Pack FIFA XBox',398.96,'Pack XBox One + FIFA 20');
INSERT INTO Bundle(id,nome,preco,descricao) VALUES (8,'Pack Comando PS4',272.61,'Pack PS4 Slim + Comando');
INSERT INTO Bundle(id,nome,preco,descricao) VALUES (9,'Pack Comando PS4 Pro',416.96,'Pack PS4 Pro + Comando');
INSERT INTO Bundle(id,nome,preco,descricao) VALUES (10,'Pack Switch Capa',258.48,'Pack Nintendo Switch + Capa Nintendo Super Mario');

-- BcontemP

INSERT INTO BcontemP(idB,skuP,quantidade) VALUES (1,6,1);
INSERT INTO BcontemP(idB,skuP,quantidade) VALUES (1,11,1);
INSERT INTO BcontemP(idB,skuP,quantidade) VALUES (2,7,1);
INSERT INTO BcontemP(idB,skuP,quantidade) VALUES (2,11,1);
INSERT INTO BcontemP(idB,skuP,quantidade) VALUES (3,9,1);
INSERT INTO BcontemP(idB,skuP,quantidade) VALUES (3,14,1);
INSERT INTO BcontemP(idB,skuP,quantidade) VALUES (4,8,1);
INSERT INTO BcontemP(idB,skuP,quantidade) VALUES (4,26,1);
INSERT INTO BcontemP(idB,skuP,quantidade) VALUES (5,8,1);
INSERT INTO BcontemP(idB,skuP,quantidade) VALUES (5,19,1);
INSERT INTO BcontemP(idB,skuP,quantidade) VALUES (6,9,1);
INSERT INTO BcontemP(idB,skuP,quantidade) VALUES (6,19,1);
INSERT INTO BcontemP(idB,skuP,quantidade) VALUES (7,10,1);
INSERT INTO BcontemP(idB,skuP,quantidade) VALUES (7,14,1);
INSERT INTO BcontemP(idB,skuP,quantidade) VALUES (8,8,1);
INSERT INTO BcontemP(idB,skuP,quantidade) VALUES (8,2,2);
INSERT INTO BcontemP(idB,skuP,quantidade) VALUES (9,9,1);
INSERT INTO BcontemP(idB,skuP,quantidade) VALUES (9,2,2);
INSERT INTO BcontemP(idB,skuP,quantidade) VALUES (10,6,1);
INSERT INTO BcontemP(idB,skuP,quantidade) VALUES (10,3,1);

-- Localizacao

INSERT INTO Localizacao(id,nome) VALUES (1,'PT');
INSERT INTO Localizacao(id,nome) VALUES (2,'ES');
INSERT INTO Localizacao(id,nome) VALUES (3,'IT');
INSERT INTO Localizacao(id,nome) VALUES (4,'FR');
INSERT INTO Localizacao(id,nome) VALUES (5,'UK');
INSERT INTO Localizacao(id,nome) VALUES (6,'DE');
INSERT INTO Localizacao(id,nome) VALUES (7,'NL');
INSERT INTO Localizacao(id,nome) VALUES (8,'BE');
INSERT INTO Localizacao(id,nome) VALUES (9,'AT');
INSERT INTO Localizacao(id,nome) VALUES (10,'RU');

-- Estatuto

INSERT INTO Estatuto(id,titulo,pontosMinimo,pontosMaximo) VALUES (1,'Newbie',0,99);
INSERT INTO Estatuto(id,titulo,pontosMinimo,pontosMaximo) VALUES (2,'Amateur',100,299);
INSERT INTO Estatuto(id,titulo,pontosMinimo,pontosMaximo) VALUES (3,'Experienced',300,999);
INSERT INTO Estatuto(id,titulo,pontosMinimo,pontosMaximo) VALUES (4,'Premium',1000,4999);
INSERT INTO Estatuto(id,titulo,pontosMinimo,pontosMaximo) VALUES (5,'Platinum',5000,9223372036854775806);

-- Cliente

INSERT INTO Cliente(id, username, nome, email, dataNascimento, morada, codigoPostal, dataCriacaoConta, pontos, localizacao, estatuto) 
VALUES (1,"pdff","Pedro Ferreira","up201806506@fe.up.pt","2000-06-19","Rua Tal, no 607, Bairro","101-23","2019-01-01",1768,6,4);

INSERT INTO Cliente(id, username, nome, email, dataNascimento, morada, codigoPostal, dataCriacaoConta, pontos, localizacao, estatuto) 
VALUES (2,"pedrovponte","Pedro Ponte","up201809694@fe.up.pt","2000-01-07","Rua do Largo, no 14, La","3090-117","2020-02-01",365,2,3);

INSERT INTO Cliente(id, username, nome, email, dataNascimento, morada, codigoPostal, dataCriacaoConta, pontos, localizacao, estatuto) 
VALUES (3,"edurbrito","Eduardo Brito","up201806271@fe.up.pt","2000-04-23","Rua da Esquina, no 3, Coiso","4020-202","2020-03-20",81,1,1);

-- Avaliacao

INSERT INTO Avaliacao(idCliente,skuV,valor) VALUES (3,14,4);
INSERT INTO Avaliacao(idCliente,skuV,valor) VALUES (3,22,5);
INSERT INTO Avaliacao(idCliente,skuV,valor) VALUES (2,28,3);
INSERT INTO Avaliacao(idCliente,skuV,valor) VALUES (2,25,5);
INSERT INTO Avaliacao(idCliente,skuV,valor) VALUES (1,28,3);

-- Conquista

INSERT INTO Conquista(id,pontos,descricao) VALUES (1,20,'A sua primeira Compra');
INSERT INTO Conquista(id,pontos,descricao) VALUES (2,50,'Realizou 5 Compras');
INSERT INTO Conquista(id,pontos,descricao) VALUES (3,100,'Realizou 10 Compras');
INSERT INTO Conquista(id,pontos,descricao) VALUES (4,200,'Realizou 20 Compras');
INSERT INTO Conquista(id,pontos,descricao) VALUES (5,200,'Realizou 50 Compras');

INSERT INTO Conquista(id,pontos,descricao) VALUES (6,25,'Atingiu estatuto Amateur');
INSERT INTO Conquista(id,pontos,descricao) VALUES (7,30,'Atingiu estatuto Experienced');
INSERT INTO Conquista(id,pontos,descricao) VALUES (8,100,'Atingiu estatuto Premium');
INSERT INTO Conquista(id,pontos,descricao) VALUES (9,500,'Atingiu estatuto Platinum');

INSERT INTO Conquista(id,pontos,descricao) VALUES (10,25,'Cliente ha 100 dias');
INSERT INTO Conquista(id,pontos,descricao) VALUES (11,50,'Cliente ha 200 dias');
INSERT INTO Conquista(id,pontos,descricao) VALUES (12,200,'Cliente ha 1 ano');
INSERT INTO Conquista(id,pontos,descricao) VALUES (13,400,'Cliente ha 2 anos');

INSERT INTO Conquista(id,pontos,descricao) VALUES (14,10,'Criou a sua Conta');
INSERT INTO Conquista(id,pontos,descricao) VALUES (15,30,'Comprou um produto de cada tipo');
INSERT INTO Conquista(id,pontos,descricao) VALUES (17,15,'Comprou um Jogo no dia de lancamento');

-- NumeroCompras

INSERT INTO NumeroCompras(id,comprasMinimo) VALUES (1,1);
INSERT INTO NumeroCompras(id,comprasMinimo) VALUES (2,5);
INSERT INTO NumeroCompras(id,comprasMinimo) VALUES (3,10);
INSERT INTO NumeroCompras(id,comprasMinimo) VALUES (4,20);
INSERT INTO NumeroCompras(id,comprasMinimo) VALUES (5,50);

-- NivelPontos

INSERT INTO NivelPontos(id,pontosMinimo) VALUES (6,100);
INSERT INTO NivelPontos(id,pontosMinimo) VALUES (7,300);
INSERT INTO NivelPontos(id,pontosMinimo) VALUES (8,1000);
INSERT INTO NivelPontos(id,pontosMinimo) VALUES (9,5000);

-- Fidelizacao

INSERT INTO Fidelizacao(id,diasMinimo) VALUES (10,50);
INSERT INTO Fidelizacao(id,diasMinimo) VALUES (11,100);
INSERT INTO Fidelizacao(id,diasMinimo) VALUES (12,365);
INSERT INTO Fidelizacao(id,diasMinimo) VALUES (13,730);

-- Conquistou 

INSERT INTO Conquistou(idCliente,idConquista) VALUES(1,1);
INSERT INTO Conquistou(idCliente,idConquista) VALUES(1,6);
INSERT INTO Conquistou(idCliente,idConquista) VALUES(1,7);
INSERT INTO Conquistou(idCliente,idConquista) VALUES(1,10);
INSERT INTO Conquistou(idCliente,idConquista) VALUES(1,8);
INSERT INTO Conquistou(idCliente,idConquista) VALUES(1,11);
INSERT INTO Conquistou(idCliente,idConquista) VALUES(1,14);
INSERT INTO Conquistou(idCliente,idConquista) VALUES(1,12);

INSERT INTO Conquistou(idCliente,idConquista) VALUES(2,14);
INSERT INTO Conquistou(idCliente,idConquista) VALUES(2,1);
INSERT INTO Conquistou(idCliente,idConquista) VALUES(2,6);
INSERT INTO Conquistou(idCliente,idConquista) VALUES(2,7);

INSERT INTO Conquistou(idCliente,idConquista) VALUES(3,14);
INSERT INTO Conquistou(idCliente,idConquista) VALUES(3,1);

-- Compra

INSERT INTO Compra(id, idCliente, valor, dataHora, pontos, idSazonal, idPorPontos)
VALUES (1,3,51.98,"2020-04-04 12:01:04",51,NULL,NULL);

INSERT INTO Compra(id, idCliente, valor, dataHora, pontos, idSazonal, idPorPontos)
VALUES (2,2,235.92,"2020-04-06 08:32:43",235,2,NULL);

INSERT INTO Compra(id, idCliente, valor, dataHora, pontos, idSazonal, idPorPontos)
VALUES (3,2,45.49,"2020-04-14 19:04:14",45,NULL,4);

INSERT INTO Compra(id, idCliente, valor, dataHora, pontos, idSazonal, idPorPontos)
VALUES (4,1,1283.85,"2020-04-14 19:04:14",1283,NULL,NULL);

INSERT INTO Compra(id, idCliente, valor, dataHora, pontos, idSazonal, idPorPontos)
VALUES (5,1,25.50,"2020-04-16 18:13:19",25,NULL,2);

-- CompraDoBundle

INSERT INTO CompraDoBundle(idCompra, idBundle, quantidade) VALUES (2,5,1);
INSERT INTO CompraDoBundle(idCompra, idBundle, quantidade) VALUES (4,6,3);

-- CompraDoProduto

INSERT INTO CompraDoProduto(idCompra, idProduto, quantidade) VALUES (1,14,1);
INSERT INTO CompraDoProduto(idCompra, idProduto, quantidade) VALUES (1,22,1);
INSERT INTO CompraDoProduto(idCompra, idProduto, quantidade) VALUES (2,28,1);
INSERT INTO CompraDoProduto(idCompra, idProduto, quantidade) VALUES (3,25,1);
INSERT INTO CompraDoProduto(idCompra, idProduto, quantidade) VALUES (4,26,3);
INSERT INTO CompraDoProduto(idCompra, idProduto, quantidade) VALUES (5,15,1);
