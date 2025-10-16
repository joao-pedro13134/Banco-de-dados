--Planilha/Tabela: Estudante
create table estudante(
	id serial primary key, --coluna de identificação.
	nome varchar(100), --com varchar o tamnho é variavel.
	matricula char(10), --se tirar o "var" é obrigatorio ter no mino 10 e no maximo 10, por exemplo, se eu colocar "char(100)" seria obrigatorio ter 100 letras ou numeros.
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
	login varchar(20),
	 
	

);