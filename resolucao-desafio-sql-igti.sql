/*
Questão 8
Considere o banco de dados do enunciado. Crie uma consulta em SQL e responda: Qual a média salarial nessa empresa?
*/

select avg(salario) as Salário 
from empregado;

/*
Questão 9
Considere o banco de dados do enunciado. 
Crie uma consulta em SQL e responda: Quantos empregados do departamento 5 trabalham mais de 10h por semana no projeto chamado "ProductX"?
*/

select count(*) as Qtd_empregados
from empregado as e

inner join trabalha_em as t 
on t.essn = e.ssn
inner join projeto as p 
on p.pnumero = t.pno

where e.dno = 5
and p.pjnome = 'ProductX'
and t.horas > 10;

/*
Questão 10
Considere o banco de dados do enunciado. 
Crie uma consulta em SQL e responda: Quantos empregados possuem um dependente com o mesmo primeiro nome que o deles?
*/

select count(*) as Qtd_empregados
from empregado as e
inner join dependente as d 
on d.essn = e.ssn
where e.pnome = d.nome_dependente

/*Questão 11
Considere o banco de dados do enunciado. 
Crie uma consulta em SQL e responda: Quais os nomes de todos os empregados que são diretamente supervisionados por Franklin Wong
*/

select pnome from empregado
where superssn = (select ssn from empregado where pnome = 'Franklin' and unome = 'Wong');

/*
Questão 12
Considere o banco de dados do enunciado. 
Crie uma consulta em SQL e responda: Quem é a pessoa que possui mais tempo de alocação no projeto 'Newbenefits'?
*/

select e.pnome, t.horas, p.pjnome
from empregado e

inner join trabalha_em as t 
on t.essn = e.ssn
inner join projeto as p 
on p.pnumero = t.pno

where p.pjnome = 'Newbenefits'
order by t.horas desc;

/*
Questão 13
Considere o banco de dados do enunciado. 
Crie uma consulta em SQL e responda: Qual é a soma dos salários de todos os empregados do departamento chamado 'Research'?
Grupo de escolhas da pergunta
*/

select sum(e.salario) as total_salario
from empregado as e

inner join departamento as d 
on d.dnumero = e.dno

where d.dnome = 'Research';

/*
Questão 14
Considere o banco de dados do enunciado. Crie uma consulta em SQL e responda: 
Qual seria o custo do projeto com folha salarial (soma de todos os salários),
 caso a empresa desse 10% de aumento para todos os empregados que trabalham no projeto 'ProductX'?
*/

select sum(e.salario), sum(e.salario) * 1.10 as novo_salario
from projeto p
	
inner join departamento as d 
on d.dnumero = p.dnum
inner join empregado as e 
on e.dno = d.dnumero
inner join trabalha_em as t 
on t.essn = e.ssn and T.PNO = P.PNUMERO

where pjnome = 'ProductX';

/*
Questão 15
Considere o banco de dados do enunciado. 
Crie uma consulta em SQL e responda: Qual o nome do departamento com a menor média de salário entre seus funcionários?
*/

select e.dno as id_depto, d.dnome as nome_depto, sum(e.salario) / count(*) as media_salarial
from empregado as e

inner join departamento as d 
on d.dnumero = e.dno

group by e.dno, d.dnome 
order by (sum(e.salario) / count(*)) asc;