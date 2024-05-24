-- Faça uma consulta SQL que mostre o nome e a idade do animal mais jovem. 
-- Caso haja mais de um animal com a idade mais jovem, mostrar todos estes. Resolva usando subconsultas com ANY/ALL e sem usar a função MIN.

SELECT 
    nomeanimal, 
    CONCAT((DATE_PART('Year', CURRENT_DATE) - DATE_PART('Year', dtnascanimal)), ' anos') AS idade_animal 
FROM animais 
WHERE dtnascanimal <= ALL (SELECT dtnascanimal FROM animais)
;