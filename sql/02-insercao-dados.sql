#Inserção de Dados Fictícios nas tabelas
  
INSERT INTO biblioteca.categorias(Codigo_Categoria, Descricao)
	VALUES 
		(1,'Romance'),
		(2,'Ficção'),
		(3,'Fantasia'),
		(4,'Suspense'),
		(5,'Mistério');
        
INSERT INTO biblioteca.autores(Codigo, Nome, Nacionalidade)
	VALUES 
		(1,'Machado de Assis', 'Brasileiro'),
		(2,'Jane Austen', 'Britânica'),
		(3,'George Orwell', 'Britânico'),
		(4,'J. R. Tolkien', 'Britânico'),
		(5,'Agatha Christie', 'Britânica');
        
INSERT INTO biblioteca.usuarios(Matricula, Nome, Telefone)
	VALUES 
		(1001,'Ana Beatriz Souza', '62111111111'),
		(1002,'Carlos Eduardo Lima', '62222222222'),
		(1003,'Mariana Oliveira', '62333333333'),
		(1004,'João Pedro Santos', '62444444444'),
		(1005,'Fernanda Costa', '62555555555');

INSERT INTO biblioteca.livros(ISBN, Titulo, Ano, Editora, Fk_CodigoCategoria)
	VALUES 
		(10001,'Dom Casmurro', 1899, 'Principis',1),
		(10002,'Orgulho e Preconceito', 1813, 'Martin Claret',1),
		(10003,'1984', 1949, 'Companhia das Letras',2),
		(10004,'O Hobbit', 1937, 'HarperCollins',3),
		(10005,'O Assassino de Roger Ackroyd', 1926, 'HarperCollins',4);
        
INSERT INTO biblioteca.livros_autores(FK_ISBN,FK_Codigo)
	VALUES 
		(10001, 1),
		(10002, 2),
        (10003, 3),
        (10004, 4),
        (10005, 5),
        (10001, 3),
        (10004, 2);

INSERT INTO biblioteca.locacoes(Codigo_Locacao, FK_ISBN, FK_Matricula, DT_Locacao, DT_Devolucao)
	VALUES 
		(1,10001, 1001, '2026-09-01', '2026-09-08'),
		(2,10003, 1002, '2026-09-03', '2026-09-11'),
		(3,10004, 1003, '2026-09-05', '2026-09-14'),
		(4,10002, 1004, '2026-09-10', NULL),
		(5,10005, 1005, '2026-09-15', NULL);
