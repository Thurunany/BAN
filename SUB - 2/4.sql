-- Elabore uma consulta que retorne o nome dos animais da espécie Coelho e que tem consulta marcada. 
-- Resolva esta questão utilizando pelo menos 1 subconsulta na cláusula FROM.

SELECT DISTINCT nomeanimal
FROM consultas
NATURAL JOIN animais
NATURAL JOIN (SELECT codespecie FROM especies WHERE nomeespecie = 'Coelho')
;