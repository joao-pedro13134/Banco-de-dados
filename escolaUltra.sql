create database escola;
--Planilha/Tabela: Estudante
create table estudante(
	id serial primary key, --coluna de identificação.
	nome varchar(100), --com varchar o tamnho é variavel.
	matricula char(10), --se tirar o "var" é obrigatorio ter no minimo 10 e no maximo 10, por exemplo, se eu colocar "char(100)" seria obrigatorio ter 100 letras ou numeros.
	curso varchar(50),
	login varchar(20),
	senha varchar(15),
	data_nascimento date --recebe datas no formato ano->mes->dia
);

--Planilha/Tabela: Docente
create table docente(
	id serial primary key,
	nome varchar(100),
	matricula char(7),
	unidade_curricular varchar(20),
	login varchar(20)
);

alter table estudante add id_docente int;

alter table estudante add foreign key(id_docente) references docente(id);

alter table docente add column senha varchar(20);

insert into docente(nome, matricula, unidade_curricular, login, senha)
values('Débora', '13040-0', 'Banco de Dados', 'ddsouza', '123456'),
('Carlos', '21345-8', 'React', 'carlos', '456231'),
('Felipe', '45785-6', 'Redes', 'felipe', '789554'),
('Roni', '12565-6', 'Lógica de Prog', 'roni', '444455'),
('Pedro', '22231-6', 'Infraestrutura', 'pedro', '001222');

insert into estudante(nome, matricula, curso, login, senha, data_nascimento, id_docente)
values('amanda', '1236547896', 'Banco de Dados', 'amanda', '123', '1990-09-05', 1),
('Bruna', '1236547897', 'Banco de Dados', 'bruna', '123', '1990-09-05', 1),
('Carlos', '3151425612', 'Redes', 'carlos', '123', '1990-09-05', 2),
('João', '9368541089', 'Redes', 'joao', '123', '1990-09-05', 2),
('Ana', '0684938609', 'Logica de Pro', 'ana', '123', '1990-09-05', 3),
('Luis', '9874562789', 'Logica de Prog', 'luis', '123', '1990-09-05', 3),
('Ronaldo', '8902456525', 'React', 'ronaldo', '123', '1990-09-05', 4),
('Pedro', '8884234569', 'React', 'pedro', '123', '1990-09-05', 4),
('Lele', '9994678189', 'Infraestrutura', 'lele', '123', '1990-09-05', 5),
('Rogerio', '9877864515', 'Infraestrutura', 'rogerio', '123', '1990-09-05', 5);

--seleciona todas as colunas da tabela docente.
select * from docente;

--seleciona somente a coluna nome da tabela docente.
select nome from docente;

--seleciona as colunas nomes e matricula da tabela docente.
select nome, matricula from docente;

--seleciona todas as colunas da tabela docente onde a unidade curricular é igual a Banco de Dados.
select * from docente where unidade_curricular = 'Banco de Dados';
--seleciona todas as colunas da tabela docente onde a unidade curricular começa com B.
select * from docente where unidade_curricular like 'B%';
--seleciona todas as colunas da tabela estudante onde a data de nascimento é igual a 1990-09-05.
select * from estudante where data_nascimento = '1990-09-05';
--seleciona todas as colunas da tabela docente onde a letra "a" se encontra no final da palavra.
select * from docente where unidade_curricular like '%a';
--seleciona todas as colunas da tabela docente onde a letra "a" se encontra no meio da palavra.
select * from docente where unidade_curricular like '%a%';
--Após colocar o "d" após o nome da unidade exemplo: "docente d where d.unidade_curricular".
select * from docente d where d.unidade_curricular like '%a%';
--seleciona o nome do estudante e o nome do docente.
select 	e.nome as"nome do estudante", d.nome as"nome do docente" from estudante e inner join docente d on d.id = e.id_docente;

