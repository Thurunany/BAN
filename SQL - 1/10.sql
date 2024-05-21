SELECT DISTINCT
    c.matricula,
    f.nome
FROM consultas c
JOIN funcionarios f ON c.matricula = f.matricula
JOIN animais a ON c.codanimal = a.codanimal
WHERE a.codespecie = 1
;
