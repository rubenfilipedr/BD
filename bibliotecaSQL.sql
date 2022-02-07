CREATE DATABASE IF NOT EXISTS LIVRARIA;

USE LIVRARIA;


DROP TABLE IF EXISTS GENERO_FAV, AUTOR_FAV, PERTENCE_A, TELEFONE, CLIENTE, FILME, LIVRO, GENERO, EDITORA, AUTOR;

CREATE TABLE AUTOR (
 Nome VARCHAR(64) NOT NULL,
 Sexo ENUM('M','F') NOT NULL,
 DataNascimento DATE NOT NULL,
 PRIMARY KEY(Nome)
);

INSERT INTO AUTOR(Nome, Sexo, DataNascimento)
VALUES
('Paula Hawkins', 'F', '1972-08-26'),
('Stephenie Meyer', 'F', '1973-12-24'),
('Rick Yancey', 'M', '1962-11-04'),
('Nicholas Sparks', 'M', '1965-12-31'),
('Roald Dahl', 'M', '1916-09-13'),
('Louisa May Alcott', 'F', '1832-11-29'),
('John Green', 'M', '1977-08-24'),
('Markus Zusak', 'M', '1975-06-23'),
('Becky Albertalli', 'F', '1982-11-17'),
('Isabel Stilwell', 'F', '1960-08-16'),
('Sophia de Mello Breyner', 'F', '1919-11-06'),
('Stephen King', 'M', '1947-09-21');



CREATE TABLE EDITORA (
 Nome VARCHAR(32) NOT NULL,
 AnoCriacao INT NOT NULL,
 PRIMARY KEY(Nome)
);

INSERT INTO EDITORA(Nome, AnoCriacao)
VALUES
('Riverhead Books', 1994),
('Little, Brown and Company', 1784),
('G. P. Putnams Sons', 1838),
('Grand Central Publishing', 2006),
('Warner Books', 2006),
('Jonathan Cape', 1921),
('Roberts Brothers', 1857),
('E. P. Dutton', 1852),
('Picador', 1972),
('HarperCollins', 1990),
('Manuscrito', 2014),
('Porto Editora', 1944),
('Doubleday', 1897);



CREATE TABLE GENERO (
 Nome VARCHAR(32) NOT NULL,
 PRIMARY KEY(Nome)
);

INSERT INTO GENERO(Nome)
VALUES
('Aventura'),
('Biográfico'),
('Científico'),
('Fantasia'),
('Ficção Cientifica'),
('Horror'),
('Infantojuvenil'),
('Ação'),
('Drama'),
('Suspense'),
('Romance'),
('Mistério');



CREATE TABLE LIVRO (
 Titulo VARCHAR(64) NOT NULL,
 Paginas INT NOT NULL,
 Lancamento DATE NOT NULL,
 Autor VARCHAR(64) NOT NULL,
 Editora VARCHAR(32) NOT NULL,
 DataInicio DATE DEFAULT NULL,
 DataFim DATE DEFAULT NULL,
 PRIMARY KEY(Titulo),
 FOREIGN KEY(Autor) REFERENCES AUTOR(Nome),
 FOREIGN KEY(Editora) REFERENCES EDITORA(Nome)
);

INSERT INTO LIVRO(Titulo, Paginas, Lancamento, Autor, Editora, DataInicio, DataFim)
VALUES
('A Rapariga no Comboio', 336, '2015-01-13', 'Paula Hawkins', 'Riverhead Books', NULL, NULL),
('Crepúsculo', 498, '2005-10-05', 'Stephenie Meyer', 'Little, Brown and Company', NULL, NULL),
('A 5ª Vaga', 457, '2013-05-07', 'Rick Yancey', 'G. P. Putnams Sons', NULL, NULL),
('A Melodia do Adeus', 405, '2009-09-01', 'Nicholas Sparks', 'Grand Central Publishing', '2021-02-04', '2021-05-04'),
('Querido John', 263, '2007-10-07', 'Nicholas Sparks', 'Warner Books', NULL, NULL),
('Matilda', 232, '1988-10-01', 'Roald Dahl', 'Jonathan Cape', NULL, NULL),
('Mulherzinhas', 104, '1868-01-01', 'Louisa May Alcott', 'Roberts Brothers', '2021-03-13', '2021-06-13'),
('A Culpa é das Estrelas', 314, '2012-01-11', 'John Green', 'E. P. Dutton', NULL, NULL),
('A Menina que Roubava Livros', 592, '2005-09-01', 'Markus Zusak', 'Picador', '2021-04-01', '2021-05-01'),
('Simon vs. the Homo Sapiens Agenda', 303, '2015-04-07', 'Becky Albertalli', 'HarperCollins', NULL, NULL),
('D.Teresa', 512, '2015-05-01', 'Isabel Stilwell', 'Manuscrito', '2021-04-02', '2021-04-17'),
('A Menina do Mar', 40, '2019-10-01', 'Sophia de Mello Breyner', 'Porto Editora', NULL, NULL),
('O Cemitério', 373, '1983-11-14', 'Stephen King', 'Doubleday', '2021-01-28', '2021-07-28');



