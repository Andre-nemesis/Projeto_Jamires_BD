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
insert into categoria(Nome)values('Auto Ajuda'),('Biografia'),('Ciências Sociais'),('Cientifico'),('Economia'),('Ficção'),
('Filosofia'),('Infantil'),('Religião e Espiritualidade'),('Romance'),('Turismo e Viagem'),('Fantasia');

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

#inserindo autores
insert into autores(Nome,Nacionalidade)values('Selma Blair','Estados Unidos'),('Dndapani','Indiano'),('Joe Vitale','Estados Unidos'),('Gislene Isquierdo','Brasil'),
('Rhonda Byrne','Australia'),('Marie-Hélène Fraïssé','França'),('Nick McDonell','Estados Unidos'),('Tove Ditlevsen','Dinamarca'),('Teresa Montero','Brasil'),
('Benjamin Hall','Estados Unidos'),('Djamila Ribeiro','Brasil'),('Julie Schumacher','Estados Unidos'),('Pedro Lemebel','Chile'),('Bénédicte Delorme Montini','França'),
('Francesco Albernoni','Itália'),('David Eagleman','Estados Unidos'),('Howard Gardner','Estados Unidos'),('Ernst Mayr','Alemanha'),('Michio Kaku','Estados Unidos'),
('Sharon Moalen','Canadá'),('Adriano Silva','Brasil'),('Jeremy Gutsche','Estados Unidos'),('Austin Kleon','Estados Unidos'),('Morten T. Hansen','Noruega'),
('Jen Sincero','Estados Unidos'),('Anne Rice','Estados Unidos'),('Erico Verissimo','Brasil'),('George Orwell','Reino Unido'),('Jorge Amado','Brasil'),
('William Golding','Reino Unido'),('Sêneca','Itália'),('Byung-Chul Han','Coreia'),('Zygmount Bauman','Polonia'),('Mario Sergio Cortella','Brasil'),
('Nicolau Maquiavel','Itália'),('Laura van Boekel Cheola','Brasil'),('Mathilda Kóvak','Brasil'),('Angela Lago','Brasil'),('Alexandre Rampazo','Brasil'),('Amy Tan','China'),
('Nilton Bonder','Brasil'),('Thich Nhat Hanh','Vietnã'),('Kathleen McGowan','Estados Unidos'),('Jonathan Black','Reino Unido'),('Deepak Chopra','Índia'),
('Carlos Fuentes','México'),('M. L. Stedman','Austrália'),('Gabrielle Zevin','Estados Unidos'),('Lucy Clarke','Reino Unido'),('Guillermo del Toro','México'),
('Roberto Arlt','Argentina'),('Peter Schneider','Áustria'),('Frances Mayes','Itália'),('Tony Horwitz','Estados Unidos'),
('Brandon Mull','Estados Unidos'),('Melissa Marr','Estados Unidos'),('Lucia Troisi','Estados Unidos'),('George R. R. Martin','Estados Unidos'),('Robert Jordan','Estados Unidos');

