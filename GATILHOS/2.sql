CREATE OR REPLACE FUNCTION bloquea_cpf() RETURNS TRIGGER AS $$
BEGIN IF EXISTS
(SELECT 1 FROM medicos WHERE cpf=NEW.cpf)
THEN RAISE EXCEPTION 'Naoépermitidomedicopaciente';
END IF;
RETURN NEW;
END;
$$
LANGUAGE plpgsql;

--------------------------------------------------------

CREATE TRIGGER verifica_cpf_paciente 
BEFORE INSERT ON pacientes
FOR EACH ROW EXECUTE FUNCTION bloquea_cpf();