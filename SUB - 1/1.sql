-- Faça uma consulta SQL para mostrar o nome dos veterinários/funcionários que tem consulta marcada com o animal com nome Glória. 
-- Resolva esta questão usando subconsultas com IN.

SELECT
    f.nome
FROM funcionarios f
JOIN consultas co
ON f.matricula = co.matricula
WHERE co.codAnimal IN (SELECT an.codAnimal FROM animais an WHERE an.nomeAnimal LIKE 'Glória')
;