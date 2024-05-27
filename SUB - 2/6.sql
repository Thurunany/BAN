-- Buscar o nome dos funcionários (veterinários) pediatras que já prescreveram medicamentos para coelhos. 
-- Resolva esta questão utilizando pelo menos 2 subconsultas na cláusula FROM.

SELECT DISTINCT nome
FROM funcionarios
NATURAL JOIN (SELECT matricula, codanimal FROM consultas WHERE codconsulta IN (SELECT codconsulta FROM prescricao))
NATURAL JOIN (SELECT codanimal FROM animais WHERE codespecie IN (SELECT codespecie FROM especies WHERE nomeespecie = 'Coelho'))
;