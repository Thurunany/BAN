-- Elabore uma consulta que retorne o nome dos funcionários que já prescreveram o medicamento que tem o nome Fliur. 
-- Resolva esta questão utilizando pelo menos 1 subconsulta na cláusula FROM.

SELECT DISTINCT nome
FROM funcionarios 
NATURAL JOIN consultas 
NATURAL JOIN prescricao
NATURAL JOIN (SELECT med.codmedicamento FROM medicamentos med WHERE med.nomemedicamento = 'Fliur')
;