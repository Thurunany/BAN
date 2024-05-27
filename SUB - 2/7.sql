-- Elabore uma consulta que retorne o nome dos medicamentos prescritos por pediatras a animais da espécie Hipopótamo. 
-- Resolva esta questão utilizando pelo menos 2 subconsultas na cláusula FROM.

SELECT DISTINCT nomemedicamento
FROM consultas
NATURAL JOIN (SELECT codanimal FROM animais WHERE codespecie IN (SELECT codespecie FROM especies WHERE nomeespecie = 'Hipopótamo'))
NATURAL JOIN (SELECT nomemedicamento, codconsulta FROM prescricao NATURAL JOIN medicamentos)