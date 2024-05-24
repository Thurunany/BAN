-- Faça uma consulta SQL para mostrar o nome dos veterinários/funcionários que tem consulta marcada com o animal com nome Glória. 
-- Resolva usando subconsultas com ANY/ALL

SELECT
    f.nome
FROM funcionarios f
JOIN consultas co
ON f.matricula = co.matricula
WHERE co.codAnimal <> ALL (SELECT an.codAnimal FROM animais an WHERE an.nomeAnimal NOT LIKE 'Glória')
;