CREATE TABLE FILME (
 Titulo VARCHAR(64) NOT NULL,
 Duracao INT NOT NULL,
 Estreia DATE NOT NULL,
 Adaptacao VARCHAR(64) NOT NULL,
 PRIMARY KEY(Titulo),
 FOREIGN KEY(Adaptacao) REFERENCES LIVRO(Titulo)
);

INSERT INTO FILME(Titulo, Duracao, Estreia, Adaptacao)
VALUES
('A Rapariga no Comboio', 112, '2016-09-20', 'A Rapariga no Comboio'),
('Crepúsculo', 126, '2008-12-04', 'Crepúsculo'),
('A 5ª Vaga', 117, '2016-01-14', 'A 5ª Vaga'),
('A Melodia do Adeus', 108, '2010-04-15', 'A Melodia do Adeus'),
('Juntos ao Luar', 108, '2010-03-25', 'Querido John'),
('Matilda, a Espalha Brasas', 102, '1996-12-20', 'Matilda'),
('Mulherzinhas', 135, '2019-12-07', 'Mulherzinhas'),
('A Culpa é das Estrelas', 133, '2014-06-19', 'A Culpa é das Estrelas'),
('A Menina que Roubava Livros', 135, '2014-01-23', 'A Menina que Roubava Livros'),
('Com amor, Simon', 110, '2018-03-22', 'Simon vs. the Homo Sapiens Agenda');



CREATE TABLE CLIENTE (
 NumCC VARCHAR(16) NOT NULL,
 PrimeiroNome VARCHAR(16) NOT NULL,
 UltimoNome VARCHAR(16) NOT NULL,
 Email VARCHAR(64) DEFAULT NULL,
 Sexo ENUM('M','F') NOT NULL,
 DataNascimento DATE NOT NULL,
 ERua VARCHAR(32) NOT NULL,
 ECidade VARCHAR(16) NOT NULL,
 ECodigoPostal INT NOT NULL,
 Emprestimo VARCHAR(64) DEFAULT NULL,
 PRIMARY KEY(NumCC),
 FOREIGN KEY(Emprestimo) REFERENCES LIVRO(Titulo)
);

INSERT INTO CLIENTE(NumCC, PrimeiroNome, UltimoNome, Email, Sexo, DataNascimento,
ERua, ECidade, ECodigoPostal, Emprestimo)
VALUES
('12729341', 'João', 'Medeiros', 'joaomed@gmail.com', 'M', '2003-03-17', 'Rua das Carmelitas 16', 'Porto', 4423, NULL),
('19239422', 'Ana', 'Ramos', 'anaramos99@hotmail.com', 'F', '1999-10-02', 'Rua Escura 34', 'Porto', 4421, NULL),
('94319223', 'João', 'Alves', NULL, 'M', '1985-07-05', 'Rua de Trás 82', 'Porto', 4423, 'A Menina que Roubava Livros'),
('12743614', 'Rita', 'Ramos', 'ritinharrr@borabora.pt', 'F', '1993-11-29', 'Rua de Nove de Julho 92', 'Porto', 4482, NULL),
('23891035', 'Luís', 'Gonçalves', NULL, 'M', '2000-01-23', 'Rua dos Clérigos 34', 'Porto', 4492, NULL),
('43267816', 'Beatriz', 'Marques', '19marques98@live.pt', 'F', '2001-09-12', 'Rua do Loureiro 26', 'Porto', 4481, 'A Melodia do Adeus'),
('12378947', 'Afonso', 'Carvalho', 'ac01ac@gmail.com', 'M', '2001-05-30', 'Rua do Loureiro 8', 'Porto', 4481, NULL),
('12388118', 'Rodrigo', 'Silva', 'rodriguinho7@hotmail.pt', 'M', '2003-12-07', 'Rua do Rosário 122', 'Porto', 4490, 'D.Teresa'),
('12383249', 'Catarina', 'Silva', NULL, 'F', '1994-09-23', 'Rua do Rosário 122', 'Porto', 4490, 'Mulherzinhas'),
('43281910', 'Miguel', 'Brito', 'miguel4brito@live.pt', 'M', '1998-04-04', 'Rua de Mota Pinto 16', 'Porto', 4415, NULL),
('23147811', 'Renata', 'Laranjeira', 'laranjeiraaa33@hotmail.com', 'F', '1978-03-03', 'Avenida da França 58', 'Porto', 4400, 'O Cemitério');