#inserindo livros
insert into livros(ISBN,Titulo,CodAutor,CodCategoria,CodEditora)values('9780593082775','Mean Baby',1,1,1),('9786584954144','O Poder do Foco Inabalável',2,1,2),
('9788532522757','A Chave',3,1,3),('9788542223217','Mapa da Persuasão',4,1,4),('9780063078482','The Greatest Secret',5,1,5),('9782226438270',"Alaska, l'ultime frontière",6,2,7),
('9780593316788','Quiet Street',7,2,6),('9788535934977','Trilogia de Copenhagen',8,2,2),('9786555321777','À Procura da Própia Coisa',9,2,4),('9780063309661','Saved',10,2,1),
('9788595300408','O que É Lugar de Fala?',11,3,2),('9780385550123','The English Experience',12,3,6),('9786559791125','Poco Hombre',13,3,4),('9782073021700','La gloire du rap',14,3,3),
('‎978853251778','A Arte de Comandar',15,3,2),('978853253075','Cérebro: Uma Biografia',16,4,5),('9788550304083','Mentes Extraordinárias',17,4,5),('9788532523808','O Que é a Evolução',18,4,2),
('9788532522764','Mundos Paralelos',19,4,2),('9788532530332','Herança',20,4,4),('9788532529312','O Executivo Sincero',21,5,2),('9788532530363','Melhor e Mais Rápido',22,5,1),
('9788532530905','Mostre Seu Trabalho!',23,5,6),('9788532531179','Sucesso no Trabalho',24,5,7),('9788568696705','Você Pode Nadar em Dinheiro',25,5,6),('9788532528490','A Dádiva do Lobo',26,6,5),
('9788535906097','Olhai os Lírios do Campo',27,6,1),('9788535914849','1984',28,6,2),('9788535914061','Capitães da Areia',29,6,4),('9788556521224','Senhor das Moscas',30,6,3),
('9786555522891','Sobre a Brevidade da Vida',31,7,5),('9788532649966','Sociedade do Cansaço',32,7,6),('9786559790005','Modernidade Líquida',33,7,7),('9788542207415','Por Que Fazemos o Que Fazemos',34,7,1),
('9788572839044','O Príncipe',35,7,1),('9788562500008','A Bola, o Beto e a Bela',36,8,1),('9788532522320','A Caixa de Pandura',37,8,2),('9788532518057','A Casa do Bode e da Onça',38,8,3),
('9786589642022','A Cor de Coraline',39,8,4),('9786556810072','A Dama da Lua',40,8,5),('9786555323115','A Alma Imoral',41,9,6),('9788532523266','A Arte do Poder',42,9,6),('9788532525789','A Fonte dos Milagres',43,9,7),
('9788532529633','A História Sagrada',44,9,1),('8532519717','A Paz é o Caminho',45,9,2),('8532506747','A Campanha',46,10,3),('9788532528230','A Luz Entre Oceanos',47,10,4),
('9786555322873','Amanhã, Amanhã e Ainda Outro Amanhã',48,10,5),('9788532528827','As Irmãs e o Mar',49,10,6),('9788551002773','A Forma da Água',50,10,7),('9788532528667','Águas-Fortes Cariocas',51,11,1),
('9788532529671','Berlim, Agora',52,11,2),('9788532521392','Um Ano de Viagens',53,11,3),('9788532527165','Todos os Dias na Toscana',53,11,3),('9788532525413','Uma Longa e Estranha Viagem',54,11,4),
('9788579800665','A Ascensão da Estrela Vespertina',55,12,5),('9788532527769','A Guardiã',56,12,6),('8532520030','A Garota da Terra do Vento',57,12,7),('9788556510785','A Guerra dos Tronos',58,12,1),('9788580573619','O Olho do Mundo',59,12,2);

#inserindo emprestimos
insert into Emprestimos(Data_Inicio, Data_Fim, Valor_Multa, CodLivro, CodCliente, CodFuncionario) values ('2023-08-10', '2023-08-24', 0, 01, 16, 02), ('2023-08-11', '2023-08-25', 0, 02, 17, 02), 
('2023-08-12','2023-08-26', 0, 03, 18, 03), ('2023-08-15', '2023-09-29', 20, 04, 19, 03), ('2023-08-20', '2023-09-03', 20, 05, 20, 02), ('2023-09-02', '2023-09-16', 0, 06, 21, 02), ('2023-09-05', '2023-09-19', 20, 07, 22, 03),
('2023-09-07', '2023-09-21', 20, 08, 23, 03), ('2023-09-10','2023-09-24', 20, 09, 24, 02), ('2023-09-15', '2023-09-29', 0, 10, 25, 02), ('2023-09-18', '2023-10-02', 20, 11, 26, 02), ('2023-09-20', '2023-10-04', 0, 12, 27, 03),
('2023-09-25', '2023-10-09', 20, 13, 28, 03), ('2023-09-28', '2023-10-12', 0, 14, 29, 03), ('2023-08-15', '2023-08-29', 0, 15, 07, 02), ('2023-08-20', '2023-09-03', 0, 16, 08, 03), ('2023-08-25', '2023-09-08', 0, 17, 09, 02),
('2023-09-01', '2023-09-15', 0, 18, 09, 02), ('2023-09-02', '2023-09-16', 0, 19, 10, 02), ('2023-09-10', '2023-09-14', 0, 20, 11, 03), ('2023-08-05', '2023-08-19', 20, 21, 12, 03), ('2023-08-05', '2023-08-19', 20, 22, 13, 02),
('2023-08-07', '2023-08-21', 0, 23, 14, 02), ('2023-08-10', '2023-08-24', 0, 24, 15, 03);
