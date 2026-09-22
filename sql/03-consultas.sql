#Consulta - comando para listar todos os usuários na biblioteca
SELECT * FROM biblioteca.usuarios;

#Consulta - comando para listar todos os livros da categoria Ficção
SELECT * FROM biblioteca.livros
	WHERE FK_CodigoCategoria = 2;
    
#Liste apenas o título e o ano de publicação de todos os livros
SELECT Titulo, Ano FROM biblioteca.livros;

#Liste os livros publicados antes do ano 1900.
SELECT * FROM biblioteca.livros
	WHERE Ano < 1900;

#Liste os livros publicados a partir do ano 1900.
SELECT * FROM biblioteca.livros
	WHERE Ano >= 1900;
    
#Liste os autores de nacionalidade Britânica.
SELECT * FROM biblioteca.autores
	WHERE Nacionalidade = 'Britânica';
    
#Liste as locações que ainda não foram devolvidas.
SELECT * FROM biblioteca.locacoes
	WHERE DT_Devolucao IS NULL;
    
#Liste as locações que já foram devolvidas.
SELECT * FROM biblioteca.locacoes
	WHERE DT_Devolucao IS NOT NULL;
    
#Liste os livros publicados entre 1900 e 1940.
SELECT * FROM biblioteca.livros
	WHERE Ano BETWEEN 1900 AND 1940;
    
#Liste os livros ordenados pelo ano de publicação, do mais antigo para o mais recente E do mais recente para o mais antigo..
SELECT * FROM biblioteca.livros
	ORDER BY Ano ASC;
    
SELECT * FROM biblioteca.livros
	ORDER BY Ano DESC;
    
#Liste os usuários em ordem alfabética pelo nome.
SELECT * FROM biblioteca.usuarios
	ORDER BY Nome ASC;
    
#Liste as locações ordenadas pela data de locação, da mais antiga para a mais recente.
SELECT * FROM biblioteca.locacoes
	ORDER BY DT_Locacao ASC;
    
#Liste o título de cada livro e o nome da sua categoria.
SELECT l.titulo, c.descricao AS categoria  
	FROM biblioteca.livros AS l, biblioteca.categorias AS c  
	WHERE l.FK_CodigoCategoria = c.Codigo_Categoria; 

#Liste o título dos livros e o nome dos respectivos autores.
SELECT l.titulo, a.nome AS autor
	FROM biblioteca.livros AS l, biblioteca.autores AS a, biblioteca.livros_autores AS la
    WHERE la.FK_ISBN = l.ISBN AND la.FK_Codigo = a.Codigo;
    
SELECT l.Titulo, a.Nome AS Autor
	FROM biblioteca.livros AS l
	JOIN biblioteca.livros_autores AS la
		ON la.FK_ISBN = l.ISBN
	JOIN biblioteca.autores AS a
		ON la.FK_Codigo = a.Codigo;

#Liste o nome dos usuários e os livros que eles alugaram.
SELECT u.nome AS Usuário, l.titulo AS Livro
	FROM biblioteca.usuarios AS u, biblioteca.livros AS l, biblioteca.locacoes AS lo
    WHERE u.Matricula = lo.FK_Matricula AND l.ISBN = lo.FK_ISBN;
    
SELECT u.nome AS Usuário, l.titulo AS Livro
	FROM biblioteca.usuarios AS u
    JOIN biblioteca.locacoes AS lo
		ON lo.FK_Matricula = u.Matricula
	JOIN biblioteca.livros AS l
		ON lo.FK_ISBN = l.ISBN;

#Liste o nome do usuário, o título do livro e a data da locação.
SELECT u.Nome AS Usuário, l.titulo AS Livro, lo.DT_Locacao
	FROM biblioteca.usuarios AS u
    JOIN biblioteca.locacoes AS lo
		ON u.Matricula = lo.FK_Matricula
	JOIN biblioteca.livros AS l
		ON l.ISBN = lo.FK_ISBN;

#Liste o título do livro, o nome do autor e a nacionalidade do autor.
SELECT l.Titulo AS Livro, a.Nome AS Autor, a.Nacionalidade
	FROM biblioteca.livros as l
	JOIN biblioteca.livros_autores AS la
		ON l.ISBN = la.FK_ISBN
	JOIN biblioteca.autores AS a
		ON a.Codigo = la.FK_Codigo;

#Liste o nome do usuário e a data de devolução do livro que ele alugou.
SELECT u.Nome AS Usuário, lo.DT_Devolucao AS Devolução
	FROM biblioteca.usuarios AS u
    JOIN biblioteca.locacoes AS lo
		ON u.Matricula = lo.FK_Matricula;

#Liste o título do livro e sua categoria, mas somente para livros da categoria Romance.
SELECT l.titulo AS Livro, c.descricao AS Categoria
	FROM biblioteca.livros AS l, biblioteca.categorias AS c
    WHERE l.FK_CodigoCategoria = c.Codigo_Categoria AND c.Descricao = 'Romance';
    
#Liste: nome do usuário; título do livro; nome do autor; data da locação. Tudo em uma única consulta.
SELECT u.nome AS Usuário, l.titulo AS Livro, a.nome AS Autor, lo.DT_Locacao
	FROM biblioteca.usuarios AS u, biblioteca.locacoes AS lo, biblioteca.livros AS l, biblioteca.autores AS a, biblioteca.livros_autores AS la
	WHERE u.Matricula = lo.FK_Matricula AND l.ISBN = lo.FK_ISBN AND a.Codigo = la.FK_Codigo AND l.ISBN = la.FK_ISBN;

#Liste: título do livro; categoria; autor; nacionalidade do autor.
SELECT l.titulo AS Livro, c.descricao AS Categoria, a.nome AS Autor, a.nacionalidade
	FROM biblioteca.livros AS l, biblioteca.categorias AS c, biblioteca.autores AS a, biblioteca.livros_autores AS la
    WHERE l.FK_CodigoCategoria = c.Codigo_Categoria AND la.FK_ISBN = l.ISBN and a.Codigo = la.FK_Codigo;
