-- Faça uma consulta SQL que mostre o código e nome da espécie com a maior expectativa de vida. 
-- Caso haja mais de uma espécie com o maior valor, mostrar todas estas. Resolva usando subconsultas com EXISTS e sem usar a função MAX.

SELECT 
e1.codespecie,
e1.nomeespecie
FROM especies e1
WHERE NOT EXISTS (SELECT e2.expectativaespecie 
FROM especies e2 
WHERE e1.expectativaespecie < e2.expectativaespecie)
;