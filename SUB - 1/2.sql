-- Faça uma consulta SQL que mostre o nome dos animais que tem consultas marcadas sempre para dias anteriores ao dia 16 de quaisquer meses. 
-- Pesquise sobre a função date_part no PostgreSQL para fazer esta extração do dia. Além do nome, mostrar o nome da mãe destes animais. Resolva esta questão usando subconsultas com IN sem usar junções. 

SELECT
    an.nomeanimal
FROM animais an
WHERE an.codAnimal IN 
(SELECT codanimal FROM consultas co WHERE  DATE_PART('day', co.data) <= 16)
;