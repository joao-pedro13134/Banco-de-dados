create database rotina;

create table tarefa(
	id serial primary key,
	nome varchar(100),
	descricao text
);
create table agenda(
	id serial primary key,
	data_inicio timestamp,
	data_fim timestamp
);
create table pessoa(
	id serial primary key,
	nome varchar(100),
	cpf char(14),
	data_nascimento timestamp
);

alter table agenda add column id_pessoa int;
alter table agenda add column id_tarefa int;

alter table agenda
add foreign key(id_pessoa)
references pessoa(id);

alter table agenda
add foreign key(id_tarefa)
references tarefa(id);

insert into tarefa(nome, descricao)
values('Café', 'Tomar café'),
	  ('Compras', 'Fazer compras'),
      ('Almoço', 'Fazer almoço'),
      ('Escola', 'Estudar p/ prova'),
      ('Atividade', 'Fazer a prova');

insert into agenda(data_inicio, data_fim, id_pessoa, id_tarefa)
values('2025-10-01 07:00:00', '2025-10-01 09:30:00', 1, 2),
	  ('2025-10-03 08::00:00', '2025-10-03 10:00:00', 2, 1),
      ('2025-10-05 12:0:00', '2025-10-05 12:30:00', 3, 4),
      ('2025-10-07 13:00:00', '2025-10-07 10:30:00', 4, 3),
      ('2025-10-09 13:30:00', '2025-10-09 16:30:00', 5, 5);
      
insert into pessoa(nome, cpf, data_nascimento)
VALUES('Cesar', '123.321.333-01', '1998-06-18 00:00:00'),
	  ('Maria', '123.321.333-02', '1999-10-22 00:00:00'),
	  ('Vitoria', '123.321.333-03', '1998-07-11 00:00:00'),
	  ('Paulo', '123.321.333-04', '1998-02-25 00:00:00'),
	  ('Simao', '123.321.333-05', '1998-02-13 00:00:00');

-- Crie 5 inserts para cada uma das 3 tabelas.

--Lista de consultas a serem realizadas (utilize o W3schools):
-- Crie no mínimo 3 consultas com SELECT;
--1
select data_inicio from agenda;
--2
select nome from pessoa;
--3
select nome from tarefa;

-- Crie no mínimo 3 consultas com WHERE;
--1
select * from pessoa p where data_nascimento = '1998-06-18 00:00:00';
--2
select * from tarefa t where t.nome = 'Café';
--3
select * from pessoa p where p.cpf = '123.321.333-04';

--Crie no mínimo 3 consultas utilizando ORDER BY;
--1
select nome
from pessoa
order by nome asc;
--2
select nome
from tarefa
order by nome asc;
--3
select cpf
from pessoa
order by cpf asc;

-- Crie no mínimo 3 consultas utilizando AND e OR no mesmo comando;
--1
SELECT *
FROM pessoa
WHERE nome = 'Cesar' AND cpf = '123.321.333-01' or cpf = '123.321.333-02';
--2
SELECT *
FROM pessoa
WHERE nome = 'Maria' or cpf = '123.321.333-02' or cpf = '123.321.333-03' ;
--3
SELECT *
FROM tarefa
WHERE nome = 'Escola' AND descricao = 'Estudar p/ prova';

--Crie no mínimo 3 consultas utilizando COUNT;
--1
SELECT COUNT(*)
FROM pessoa p where p.nome = 'Cesar';
--2
SELECT COUNT(*)
FROM tarefa t where t.descricao = 'Fazer almoço' or t.nome = 'Café';
--3
SELECT COUNT(*)
FROM pessoa p where p.cpf = '123.321.333-01' or p.cpf = '123.321.333-03';

-- Crie no mínimo 3 consultas utilizando LIKE;
--1
select * from pessoa p where nome like 'C%';
--2
select * from tarefa t where t.nome like 'Café';
--3
select * from pessoa p where p.cpf like '123.321.333-04';

-- Crie no mínimo 3 consultas com INNER JOIN;
--1
select
p.nome as "Nome da pessoa",
a.data_inicio as "Data de inicio"
from agenda a
inner join pessoa p on a.id_pessoa = p.id;
--2
select
p.nome as "Nome da pessoa",
t.nome as "Tarefa"
from agenda a
inner join pessoa p on a.id_pessoa = p.id
inner join tarefa t on a.id_tarefa = t.id;
--3
select
a.data_inicio as "Data de Inicio",
t.nome as "Tarefa"
from agenda a
inner join tarefa t on a.id_tarefa = t.id;

-- Crie no mínimo 3 VIEWS;
--1
CREATE VIEW pessoa_view AS
SELECT nome, cpf
FROM pessoa
WHERE cpf = '123.321.333-01';
--2
CREATE VIEW agenda_view AS
SELECT data_inicio, data_fim
FROM agenda
where data_inicio = '2025-10-01 07:00:00';
--3
CREATE VIEW tarefa_view AS
SELECT nome, descricao
FROM agenda
WHERE data_inicio = '2025-10-01 07:00:00';

-- Crie no mínimo 3 consultas utilizando GROUP BY.

select nome id_pessoa, pessoa
from pessoa
group by nome, pessoa
order by id_pessoa asc;

select nome id_tarefa, tarefa
from tarefa
group by id_tarefa, tarefa
order by id_tarefa asc;

select data_inicio, agenda
from agenda
group by id, agenda
order by id asc;











