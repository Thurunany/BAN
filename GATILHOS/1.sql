-- Crie um gatilho de forma que na alteração de funcionários, não permita que o salário de um funcionário seja reduzido.
Texto de resposta Questão 1

CREATE OR REPLACE FUNCTION bloquea_reducao() RETURNS TRIGGER AS $$ 
BEGIN
    IF NEW.salario < OLD.salario
        THEN RAISE EXCEPTION 'Naoépermitidoreducaodesalario';
        ENDIF;
        RETURNNEW;
END;
LANGUAGE plpgsql;

-----------------------------------------------------

CREATE TRIGGER verifica_salario 

BEFORE UPDATE OF salario ON funcionarios 

FOR EACH ROW EXECUTE FUNCTION bloquea_reducao();