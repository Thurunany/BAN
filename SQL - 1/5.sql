-- Forneça uma expressão SQL para buscar o nome e data de nascimento dos animais que já são avós.

SELECT DISTINCT  
    a3.nomeanimal,
    a3.dtnascanimal
FROM ANIMAIS a1, ANIMAIS a2, ANIMAIS a3
WHERE a2.codanimal = a1.codanimalpai AND a3.codanimal = a2.codanimalpai
;