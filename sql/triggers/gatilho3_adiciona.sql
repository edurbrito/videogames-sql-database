.mode columns
.header on
.nullvalue NULL

PRAGMA foreign_keys = ON;

CREATE TRIGGER IF NOT EXISTS AtualizarRatingInsert
AFTER INSERT ON Avaliacao
BEGIN

    UPDATE Videojogo
    SET rating = CAST((SELECT ROUND(avg(valor)) FROM Avaliacao WHERE skuV = sku) AS INT)
    WHERE sku = NEW.skuV;

END;

CREATE TRIGGER IF NOT EXISTS AtualizarRatingDelete
AFTER DELETE ON Avaliacao
BEGIN

    UPDATE Videojogo
    SET rating = CAST((SELECT ROUND(avg(valor)) FROM Avaliacao WHERE skuV = sku) AS INT)
    WHERE sku = OLD.skuV;

END;

CREATE TRIGGER IF NOT EXISTS AtualizarRatingUpdate
AFTER UPDATE ON Avaliacao
BEGIN

    UPDATE Videojogo
    SET rating = CAST((SELECT ROUND(avg(valor)) FROM Avaliacao WHERE skuV = sku) AS INT)
    WHERE sku = NEW.skuV;
    
END;