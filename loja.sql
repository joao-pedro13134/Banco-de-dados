--Loja de Roupas

	--vendas int,

);
create table produto(
	id seria primary key,
	nome varchar(30),
	preco numerico(5,2),
	quantidade int,
	cor varchar(20),
	tamanho varchar(3),
	
	--categoria
);

create table categoria(
	id seria primary key,
	nome varchar(30),
	
);

create table cliente(
	id seria primary key,
	nome varchar(30),
	email varchar(50),
	telefone varchar(14),
	
);

create table venda(
	id seria primary key,
	data_hora timestamp,
	forma_pagamento varchar(10),
	--produto
	--atendente
);

create table atendente(
	id seria primary key,
	nome varchar(100),
	cpf char(11),
		
);