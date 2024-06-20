CREATE OR REPLACE FUNCTION redistribui_capacidade() RETURNS TRIGGER AS $$
DECLARE capacidadeambulatorio RECORD;
BEGIN SELECT INTO capacidadeambulatorio ∗ FROM ambulatorios WHERE andar=OLD.andar AND nroa!=OLD.nroa AND nroa 
NOT IN(SELECT nroa FROM ambulatorios WHERE andar=OLD.andarFORUPDATE) LIMIT 1;
IF FOUND THEN UPDATE ambulatorios SET capacidade=capacidade+OLD.capacidadeWHEREnroa=capacidadeambulatorio.nroa;
END IF;RETURN OLD;
END;
$$
LANGUAGE plpgsql;

----------------------------------------------
CREATE TRIGGER verifica_andar
BEFORE DELETE ON ambulatorios
FOR EACH ROW EXECUTE FUNCTION redistribui_capacidade();