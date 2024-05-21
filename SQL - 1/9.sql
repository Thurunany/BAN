SELECT
    p.codmedicamento,
    m.nomemedicamento
FROM
    prescricao p
JOIN medicamentos m
ON p.codmedicamento = m.codmedicamento
GROUP BY m.nomemedicamento, p.codmedicamento
HAVING COUNT(p.codmedicamento) > 1
;
