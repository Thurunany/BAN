CREATE OR REPLACE FUNCTION bloquea_ambulatorio() RETURNS TRIGGER AS $$
BEGIN IF EXISTS(SELECT 1 FROM medicos 
WHERE nroa=NEW.nroa)
THEN RAISE EXCEPTION 'naoépermitidoambulatoriocommaisdeummédicoresponsável';
END IF;
RETURN NEW;
END;
$$
LANGUAGE plpgsql;

-----------------------------------------------------

CREATE TRIGGER verifica_resp_ambulatorio
BEFORE INSERT ON medicos
FOR EACH ROW EXECUTE FUNCTION bloquea_ambulatorio();