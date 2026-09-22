#Criação do Banco de Dados
CREATE SCHEMA Biblioteca;

#Criação das Tabelas
##Criar Tabela Livros
CREATE TABLE biblioteca.livros(
	ISBN INT NOT NULL,
	Titulo VARCHAR(30) NOT NULL,
	Ano INT NOT NULL,
	Editora VARCHAR(20) NOT NULL,
	FK_CodigoCategoria INT NOT NULL,
	PRIMARY KEY (ISBN));

##Criar Tabela Autores
CREATE TABLE biblioteca.autores(
	Codigo INT NOT NULL,
	Nome VARCHAR(50) NOT NULL,
	Nacionalidade VARCHAR(20) NOT NULL,
	PRIMARY KEY (Codigo));

##Criar Tabela Categorias
CREATE TABLE biblioteca.categorias(
	Codigo_Categoria INT NOT NULL,
	Descricao VARCHAR(50) NOT NULL,
	PRIMARY KEY (Codigo_Categoria));

##Criar Tabela Usuários
CREATE TABLE biblioteca.usuarios(
	Matricula INT NOT NULL,
	Nome VARCHAR(50) NOT NULL,
	Telefone VARCHAR(11) NOT NULL,
	PRIMARY KEY (Matricula));

##Criar Tabela Relacionamento Livros_Autores
CREATE TABLE biblioteca.livros_autores(
	FK_ISBN INT NOT NULL,
	FK_Codigo INT NOT NULL,
	PRIMARY KEY (FK_ISBN, FK_Codigo));

##Criar Tabela Relacionamento Locações
CREATE TABLE biblioteca.locacoes(
	Codigo_Locacao INT NOT NULL,
	FK_ISBN INT NOT NULL,
	FK_Matricula INT NOT NULL,
	DT_Locacao DATE NOT NULL,
	DT_Devolucao DATE,
	PRIMARY KEY (Codigo_Locacao));

#Definição das chaves estrangeiras
##Definir relacionamento das FK em Livros_Categorias
ALTER TABLE biblioteca.livros
	ADD CONSTRAINT FK_LivrosCategorias
	FOREIGN KEY (FK_CodigoCategoria)
	REFERENCES biblioteca.categorias(Codigo_Categoria);

##Definir relacionamento das FK em Livros_Autores
ALTER TABLE biblioteca.livros_autores
	ADD CONSTRAINT FK_Livros_AutoresISBN
	FOREIGN KEY (FK_ISBN)
	REFERENCES biblioteca.livros(ISBN);

ALTER TABLE biblioteca.livros_autores
	ADD CONSTRAINT FK_LivrosAutoresCodigo
	FOREIGN KEY (FK_Codigo)
	REFERENCES biblioteca.autores(Codigo);

##Definir relacionamento das FK em Livros_Locacoes
ALTER TABLE biblioteca.locacoes
	ADD CONSTRAINT FK_LocacoesLivrosISBN
	FOREIGN KEY (FK_ISBN)
	REFERENCES biblioteca.livros(ISBN);

##Definir relacionamento das FK em Usuarios_Locacoes
ALTER TABLE biblioteca.locacoes
	ADD CONSTRAINT FK_LocacoesUsuariosMatricula
	FOREIGN KEY (FK_Matricula)
	REFERENCES biblioteca.usuarios(Matricula);
