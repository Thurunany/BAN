-- Faça uma consulta para buscar o nome dos animais que são irmãos do animal que se chama Salti (por parte de pai e de mãe). 
-- Procure resolver estar questão usando apenas uma subconsulta.

SELECT a1.nomeanimal
FROM animais a1
WHERE EXISTS (SELECT a2.codanimalpai, a2.codanimalmae 
FROM animais a2 
WHERE a2.nomeanimal = 'Salti' AND
(a1.codanimalpai = a2.codanimalpai
OR a1.codanimalmae = a2.codanimalmae))
AND a1.nomeanimal != 'Salti'
;