CREATE database biblioteca;
--Biblioteca escolar
create table livro(
	id serial primary key,
	titulo varchar(100),
	autor varchar(50),
	editora varchar(20),
	genero varchar(15),
	estado_conservacao varchar(50),
	quantidade_copias int
);

create table pessoa(
	id serial primary key,
	nome_completo varchar(100),
	matricula varchar(10),
	email varchar(50),
	telefone varchar(15) --(24) 99839-9530
);
create table emprestimo(
	id serial primary key,
	data_retirada timestamp,
	data_devolucao timestamp,
	estado_conservacao varchar(10)
	);

alter table emprestimo add column id_pessoa int;
alter table emprestimo add column id_livro int;
alter table emprestimo add foreign key (id_pessoa) references pessoa(id);
alter table emprestimo add foreign key (id_livro) references livro(id);
