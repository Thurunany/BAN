-- O funcionário com matrícula 111 tornou-se um animal. Faça uma expressão SQL que cadastre este funcionário como um animal. 
-- Este novo animal deverá ser irmã (por parte de pai e mãe) do animal que se chama Glória. Considere que este novo animal nasceu exatamente no mesmo dia do animal que se chama Juzz. Não é necessário excluir este funcionário.

INSERT INTO animais VALUES
(
	(SELECT nome FROM funcionarios WHERE matricula = 111),
	(SELECT codespecie FROM animais WHERE nomeanimal LIKE 'Glória'),
	(SELECT (SELECT MAX(codanimal)+1 FROM animais)),
	(SELECT codanimalpai FROM animais WHERE nomeanimal LIKE 'Glória'),
	(SELECT codanimalmae FROM animais WHERE nomeanimal LIKE 'Glória'),
	(SELECT dtnascanimal FROM animais WHERE nomeanimal LIKE 'Juzz')
)