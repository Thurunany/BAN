-- Faça uma consulta SQL que mostre o nome dos medicamentos que nunca foram prescritos para Hipopótamos. 
-- Procure resolver sem usar junções e produtos cartesianos.

SELECT 
me.nomemedicamento
FROM medicamentos me
WHERE NOT EXISTS (SELECT pre.codmedicamento
FROM prescricao pre
WHERE pre.codmedicamento = me.codmedicamento AND pre.codconsulta IN
(SELECT co.codconsulta
FROM consultas co
WHERE EXISTS (SELECT an.codanimal 
FROM animais an
WHERE co.codanimal = an.codanimal AND
an.codespecie IN (SELECT es.codespecie FROM especies es WHERE es.nomeespecie = 'Hipopótamo')
)))
;