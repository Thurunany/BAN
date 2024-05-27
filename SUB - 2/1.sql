--Elabore uma consulta capaz de retornar o nome do animal que tem consulta marcada com todos os funcionários.

SELECT an.nomeanimal
FROM animais an
WHERE EXISTS (SELECT co.codanimal 
				FROM consultas co
			WHERE an.codanimal = co.codanimal 
			GROUP BY co.codanimal
			HAVING COUNT(DISTINCT co.matricula) = (SELECT COUNT(matricula) FROM funcionarios
		))