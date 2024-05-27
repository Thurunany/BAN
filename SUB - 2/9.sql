-- Formule uma expressão SQL que modifique a expectativa de vida de todas as espécies retornadas pela expressão SQL da questão 2. 
-- A nova expectativa de vida deve corresponder a um valor incrementado sobre a expectativa de vida atual. 
-- O valor de incremento deve corresponder a 10% do valor da maior expectativa de vida cadastrada no banco de dados. 
-- Reaproveite a expressão da questão 2 para identificar as espécies que precisam deste aumento. 

UPDATE especies
SET expectativaespecie = expectativaespecie +  (SELECT (MAX(expectativaespecie) * 0.1) FROM especies)
WHERE codespecie IN
(
SELECT esp.codespecie
FROM especies esp
WHERE EXISTS ( 
SELECT tt.codespecie, count(tt.codespecie) FROM (SELECT DISTINCT codespecie, matricula FROM consultas NATURAL JOIN animais) AS tt WHERE tt.codespecie = esp.codespecie GROUP BY tt.codespecie HAVING COUNT(tt.codespecie) = (SELECT COUNT(matricula) FROM funcionarios))
)
;