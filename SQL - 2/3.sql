-- Elabore uma consulta para buscar o código da reserva e o nome dos passageiros que compraram o bilhete mais barato do sistema. 
-- Em caso de empate, mostrar os dados de todos os passageiros que possuem bilhete com o valor mais baixo cadastrado.

SELECT 
         b.codreserva, 
         p.nome 
FROM bilhetes  b
JOIN passageiros p
         ON b.codpass = p.codpass 
WHERE 
         b.preco = (SELECT MIN(preco) FROM bilhetes)
;