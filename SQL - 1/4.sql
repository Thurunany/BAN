-- Forneça uma expressão SQL para buscar o código e nome dos animais que são 
-- irmãos por parte de pai e mãe do animal que se chama Salti.

SELECT
    a1.nomeanimal,
    a1.codanimal
FROM ANIMAIS a1
WHERE
    codanimalpai = (SELECT codanimalpai FROM animais WHERE nomeanimal LIKE 'Salti')
AND
    codanimalmae = (SELECT codanimalmae FROM animais WHERE nomeanimal LIKE 'Salti')
AND
a1.nomeanimal != 'Salti'
;