.mode columns
.header on
.nullvalue NULL

PRAGMA foreign_keys = ON;

DROP TRIGGER IF EXISTS AtualizarStockProduto;
DROP TRIGGER IF EXISTS AtualizarStockBundle;