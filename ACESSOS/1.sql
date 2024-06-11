-- Faça uma autorização de acesso que garanta que o usuário doutor tenha acesso completo (I,U,D,S) aos dados de todos os pacientes

GRANT SELECT, INSERT, UPDATE, DELETE ON Pacientes TO doutor;