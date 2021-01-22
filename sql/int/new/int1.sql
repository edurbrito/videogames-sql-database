.mode columns
.headers on
.nullvalue NULL

SELECT P.nome, V.dataLancamento
    FROM Produto AS P, Videojogo AS V
    WHERE P.sku = V.sku AND V.dataLancamento BETWEEN '2019-01-01' AND '2019-12-31'
    ORDER BY V.dataLancamento ASC;

-- Apresenta os videojogos lançados em 2019, ordenados por ordem crescente da sua data de lançamento.