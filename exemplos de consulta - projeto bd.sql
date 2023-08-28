select e.Nome,count(c.Nome) as 'Qtd de Categoria por Editora' from editora e 
join livros l on e.CodEditora=l.CodEditora join categoria c on l.CodCategoria=c.CodCategoria group by e.Nome;

select r.Data_Reserva,count(c.Nome) as 'Qtd de Reservas por Dia' from reservas r join livros l on r.CodLivro=l.CodLivro 
join categoria c on l.CodCategoria=c.CodCategoria group by r.Data_Reserva;

select c.Nome,count(r.Data_Reserva) as 'Qtd de reservas dos Clientes' from reservas r 
join clientes c on r.CodCliente=c.CodCliente group by c.Nome order by count(r.Data_Reserva) desc;

select em.Data_Inicio,count(l.CodLivro) as 'Qtd de Livros emprestado por cada data' from emprestimos em join livros l on em.CodLivro=l.CodLivro group by em.Data_Inicio;
select f.Nome,count(em.CodFuncionario) as 'Qtd de Emprestimos realizado por cada funcionario' from emprestimos em join funcionarios f on em.CodFuncionario=f.CodFuncionario group by f.Nome;

select a.Nacionalidade,count(a.Nacionalidade) as 'Qtd de autores de por cada País' from autores a group by a.Nacionalidade order by count(a.Nacionalidade) desc;