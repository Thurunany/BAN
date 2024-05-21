SELECT nome, COUNT(*)
FROM FUNCIONARIOS f
JOIN consultas c
ON f.matricula = c.matricula
GROUP BY f.matricula
;
