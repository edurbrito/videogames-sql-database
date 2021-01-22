.mode columns
.header on
.nullvalue NULL

PRAGMA foreign_keys = ON;

CREATE TRIGGER IF NOT EXISTS Maior13Anos
BEFORE INSERT ON Cliente
WHEN JULIANDAY(NEW.dataNascimento) + 4745 > JULIANDAY('now')
BEGIN

    SELECT RAISE(ROLLBACK, "Necessita de uma idade superior ou igual a 13 anos - Cliente Não Inserido");
    
END;

-- Impede o registo de Clientes com idade inferior a 13 anos