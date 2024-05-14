-- Forneça uma expressão SQL para buscar o nome de todos os animais. Caso o animal possuir pai, 
-- mostrar o nome e data de nascimento do pai. 
-- Caso não possua pai, mostrar apenas o nome do animal com os dados do pai em branco/nulo.

SELECT
    a1.nomeanimal,
    a2.nomeanimal,

   a2.dtnascanimal

FROM ANIMAIS a1
LEFT JOIN ANIMAIS a2
ON a2.codanimal = a1.codanimalpai
;