-- Elabore uma consulta que mostre os códigos 
-- e nome de todos os passageiros cadastrados, e ao lado dessas informações a quantidades de bilhetes emitidos por cada passageiro.

SELECT 
          p.codpass, 
          p.nome, 
          COUNT(b.codreserva) AS qtd_bilhete
FROM 
          passageiros p
JOIN bilhetes b
             ON p.codpass = b.codpass 
GROUP BY p.codpass
;