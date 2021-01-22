.mode columns
.header on
.nullvalue NULL

PRAGMA foreign_keys = ON;

CREATE TRIGGER IF NOT EXISTS AtualizarStockProduto
AFTER INSERT ON CompraDoProduto
BEGIN

    UPDATE Produto
    SET stock = stock - NEW.quantidade
    WHERE sku = NEW.idProduto;

END;

CREATE TRIGGER IF NOT EXISTS AtualizarStockBundle
AFTER INSERT ON CompraDoBundle
BEGIN

    UPDATE Produto
    SET stock = stock - (SELECT quantidade * NEW.quantidade AS qtd 
        FROM BcontemP 
        WHERE BcontemP.idB = NEW.idBundle AND BcontemP.skuP = sku)
    WHERE sku IN (SELECT skuP FROM BcontemP WHERE BcontemP.idB = NEW.idBundle);

END;
