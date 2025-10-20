create database evento;

create table dados_evento(
   id serial primary key,
   descricao varchar(255),
   nome varchar(255)
);
create table agenda(
   id serial primary key,
   data_inicio timestamp,
   data_fim timestamp
);
create table pessoa(
   id serial primary key,
   nome varchar(255),
   cpf char(14)
   
);
--adicionando id_pessoa a evento
alter table agenda add column id_pessoa int;
--adicionando id_evento a agenda
alter table agenda add column id_evento int;
--foreign key 1
alter table agenda add foreign key (id_evento) references dados_evento(id);
--foreign key 2
alter table agenda add foreign key (id_pessoa) references pessoa(id);
--insert 1
insert into dados_evento (descricao, nome)
values('Evento sobre I.A', 'I.A'),
    ('Evento sobre Luta de robos', 'MMROBOTS'),
    ('Evento sobre programação', 'Programação do 0 ao 1'),
    ('Evento sobre automação', 'Automação'),
    ('Evento sobre modelagem', 'Modelagem');
--insert 2
insert into agenda (data_inicio, data_fim)
values('2025-10-25', '2025-10-27'),
    ('2025-10-25', '2025-11-10'),
    ('2025-11-01', '2025-11-15'),
    ('2025-11-02', '2025-11-06'),
    ('2025-12-01', '2025-12-07');
--insert 3
insert into pessoa (nome, cpf)
values('João', '635 214 658 97'),
    ('Natalia', '521 874 168 98'),
    ('Pedro', '514 145 145 48'),
    ('Juca', '124 325 698 87'),
    ('Luciana', '986 745 632 21');
--select 1
select nome from pessoa;
--select 2
select nome from dados_evento;
--select 3
select data_inicio from agenda;
--select/from/where 1
select * from pessoa where nome = 'João';
--select/from/where 2
select * from agenda where data_inicio = '2025-10-25';
--select/from/where 3
select * from dados_evento where nome = 'I.A';
--order by
select nome
from pessoa
order by nome asc;
--and
select *
from dados_evento
where nome = 'I.A' and descricao like 'Evento s%';
--count
select count (*)
from pessoa;
--like 1
select * from pessoa where nome like 'J%';
--like 2
select * from dados_evento where nome like 'I.%';
--inner join
select d.nome as "Nome pessoa", b.nome as "Nome evento"
from pessoa d
inner join dados_evento b on b.id = d.id;
--views 1
create view eventos_desc as
select nome, descricao
from dados_evento
where nome = 'I.A';
--views 2
create view pessoa_desc as
select nome, cpf
from pessoa
where nome = 'João';
--views 3
create view agenda_desc as
select data_inicio, data_fim
from agenda
where data_inicio = '2025-10-25';