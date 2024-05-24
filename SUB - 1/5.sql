-- Faça uma consulta SQL para mostrar o nome dos veterinários/funcionários que tem consulta marcada com o animal com nome Glória. 
-- Resolva usando subconsultas com EXISTS.

SELECT DISTINCT
    f.nome
FROM funcionarios f
JOIN consultas co
ON f.matricula = co.matricula
WHERE EXISTS (SELECT an.codAnimal FROM animais an WHERE co.codAnimal = an.codAnimal AND an.nomeAnimal LIKE 'Glória')
;