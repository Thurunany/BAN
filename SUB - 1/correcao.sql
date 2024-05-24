-- 1)
SELECT nome FROM funcionarios WHERE 
matricula IN (Select matricula From consultas Where 
			    codanimal IN (Select codanimal From animais 
							  Where nomeanimal='Glória'));

SELECT nome FROM funcionarios NATURAL JOIN consultas Where 
			    codanimal IN (Select codanimal From animais 
							  Where nomeanimal='Glória');

-- 2)
SELECT nomeanimal, (Select nomeanimal From animais m Where 
					m.codanimal=a.codanimalmae) 
FROM animais a WHERE
codanimal IN(Select codanimal From consultas)
AND codanimal NOT IN(Select codanimal From consultas 
					  Where date_part('DAY',data)>=16);
							  
-- 3)
SELECT nomeanimal, age(dtnascanimal) From animais
WHERE age(dtnascanimal) <= ALL (Select age(dtnascanimal) From animais);

-- 4) 
SELECT nome FROM funcionarios WHERE 
matricula =ANY (Select matricula From consultas Where 
			    codanimal =ANY (Select codanimal From animais 
							  Where nomeanimal='Glória'));
							  
-- 5)	
SELECT nome FROM funcionarios f WHERE 
EXISTS (Select 1 From consultas c Where c.matricula=f.matricula AND
			    EXISTS (Select 1 From animais a WHERE a.codanimal=c.codanimal 
						  AND nomeanimal='Glória'));								
								
-- 6)
SELECT codespecie, nomeespecie FROM especies e
 WHERE NOT EXISTS(Select 1 From especies e2 Where 
				  e2.expectativaespecie>e.expectativaespecie);

-- 7) 
SELECT nomemedicamento from medicamentos WHERE
codmedicamento NOT IN(Select codmedicamento From prescricao Where
				  codconsulta IN (Select codconsulta From consultas Where
								 codanimal IN(Select codanimal From animais Where
											 codespecie IN (Select codespecie From especies Where nomeespecie='Hipopótamo'))));

							SELECT nomemedicamento from medicamentos m WHERE
NOT EXISTS (Select codmedicamento From prescricao p Where p.codmedicamento=m.codmedicamento
		  AND EXISTS (Select codconsulta From consultas c Where c.codconsulta=p.codconsulta
				 AND EXISTS (Select codanimal From animais a Where a.codanimal=c.codanimal
                 	 AND EXISTS (Select codespecie From especies e Where e.codespecie=a.codespecie and nomeespecie='Hipopótamo'))));
	
								
-- 8)
SELECT nome FROM funcionarios WHERE
matricula IN(Select matricula From consultas Where
			    codconsulta IN (Select codconsulta From prescricao)
				And codanimal IN(Select codanimal From animais Where
						 codespecie IN (Select codespecie From especies Where nomeespecie='Coelho')));

-- 9)
Select nomeanimal From animais a WHERE 
EXISTS (Select 1 From animais b where b.nomeanimal='Salti' and b.codanimal!=a.codanimal and
	   a.codanimalmae=b.codanimalmae and a.codanimalpai=b.codanimalpai);


select a."nomeanimal" from animais a,
(select b."codanimal",b."codanimalpai",b."codanimalmae"
from animais b where b."nomeanimal"='Salti') as c where
a."nomeanimal"!='Salti' and
a."codanimalpai" = c."codanimalpai" and
a."codanimalmae"=c."codanimalmae"


-- 10) 
Select nomeanimal From animais WHERE
dtnascanimal < (Select dtnascanimal From animais Where nomeanimal='Salti');
																								  