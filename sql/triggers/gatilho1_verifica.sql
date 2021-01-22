.mode columns
.header on
.nullvalue NULL

PRAGMA foreign_keys = ON;

.print ''
.print 'Tabela "Cliente" inicial:'
.print ''

SELECT id, username, dataNascimento FROM Cliente;

.print ''
.print '-- Tentativa de inserção de um Cliente com idade menor que 13 anos --'
.print ''
.print 'Data de nascimento Inválida = 2014-11-22 :'
.print ''

INSERT INTO Cliente(id, username, nome, email, dataNascimento, morada, codigoPostal, dataCriacaoConta, pontos, localizacao, estatuto) 
VALUES (4,"novoUtilizadorWrong","novoUtilizadorWrong","novoutilizadorwrong@fe.up.pt","2014-11-22","Rua da Esquina, no 3, Coiso","4020-202","2020-05-20",0,1,1);

.print ''

SELECT id, username, dataNascimento FROM Cliente;

.print ''
.print '-- Tentativa de inserção de um Cliente com idade maior ou igual a 13 anos --'
.print ''
.print 'Data de nascimento Válida = 2000-11-22 :'
.print ''

INSERT INTO Cliente(id, username, nome, email, dataNascimento, morada, codigoPostal, dataCriacaoConta, pontos, localizacao, estatuto) 
VALUES (5,"novoUtilizadorRight","novoUtilizadorRight","novoutilizadorright@fe.up.pt","2000-11-22","Rua da Esquina, no 3, Coiso","4020-202","2020-05-20",0,1,1);

SELECT id, username, dataNascimento FROM Cliente;

.print ''
.print 'Tabela "Cliente" final:'
.print ''

SELECT id, username, dataNascimento FROM Cliente;