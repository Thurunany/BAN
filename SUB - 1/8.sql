-- Buscar o nome dos funcionários (veterinários) que já prescreveram medicamentos para coelhos. 
-- Procure resolver esta questão sem usar junções e produtos cartesianos.

SELECT
fun.nome
FROM funcionarios fun
WHERE fun.matricula IN
(SELECT con.matricula
FROM consultas con WHERE codanimal IN
(SELECT codanimal FROM animais
WHERE codespecie IN (SELECT codespecie FROM especies WHERE nomeespecie = 'Coelho'))
AND EXISTS (SELECT pre.codconsulta FROM prescricao pre WHERE pre.codconsulta = con.codconsulta))
;