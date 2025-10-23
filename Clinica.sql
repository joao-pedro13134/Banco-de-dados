--Clínica Veterinária
create database clinica;

create table animal(
   id serial primary key,
   nome varchar(100),
   especie varchar(20),
   raca varchar(20),
   idade int,
   infos_medicas text
);

create table dono(
   id serial primary key,
   nome_completo varchar(100),
   cpf char(11),
   telefone varchar(14)
);

--Crie a coluna id_endereco como foreign key na tabela dono
alter table dono add column id_endereço int;

alter table dono
add foreign key(id_endereço)
references endereco(id);

create table consulta(
   id serial primary key,
   data_hora timestamp,
   obs_medicas text
);

--Crie a coluna id_animal como foreign key na tabela consulta
alter table consulta add column id_animal int;

alter table consulta
add foreign key(id_animal)
references animal(id);

--Crie a coluna id_veterinario como foreign key na tabela consulta
alter table consulta add column id_veterinario int;

alter table consulta
add foreign key(id_veterinario)
references veterinario(id);

create table veterinario(
   id serial primary key,
   nome varchar(100),
   crmv char(13),
   especializacao text,
   jornada_diaria_horas int
);

create table endereco(
   id serial primary key,
   cep char(9),
   logradouro varchar(100),
   localidade varchar(50),
   complemento varchar(255),
   numero int,
   bairro varchar(50),
   uf char(2),
   referencia varchar(255)
);

--INSERT na tabela animal
INSERT INTO animal (nome, especie, raca, idade, infos_medicas) VALUES
('Rex', 'Cachorro', 'Pitbull', 5, 'Alergia a picadas de insetos'),
('Luna', 'Gato', 'Siamês', 3, 'Nenhuma condição médica conhecida'),
('Toby', 'Cachorro', 'Labrador', 7, 'Problema no quadril esquerdo'),
('Mia', 'Gato', 'Persa', 4, 'Problemas respiratórios'),
('Bolt', 'Cachorro', 'Beagle', 2, 'Sem problemas médicos');

--INSERT na tabela dono
INSERT INTO dono (nome_completo, cpf, telefone, id_endereco) VALUES
('Carlos Silva', '12345678901', '(11) 91234-5678', 1),
('Ana Costa', '98765432100', '(21) 99876-5432', 2),
('Pedro Oliveira', '11223344556', '(31) 98765-4321', 3),
('Mariana Souza', '55667788999', '(41) 99876-5432', 4),
('João Pereira', '66778899000', '(61) 98765-4321', 5);

--INSERT na tabela consulta
INSERT INTO consulta (data_hora, obs_medicas, id_animal, id_veterinario) VALUES
('2025-10-21 10:00:00', 'Consulta de rotina', 1, 1),
('2025-10-21 11:00:00', 'Vacinação antirrábica', 2, 2),
('2025-10-21 14:00:00', 'Consulta devido a dor nas patas', 3, 3),
('2025-10-21 15:00:00', 'Acompanhamento respiratório', 4, 4),
('2025-10-21 16:00:00', 'Exame de rotina', 5, 5);

--INSERT na tabela veterinario
INSERT INTO veterinario (nome, crmv, especializacao, jornada_diaria_horas) VALUES
('Dr. Roberto Almeida', '12345-SP', 'Clínico Geral', 8),
('Dra. Helena Silva', '67890-RJ', 'Dermatologia Veterinária', 6),
('Dr. Marcos Pereira', '13579-MG', 'Ortopedia Veterinária', 7),
('Dra. Fernanda Costa', '24680-PR', 'Cardiologia Veterinária', 7),
('Dr. Felipe Souza', '54321-BA', 'Cirurgia Veterinária', 9);

