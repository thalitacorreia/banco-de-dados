-- apagando banco de dados se existir
drop database dbpadaria;
-- criando banco de dados 
create database dbpadaria;
-- acessar o banco de dados
use dbpadaria;
--criando as tabelas no banco de dados
 
create table tbClientes (
codCli int not null auto_increment,
nome varchar (100) not null,
cpf char (14) not null unique,
email varchar (100) unique,
primary key (codCli));
 
create table tbFornecedores(
codForn int not null auto_increment,
nome varchar(100),
email varchar(100),
telCel char(10),
primary key(codForn));

insert into tbFornecedores(nome, email,telCel)
	values('cookies ck', 'ck@cookie.com.br', '99765-9863');
	insert into tbFornecedores(nome, email,telCel)
	values('donuts dt', 'dt@donuts.com.br', '998642-7542');
 
create table tbFuncionarios(
codFunc int not null auto_increment,
nome varchar(100),
email varchar(100),
telCel char(10),
dataNasc datetime,
salario decimal(9,2) default 0 check(salario >= 0),
sexo char(1) default "F" check(sexo in("F","M")),
codGen int not null,
primary key(codFunc));

insert into tbFuncionarios(nome, email,telCel, dataNasc, salario, sexo)
	values('Maria da Penha Rodrigues',
	'97538-8629', '1972/09/01', 2000.35, 'F');

 
create table tbUsuarios(
codUsu int not null auto_increment,
nome varchar(50) not null,
senha varchar(12) not null,
codFunc int not null,
primary key(codUsu),
foreign key(codFunc)references tbFuncionarios(codFunc)
);

create table tbProdutos(
codProd int not null auto_increment,
descricao varchar(100),
quantidade int,
preco decimal(9,2),
dataVal datetime,
lote char(10),
codForn int not null,
primary key(codProd),
foreign key(codForn)references tbFornecedores(codForn));
 
create table tbVendas(
codVend int not null auto_increment,
dataVend date,
horaVend time,
quantidade decimal(9,2) default 0 check(quantidade >=0),
valor decimal(9,2) default 0 check (valor>=0),
codProd int not null,
codUsu int not null,
codCli int not null,
primary key (codVend),
foreign key (codProd) references tbProdutos(codProd),
foreign key (codUsu)references tbUsuarios(codUsu),
foreign key (codCli)references tbClientes(codCli));
 
-- visualizando as tabelas
show tables;
-- visualizando a estrutura das tabelas
desc tbGenero;
desc tbUsuarios;
desc tbFornecedores;
desc tbFuncionarios;
desc tbProdutos;
desc tbClientes;
desc tbVendas;
 
--Inserindo registros nas tabelas
 
	insert into tbClientes(nome,cpf,email)
	values('Mariana','443.406.878-47','marianasorrochedelima@gmail.com');
	insert into tbClientes(nome,cpf,email)
	values('Kaique','584.632.245-69','seilalaasei123@gmail.com');

	insert into tbFornecedores(nome, email,telCel)
	values('cookies ck', 'ck@cookie.com.br', '99765-9863');
	insert into tbFornecedores(nome, email,telCel)
	values('donuts dt', 'dt@donuts.com.br', '998642-7542');

	insert into tbFuncionarios(nome, email,telCel, dataNasc, salario, sexo)
	values('Maria da Penha Rodrigues',
	'97538-8629', '1972/09/01', 2000.35, 'F', '1');

	insert into tbFuncionarios(nome, email,telCel, dataNasc, salario, sexo)
	values('Rogério Oliveira',
	'97098-1456', '1998/10/01', 2000.35, 'M', '2');
		
		


-- Visualizando os registros nas tabelas
select * from tbClientes;
select * from tbFornecedores;
select * from tbFuncionarios;
select * from tbUsuarios;
