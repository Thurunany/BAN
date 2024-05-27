-- Elabore uma consulta que mostre o nome das espécies que tem consulta marcada com todos os funcionários. 
-- Para que a espécie seja retornada, é preciso que haja pelo menos uma consulta entre cada funcionário e um animal desta espécie.

SELECT esp.nomeespecie
FROM especies esp
WHERE EXISTS ( SELECT tt.codespecie, count(tt.codespecie)
					FROM (SELECT DISTINCT codespecie, matricula FROM consultas NATURAL JOIN animais) AS tt
				WHERE tt.codespecie = esp.codespecie
				GROUP BY tt.codespecie
				HAVING COUNT(tt.codespecie) = (SELECT COUNT(matricula) FROM funcionarios)
			)
;