CREATE TABLE TELEFONE (
 NumCC VARCHAR(16) NOT NULL,
 NumTelefone INT UNIQUE NOT NULL,
 PRIMARY KEY(NumCC),
 FOREIGN KEY(NumCC) REFERENCES CLIENTE(NumCC)
);

INSERT INTO TELEFONE(NumCC, NumTelefone)
VALUES
('12729341', 913348203),
('19239422', 962947204),
('94319223', 930383493),
('12743614', 914012031),
('23891035', 917329402),
('23891035', 917329403),
('43267816', 960123192),
('12378947', 931021391),
('12388118', 935129319),
('12383249', 910234929),
('12383249', 910231202),
('43281910', 961123362),
('23147811', 930234413);



CREATE TABLE PERTENCE_A (
 NomeLivro VARCHAR(64) NOT NULL,
 Genero VARCHAR(32) NOT NULL,
 PRIMARY KEY(NomeLivro, Genero),
 FOREIGN KEY(NomeLivro) REFERENCES LIVRO(Titulo),
 FOREIGN KEY(Genero) REFERENCES GENERO(Nome)
);

INSERT INTO PERTENCE_A(NomeLivro, Genero)
VALUES
('A Rapariga no Comboio', 'Romance'),
('A Rapariga no Comboio', 'Suspense'),
('Crepúsculo', 'Romance'),
('A 5ª Vaga', 'Ficção Cientifica'),
('A Melodia do Adeus', 'Romance'),
('Querido John', 'Romance'),
('Matilda', 'Biográfico'),
('Mulherzinhas', 'Infantojuvenil'),
('A Culpa é das Estrelas', 'Romance'),
('A Menina que Roubava Livros', 'Drama'),
('Simon vs. the Homo Sapiens Agenda', 'Drama'),
('Simon vs. the Homo Sapiens Agenda', 'Infantojuvenil'),
('D.Teresa', 'Romance'),
('A Menina do Mar', 'Infantojuvenil'),
('O Cemitério', 'Horror');




CREATE TABLE AUTOR_FAV (
 NumCC VARCHAR(16) NOT NULL,
 AutorFav VARCHAR(64) DEFAULT NULL,
 PRIMARY KEY(NumCC),
 FOREIGN KEY(NumCC) REFERENCES CLIENTE(NumCC),
 FOREIGN KEY(AutorFav) REFERENCES AUTOR(Nome)
);

INSERT INTO AUTOR_FAV(NumCC, AutorFav)
VALUES
('19239422', 'Stephen King'),
('94319223', 'Nicholas Sparks'),
('43267816', 'Isabel Stilwell'),
('12388118', 'Rick Yancey'),
('43281910', 'Paula Hawkins');




CREATE TABLE GENERO_FAV (
 NumCC VARCHAR(16) NOT NULL,
 GeneroFav VARCHAR(32) DEFAULT NULL,
 PRIMARY KEY(NumCC),
 FOREIGN KEY(NumCC) REFERENCES CLIENTE(NumCC),
 FOREIGN KEY(GeneroFav) REFERENCES GENERO(Nome)
);

INSERT INTO GENERO_FAV(NumCC, GeneroFav)
VALUES
('12729341', 'Ficção Cientifica'),
('12743614', 'Drama'),
('23891035', 'Ação'),
('43267816', 'Romance'),
('12383249', 'Horror'),
('23147811', 'Romance');
