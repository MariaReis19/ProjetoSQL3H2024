-- apagando banco de dados
drop database dbcantina;

-- criando banco de dados
create database dbcantina;

-- acessando banco de dados
use dbcantina;

-- criando as tabelas
create table tbFuncionarios(
codFunc int not null auto_increment,
nome varchar(100) not null,
email varchar(100) unique,
cpf char(14) not null unique,
sexo char(1) default 'F' check(sexo in('F','M')),
salario decimal(9,2) default 0 check(salario >=0),
nascimento date,
telCelular char(10),
primary key(codFunc));

create table tbFornecedores(
codForn int not null auto_increment,
nome varchar(100) not null,
email varchar(100) not null,
cnpj char(18) not null unique,
primary key(codForn));

create table tbClientes(
codCli int not null auto_increment,
nome varchar(100) not null,
email varchar(100),
telCelular char(10),
primary key(codCli));

create table tbUsuarios(
codUsu int not null auto_increment,
nome varchar(25) not null unique,
senha varchar(10) not null,
codFunc int not null,
primary key(codUsu),
foreign key(codFunc)references tbFuncionarios(codFunc));

create table tbProdutos(
codProd int not null auto_increment,
descricao varchar(100),
quantidade int,
valor decimal(9,2),
validade date,
dataEntrada date,
horaEntrada time,
codForn int not null,
primary key(codProd),
foreign key(codForn) references tbFornecedores(codForn)
);

create table tbVendas(
codVenda int not null auto_increment,
dataVenda date,
horaVenda time,
quantidade int,
codUsu int not null,
codCli int not null,
codProd int not null,
primary key(codVenda),
foreign key(codUsu)references tbUsuarios(codUsu),
foreign key(codCli)references tbClientes(codCli),
foreign key(codProd)references tbProdutos(codProd));

-- visualizando a estrutura das tabelas
desc tbFuncionarios;
desc tbFornecedores;
desc tbClientes;
desc tbUsuarios;
desc tbProdutos;
desc tbVendas;

-- inserindo registros nas tabelas

insert into tbFuncionarios(nome,email,cpf,sexo,salario,
	nascimento,telCelular)values('Amarildo Santiago',
	'amarildo@hotmail.com','111.125.248-88','M',
	1500.50,'1999/06/25','95842-8541');
insert into tbFuncionarios(nome,email,cpf,sexo,salario,
	nascimento,telCelular)values('Regina Miranda',
	'regina.miranda@hotmail.com','222.521.528-89','F',
	2250.50,'2001/08/15','98536-4569');

insert into tbFornecedores(nome,email,cnpj)
	values('Armarinhos Fernandez',
		'fernandez@gmail.com','25.258.152.0001/25');
insert into tbFornecedores(nome,email,cnpj)
	values('Casa das Pamonhas',
		'casaPamonhas@hotmail.com.com','52.852.251.0001/52');

insert into tbClientes(nome,email,telCelular)
	values('Julia Maria Candida','julia.mcandida@yahoo.com',
		'98526-5241');
insert into tbClientes(nome,email,telCelular)
	values('Marta Rodrigues','marta.rodrigues@hotmail.com',
		'96258-1452');
insert into tbClientes(nome,email,telCelular)
	values('Leandro Gabriel','leandro.gabriel@gmail.com',
		'97423-5417');

insert into tbUsuarios(nome,senha,codFunc)
	values('amarildo.santiago','123456',1);
insert into tbUsuarios(nome,senha,codFunc)
	values('regina.miranda','654321',2);

insert into tbProdutos(descricao,quantidade,valor,validade,
	dataEntrada,horaEntrada,codForn)
	values('Mesa martinele',15,850.00,'2030/06/25','2024/08/16','19:50:55',1);


insert into tbProdutos(descricao,quantidade,valor,validade,
	dataEntrada,horaEntrada,codForn)
	values('Pamonhas maravilha',150,2.50,'2024/08/20','2024/08/16','19:53:55',2);

insert into tbProdutos(descricao,quantidade,valor,validade,
	dataEntrada,horaEntrada,codForn)
	values('Bolo de ameixa',20,33.00,'2024/08/19','2024/08/16','19:55:00',2);	

insert into tbProdutos(descricao,quantidade,valor,validade,
	dataEntrada,horaEntrada,codForn)
	values('Cadeira',50,1550.00,'2030/08/16','2024/08/16','20:00:00',1);


insert into tbVendas(dataVenda,horaVenda,quantidade,codUsu,
	codCli,codProd)
	values('2024/08/16','19:57:52',2,2,3,4);
insert into tbVendas(dataVenda,horaVenda,quantidade,codUsu,
	codCli,codProd)
	values('2024/08/16','20:01:52',10,1,2,3);
insert into tbVendas(dataVenda,horaVenda,quantidade,codUsu,
	codCli,codProd)
	values('2024/08/16','20:03:52',13,2,1,1);	

-- visualizando os registros das tabelas
select * from tbFuncionarios;
select * from tbFornecedores;
select * from tbClientes;
select * from tbUsuarios;
select * from tbProdutos;
select * from tbVendas;
---- alterando os produtos das tabelas

update tbProdutos set descricao = 'Coxinha', valor = 7.00
	where codProd = 1;
update tbProdutos set descricao = 'Pastel de queijo', valor = 10.00
	where codProd =2;
----- visualizando depois das alterações

select * from tbProdutos;
