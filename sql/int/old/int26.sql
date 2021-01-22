.mode columns
.headers on
.nullvalue NULL

SELECT C1.nome as Nome,C2.nome as Nome,valor,Produto.nome
    FROM
        (SELECT A1.idCliente as Nome1, A2.idCliente as Nome2, A1.valor, A1.skuV as videogameID
            FROM Avaliacao A1, Avaliacao A2
            WHERE A1.idCliente<A2.idCliente AND A1.valor=A2.valor AND A1.skuV=A2.skuV), Produto, Cliente C1, Cliente C2
            WHERE videogameID=sku AND Nome1=C1.id AND Nome2=C2.id;

--Pairs of Clients with the Same Avaluation to the Same Videogame

SELECT C1.username, C2.username, valor, P.nome AS Videojogo
    FROM Produto P, 
        Cliente C1, 
        Cliente C2, 
        (SELECT A1.idCliente AS id1, A2.idCliente AS id2, A1.valor AS valor, A1.skuV AS skuV
            FROM Avaliacao A1, Avaliacao A2
            WHERE id1 < id2 AND A1.valor = A2.valor AND A1.skuV=A2.skuV)
    WHERE P.sku = skuV AND C1.id = id1 AND C2.id = id2;
