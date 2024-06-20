CREATE OR REPLACE FUNCTION atendimento(paciente_codigo INT)
RETURNS TABLE (medico_codm INT, medico_nome VARCHAR) AS $$
BEGIN RETURN QUERY 
    SELECT
        m.codm, m.nome FROM medicosm 
        INNER JOIN consultasc ON m.codm=c.codm WHERE c.codp=pacientecodigo 
        UNION 
        SELECT m2.codm,m2.nome
        FROM medicosm2 WHERE m2.nroa IN (SELECT m3.nroa FROM medicosm3 INNER JOIN 
        consultasc3ONm3.codm=c3.codm WHERE c3.codp=pacientecodigo);
END; 
$$
LANGUAGE plpgsql;