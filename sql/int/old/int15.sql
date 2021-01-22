.mode columns
.headers on
.nullvalue NULL

-- Descomentar para visualizar
-- INSERT INTO Cliente(id, username, nome, email, dataNascimento, morada, codigoPostal, dataCriacaoConta, pontos, localizacao, estatuto) 
-- VALUES (4,"pdff2","Pedro Ferreira2","up2018206506@fe.up.pt","2000-06-19","Rua Tal, no 607, Bairro","101-23","2019-01-01",1721,6,4);

SELECT titulo, username, pontos FROM 
Estatuto LEFT JOIN Cliente ON Estatuto.id = Cliente.estatuto
ORDER BY pontosMaximo DESC;

-- Tabela apresentando todos os Estatutos e Clientes com esse determinado estatuto.