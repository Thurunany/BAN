-- Elabore uma consulta que mostre nome e autorização de cada empresa cadastrada, e ao lado dessas informações 
-- o valor total faturado (soma do campo preço) por ela nos bilhetes associados aos trechos da empresa para o ano de 2020.

SELECT 
       e.autorizacao, 
       e.nome, 
       SUM(b.preco) AS total_faturado 
FROM empresas e
INNER JOIN trechos t 
       ON e.codempresa = t.codempresa
INNER JOIN bilhetes b 
      ON t.codtrecho = b.codtrecho
WHERE 
      DATE_PART('year', b.dtemissao) = 2020
GROUP BY e.autorizacao, e.nome;