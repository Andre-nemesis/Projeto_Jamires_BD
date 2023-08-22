#Criando o Banco de Dados

drop database if exists SistemaBiblioteca;

create database SistemaBiblioteca;

use SistemaBiblioteca;

create table Autores(
CodAutor int auto_increment primary key,
Nome varchar(120) unique not null,
Nacionalidade varchar(50) default 'Brasil' not null
);

create table Categoria(
CodCategoria int auto_increment primary key,
Nome varchar(50) unique not null 
);

create table Editora(
CodEditora int auto_increment primary key,
Nome varchar(50) unique not null,
Pais varchar(40) not null default 'Brasil'
);

create table Livros(
CodLivro int auto_increment,
ISBN char(13) not null,
Titulo varchar(200) unique not null,
CodAutor int,
CodCategoria int,
CodEditora int,
constraint pkLivro primary key(CodLivro,ISBN),
constraint fkCategoria foreign key(CodCategoria) references Categoria (CodCategoria) on delete set null on update cascade,
constraint fkAutor foreign key(CodAutor) references Autores (CodAutor) on delete set null on update cascade,
constraint fkEditora foreign key(CodEditora) references Editora (CodEditora) on delete set null on update cascade
);

create table Clientes(
CodCliente int auto_increment primary key,
Nome varchar(100) unique not null,
Endereco varchar(60) not null,
Telefone char(12) unique
);

create table Funcionarios(
CodFuncionario int auto_increment primary key,
Nome varchar(100) unique not null,
Cargo varchar(50) not null,
Data_Contratacao date not null
);

create table Emprestimos(
CodEmprestimo int auto_increment primary key,
Data_Inicio date not null,
Data_Fim date not null,
Valor_Multa float,
CodLivro int,
CodCliente int,
CodFuncionario int,
constraint fkLivro foreign key(CodLivro) references Livros (CodLivro) on delete set null on update cascade,
constraint fkCliente foreign key(CodCliente) references Clientes (CodCliente) on delete set null on update cascade,
constraint fkFuncionarioEmprestimo foreign key(CodFuncionario) references Funcionarios (CodFuncionario) on delete set null on update cascade
);

create table Reservas(
CodReserva int auto_increment primary key,
Data_Reserva date not null,
CodLivro int,
CodCliente int,
CodFuncionario int,
constraint fkLivroReserva foreign key(CodLivro) references Livros (CodLivro) on delete set null on update cascade,
constraint fkClienteReserva foreign key(CodCliente) references Clientes (CodCliente) on delete set null on update cascade,
constraint fkFuncionarioReserva foreign key(CodFuncionario) references Funcionarios (CodFuncionario) on delete set null on update cascade
);

#Inserindo Dados

#inserindo dados na tabela editora
insert into editora(Nome,Pais)values('Alfred A. Knopf','Estados Unidos'),('Companhia das Letras','Brasil'),('Éditions Gallimard','França'),
('Rocco','Brasil'),('Planeta de Livros','Brasil'),('Haper Collins','Estados Unidos'),('Albin Michel','França');

#Inserindo dados na tabela categorias
insert into categoria(Nome)values('Religião e Espiritualidade'),('Ciências Sociais'),('Auto Ajuda'),('Filosofia'),('Ficção'),('Infantil'),
('Biografia'),('Romance'),('Economia'),('Turismo e Viagem'),('Cientifico'),('Fantasia');

#inserindo dados na tabela autores
#insert into autores(Nome,Nacionalidade)values();

#inserindo clientes
insert into clientes(Nome,Endereco,Telefone)values('Andre Silva Fernandesss','Rua Almeida Jorge','88983741385'),
('Guilherme Hernandes','Avenida Fernando Silva','85908739731'),('João Pedro Almeida','Rua Alencar','88998765875'),
('Leornado Oliveira','Avenida Krishe','11987986527'),('Kaike José','Rua Gourives','31928394571'),('Alessandra Benites','Travessa Antônio','84975256428'),
('Paulo Colaço de Pacheco','QE Área Especial','83997436324'),('Luna Wilma Cervantes','Rua Domingos Olímpio','82969548287'),('Bárbara Molina de Queirós','Avenida Almirante Maximiano','77987147121'),
('Ediane Liane de Aragão','Rua Maria Luísa','84984532576'),('Fernando Leo Sobrinho','Rua Arlindo Nogueira','75979635360'),('Emília Maria Dutra','Rua Serra de Bragança','88987285117'),
('João Simon Cruz','Avenida Esbertalina','32993724353'),('Estêvão Quico Ortiz','Avenida Almirante','69973608726'),('Mariana Molina da Costa','Avenida Governador José','69998884243'),
('César Abreu de Barros','Avenida Rio Branco','65982113887'),('Ivete Kátia Barreto','Praça da República','68980767153'),('Beto Aguiar Filho','Rua dos Carijós','63987302149'),
('Jack Samuel Soto de Vega','Avenida Tocantins','33996914883'),('Manuela Zenaide Beltrão','Rodovia Raposo Tavares','63992733361'),('Elizabeth Rosimeire Correia','Rua Frederico Moura','67972525994'),
('Diego Laerte Branco','Avenida Esbertalina Barbosa','96993831721'),('Cleberson Marciano de Faro','Rua da Imprensa','98972551724'),('José Leon Junior','Rua Cristiano Olsen','88992873443'),
('Breno Branco Filho','Avenida Desembargador Moreira','83999733536'),('Ketlin Corona Oliveira','Rua Carlos Augusto','82979888821'),('Rafaela Suzy Ferminiano','Rua Frederico Moura','87987961886'),
('Adônis Estrada de Ferreira','Rua Paracatu','96972115326'),('Isaías Duarte de Faria','Avenida Esbertalina Barbosa','88972256672'),('Evandro Ávila de Faria','Rua Tenente-Coronel','61988723666');

#inserindo funcionários
insert into Funcionarios(Nome,Cargo,Data_Contratacao)values('Marcos','Gerente','2000-09-16'),('Julia','Bibliotecário','2000-09-16'),
('Jonatas','Bibliotecário','2000-09-16'),('Pedro','Faxineiro','2000-09-16'),('Lucilene','Contadora','2000-09-16');

