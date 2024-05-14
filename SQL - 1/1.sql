-- Forneça duas expressões SQL que sejam capazes de mostrar a maior expectativa de vida dentre 
-- todas as espécies cadastradas. 
-- Em ambas as soluções, não é permitido usar subconsultas nem mesmo limit/top.

SELECT
    MAX(expectativaespecie)
FROM
    especies
;