-- O animal com nome Opalala se casou com o animal que contém o maior código  cadastrado para codanimal. 
-- Este casamento gerou como filho um novo animal, que nasceu em 12/01/2019 e foi batizado com o nome 'Janjão'. 
-- Faça uma única expressão SQL que contemple a criação deste filho do casal.

INSERT INTO animais VALUES (
	'Janjão',
	(SELECT codespecie FROM animais WHERE nomeanimal LIKE 'Opalala'),
	(SELECT (SELECT MAX(codanimal)+1 FROM animais)),
	(SELECT codanimal FROM animais WHERE nomeanimal LIKE 'Opalala'),
	(SELECT MAX(codanimal) FROM animais),
	'12/01/2019'
)