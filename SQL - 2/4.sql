-- Elabore uma consulta para buscar o código da reserva e o nome dos passageiros que compraram o bilhete mais barato do sistema. 
-- Em caso de empate, mostrar os dados de apenas um dos passageiros que possuem bilhete com o valor mais baixo cadastrado.

SELECT 
         b.codreserva, 
         p.nome, 
         b.preco 
FROM bilhetes b
JOIN passageiros p
        ON b.codpass = p.codpass 
WHERE 
          b.preco = (SELECT MIN(preco) FROM bilhetes)
ORDER BY p.nome LIMIT 1
;