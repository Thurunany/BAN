- 1) Elabore uma consulta capaz de retornar o nome do animal que tem consulta marcada com todos os funcionários.
select nomeanimal from animais a where 
not exists (Select * From funcionarios f where 
			not exists(Select * from consultas c where 
                       c.codanimal=a.codanimal and c.matricula=f.matricula));			   

select nomeanimal from animais a where 
(Select count(distinct matricula) from consultas c where c.codanimal=a.codanimal) = (Select count(*) from funcionarios);
			
					   
/* 2) Elabore uma consulta que mostre o nome das espécies que tem consulta marcada com todos os funcionários. 
 Para que a espécie seja retornada, é preciso que haja pelo menos uma consulta entre cada funcionário e 
 um animal desta espécie.*/
select nomeespecie from especies e where 
		not exists (Select * From funcionarios f where 
					not exists (Select * from consultas c natural join animais a where 
                                c.matricula=f.matricula and c.codanimal=a.codanimal
							    and a.codespecie=e.codespecie));

-- OU
								
select nomeespecie from especies e where 
		not exists (Select * From funcionarios f where 
					not exists (Select * from consultas c where c.matricula=f.matricula 
								and EXISTS (Select * from animais a where a.codanimal=c.codanimal and
											a.codespecie=e.codespecie)));								
												
/* 3) Elabore uma consulta que retorne o nome dos animais para os quais foram prescritos todos 
 os medicamentos cadastrados no banco de dados. Além do nome do animal, mostre também o nome de sua mãe. 
 Caso o animal não possua mãe, mostrar o nome da mãe em branco ou nulo.*/

select a.nomeanimal, a2.nomeanimal from animais a left join animais a2 on a.codanimalmae=a2.codanimal 
 where not exists (Select * From medicamentos m where 
				   not exists (Select * from consultas c natural join prescricao p where 
 						       c.codanimal=a.codanimal and p.codmedicamento=m.codmedicamento));			   
							   
							   
							   
/* 4) Elabore uma consulta que retorne o nome dos animais da espécie Coelho e que tem consulta marcada. 
 Resolva esta questão utilizando pelo menos 1 subconsulta na cláusula FROM. */
 select distinct nomeanimal FROM animais natural join 
		(Select codespecie From especies where nomeespecie='Coelho') as e natural join consultas;
					

select b.nomeanimal from (select distinct nomeanimal from animais a join especies e on e.codespecie = a.codespecie
join consultas c on c.codanimal = a.codanimal
where e.nomeespecie='Coelho'
and a.codanimal in (select codanimal from consultas))as b							   
							   
					
					
/* 5) Elabore uma consulta que retorne o nome dos funcionários que já prescreveram o medicamento que tem o nome 
Fliur. Resolva esta questão utilizando pelo menos 1 subconsulta na cláusula FROM. */
Select distinct nome From funcionarios natural join consultas natural join prescricao natural join 
			(Select codmedicamento From medicamentos Where nomemedicamento='Fliur') as m;
 
							   
							   
							   
							   
/* 6) Buscar o nome dos funcionários (veterinários) pediatras que já prescreveram medicamentos para coelhos. 
							   Resolva esta questão utilizando pelo menos 2 subconsultas na cláusula FROM. */
Select distinct nome From (Select matricula,nome From funcionarios Where especialidade='pediatra') as f 
			natural join consultas natural join prescricao natural join animais natural join 
							(Select codespecie From especies where nomeespecie='Coelho') as e;
					
					
							   
/* 7) Elabore uma consulta que retorne o nome dos medicamentos prescritos por pediatras a animais da espécie 
Hipopótamo. Resolva esta questão utilizando pelo menos 2 subconsultas na cláusula FROM.*/
Select distinct nomemedicamento From (Select matricula From funcionarios Where especialidade='pediatra') as f 
natural join consultas natural join prescricao natural join medicamentos natural join animais natural join 
		(Select codespecie From especies where nomeespecie='Hipopótamo') as e; 
					
					
					
					
					
 
/* 8) O funcionário com código 111 tornou-se um animal. Faça uma expressão SQL que 
 cadastre este funcionário como um animal. Este novo animal deverá ser irmã 
 (por parte de pai e mãe) do animal que se chama Glória. Considere que este novo 
 animal nasceu no mesmo dia do animal que se chama Juzz.*/
 Insert into animais (nomeanimal, codespecie, codanimalpai, codanimalmae, dtnascanimal,	codanimal) 
    Select f.nome, a.codespecie, a.codanimalpai, a.codanimalmae, b.dtnascanimal,(Select MAX(codanimal)+1 From animais)
	 From Animais a, funcionarios f, Animais b 
     Where a.nomeanimal='Glória' and f.matricula=111 and b.nomeanimal='Juzz';

-- OU
insert into animais (nomeanimal,codespecie,codanimal,codanimalpai,codanimalmae,dtnascanimal) 
values
(  (select nome from funcionarios where matricula=111),
   (SELECT codespecie from animais where nomeanimal = 'Glória' ),
   (SELECT max(codanimal) + 1 from animais),
   (SELECT codanimalpai from animais where nomeanimal = 'Glória'),
   (select codanimalmae from animais where nomeanimal = 'Glória'),
   (SELECT dtnascanimal from animais where nomeanimal = 'Juzz')
);	
					
						   
 /* 9 - Formule uma expressão SQL que modifique a expectativa de vida de todas as 
 espécies retornadas pela expressão SQL da questão 2. A nova expectativa de vida 
 deve corresponder a um valor incrementado sobre a expectativa de vida atual. O valor 
 de incremento deve corresponder a  10% do valor da maior expectativa de vida 
 cadastrada no banco de dados. Reaproveite a expressão da questão 2 para identificar 
 as espécies que precisam deste aumento. */
 Update especies set expectativaespecie = expectativaespecie+(Select max(expectativaespecie)*0.1 From especies)
 WHERE codespecie IN (select codespecie from especies e where 
					  not exists (Select * From funcionarios f where 
								  not exists(Select * from consultas c natural join animais a where 
                                              c.matricula=f.matricula and a.codespecie=e.codespecie)));
										 

/* 10 - O animal com nome Opalala se casou com o animal que contém o maior código cadastrado
 para codanimal. Este casamento gerou como filho um novo animal, que nasceu em 
 12/01/2019 e foi batizado com o nome 'Janjão'. Faça uma única expressão SQL 
 que contemple a criação deste filho do casal. */ 
 insert into animais (nomeanimal,dtnascanimal,codanimal,codespecie,codanimalpai,
  codanimalmae) 
 values 
  ('Janjão', '2019-01-12',(Select max(codanimal)+1 from animais),
  (Select codespecie from animais where nomeanimal='Opalala'), 
  (Select codanimal from animais where nomeanimal='Opalala'),
  (Select max(codanimal) from animais));  
   