--INSERT na tabela endereço
INSERT INTO endereco (cep, logradouro, localidade, complemento, numero, bairro, uf, referencia) VALUES
('01000-000', 'Rua das Flores', 'São Paulo', 'Apartamento 101', 50, 'Centro', 'SP', 'Próximo ao banco'),
('20000-000', 'Avenida Brasil', 'Rio de Janeiro', 'Bloco B, apto 302', 80, 'Copacabana', 'RJ', 'Perto da praia'),
('30000-000', 'Rua do Sol', 'Belo Horizonte', 'Casa com varanda', 120, 'Savassi', 'MG', 'Próximo à praça principal'),
('40000-000', 'Avenida Sete de Setembro', 'Curitiba', 'Sobrado com garagem', 200, 'Centro', 'PR', 'Perto do hospital'),
('50000-000', 'Rua das Acácias', 'Brasília', 'Casa térrea', 70, 'Asa Norte', 'DF', 'Em frente ao shopping');

--Crie 5 consultas com SELECT
--1
select nome from veterinario;
--2
select raca from animal;
--3
select nome from dono;
--4
select data_hora from consulta;
--5
select logradouro from endereco;

--Crie 5 consultas com WHERE
--1
select * from endereco e where e.cep = '01000-000';
--2
select * from veterinario v where v.nome = 'Dra.%';
--3
select * from consulta c where c.obs_medicas like 'Consulta de rotina';
--4
select * from dono d where d.telefone like '(11)%';
--5
select * from animal a where a.raca = 'Pitbull';

-- Crie 3 consultas utilizando ORDER BY
--1
select nome
from veterinario
order by nome asc;
--2
select localidade
from endereco
order by localidade;
--3
select *
from animal
order by raca;

--Crie 3 consulta utilizando AND e OR
--1
SELECT *
FROM animal
WHERE especie = 'Cachorro' AND idade > 2;
--2
SELECT *
FROM endereco
WHERE localidade = 'São Paulo' or bairro = 'Centro';
--3
SELECT *
FROM animal
WHERE especie = 'Cachorro' AND idade > 2;

--Crie 3 consulta utilizando COUNT
--1
SELECT COUNT*
FROM consulta;
--2
SELECT COUNT*
FROM animal a where a.raca = 'Pitbull';
--3
SELECT COUNT*
FROM endereco e where e.cep > '01000-000';

--Crie 5 consultas utilizando LIKE
--1
select * from animal a where a.raca like 'Pit%';
--2
select * from consulta c where c.obs_medicas like 'Consulta de rotina';
--3
select * from veterinario v where v.nome like 'Dr.%';
--4
select * from dono d where d.telefone like '(11)%';
--5
select * from endereco e where e.cep like '01000-000';

--Crie 5 consultas com INNER JOIN
--1
select
a.nome as "Nome do Animal",
c.data_hora as "Dia/Hora da consulta"
from consulta c
inner join animal a on c.id_animal = a.nome;
--2
select
v.nome as "Nome do Dr(a).",
c.data_hora as "Dia/Hora da consulta"
from consulta c
inner join veterinario v on c.id_veterinario = v.nome;
--3
select
a.nome as "Nome do Animal",
d.nome as "Dono"
from dono d
inner join animal a on d.id_animal = a.nome;
--4
select
e.nome as "Rua/Logradouro",
d.nome as "Dono"
from dono d
inner join endereco e on d.id_endereco = e.nome;
--5
select
a.nome as "Nome do Animal",
c.data_hora as "Dia/Hora da consulta"
from consulta c
inner join animal a on c.id_animal = a.nome;

--Crie 5 VIEWS
--1
CREATE VIEW veterinario_view AS
SELECT nome, crmv
FROM veterinario
WHERE jornada_diaria_horas = 7;
--2
CREATE VIEW animal_view AS
SELECT nome, raca
FROM animal;
--3
CREATE VIEW consulta_view AS
SELECT data_hora, obs_medicas
FROM consulta
WHERE data_hora < '2025-10-22';
--4
CREATE VIEW dono_view AS
SELECT nome, logradouro, localidade
FROM dono;
--5
CREATE VIEW endereco_view AS
SELECT localidade, bairro
FROM endereco;