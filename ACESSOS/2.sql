-- Com relação às consultas médicas, faça uma autorização de acesso que garanta que o usuário estag possa ver (S) o nome do médico, 
-- o nome do paciente e a data da consulta, mas não possa ver a doença do paciente e a hora da consulta.

CREATE VIEW ConsultaEstag AS
SELECT m.nome AS nome_medico, p.nome AS nome_paciente, c.data
FROM Consultas c
JOIN Medicos m ON c.codm = m.codm
JOIN Pacientes p ON c.codp = p.codp;
----------------------------

GRANT SELECT ON ConsultaEstag TO estag;