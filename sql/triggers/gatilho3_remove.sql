.mode columns
.header on
.nullvalue NULL

PRAGMA foreign_keys = ON;

DROP TRIGGER IF EXISTS AtualizarRatingInsert;
DROP TRIGGER IF EXISTS AtualizarRatingDelete;
DROP TRIGGER IF EXISTS AtualizarRatingUpdate;