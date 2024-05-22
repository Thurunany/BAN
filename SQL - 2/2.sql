-- Elabore uma consulta que mostre o nome e código de cada passageiro, e ao lado destas informações o total de passageiros dependentes dele. 
-- O passageiro dependente é todo aquele que utiliza o código deste passageiro em seu campo passResponsavel.

SELECT 
        p1.codpass, 
        p1.nome, 
         COUNT(p2.codpass) AS qtd_dependente
FROM passageiros p1 
JOIN passageiros p2 
        ON p2.passresponsavel = p1.codpass 
GROUP BY p1.codpass
;