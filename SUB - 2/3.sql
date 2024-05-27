-- Elabore uma consulta que retorne o nome dos animais para os quais foram prescritos todos os medicamentos cadastrados no banco de dados. 
-- Além do nome do animal, mostre também o nome de sua mãe. Caso o animal não possua mãe, mostrar o nome da mãe em branco ou nulo.

SELECT an.nomeanimal, (Select nomeanimal From animais m Where m.codanimal=an.codanimalmae) 
FROM animais an
WHERE EXISTS (SELECT co.codanimal 
				FROM consultas co
				NATURAL JOIN prescricao pres
				WHERE an.codanimal = co.codanimal 
				GROUP BY co.codanimal
				HAVING COUNT(DISTINCT pres.codmedicamento) = (SELECT COUNT(codmedicamento) FROM medicamentos
		))
;