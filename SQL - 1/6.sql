SELECT especialidade, COUNT(especialidade)
FROM funcionarios
GROUP BY especialidade
;
