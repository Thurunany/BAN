-- Buscar os nomes de todos os animais que são mais velhos que o animal que se chama Salti. Procure resolver esta questão com uma subconsulta.

SELECT a1.nomeanimal
FROM animais a1
WHERE dtnascanimal < (SELECT a2.dtnascanimal 
                                           FROM animais a2 
                                        WHERE a2.nomeanimal = 'Salti')
;