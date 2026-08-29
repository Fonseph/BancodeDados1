CREATE TABLE autor (
    id_autor INT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    cidade VARCHAR(60)
);

CREATE TABLE livro (
    id_livro INT PRIMARY KEY,
    titulo VARCHAR(150) NOT NULL,
    ano_publicacao INT,
    id_autor INT NOT NULL,
    FOREIGN KEY (id_autor) REFERENCES autor(id_autor)
);
INSERT INTO autor VALUES
(1, 'Ana Martins', 'Campinas'),
(2, 'Bruno Silva', 'São Paulo'),
(3, 'Carla Mendes', 'Sorocaba'),
(4, 'Daniel Souza', 'Campinas'),
(5, 'Eduardo Lima', 'Jundiaí'),
(6, 'Fernanda Alves', 'Santos'),
(7, 'Gabriel Costa', 'Campinas');

INSERT INTO livro VALUES
(1, 'Banco de Dados para Iniciantes', 2022, 1),
(2, 'SQL na Prática', 2024, 1),
(3, 'Programação Web', 2021, 2),
(4, 'Algoritmos Essenciais', 2020, 3),
(5, 'Python para ADS', 2023, 4),
(6, 'Sistemas de Informação', 2022, 2),
(7, 'Projeto de Software', 2025, 5),
(8, 'Desenvolvimento de Jogos', 2024, 6),
(9, 'JavaScript Moderno', 2023, 7);

SELECT * from livro; 
SELECT * from autor;

--EXERCICIO 1
SELECT * from autor WHERE nome LIKE 'A%';

--EXERCICIO 2

SELECT * from autor WHERE cidade LIKE '%Paulo%';

--EXERCICIO 3
SELECT * from livro WHERE titulo LIKE '%SQL%';

--EXERCICIO 4
SELECT * from livro WHERE titulo LIKE '%Programação%';

--EXERCICIO 5
SELECT * from autor WHERE nome LIKE '%a%';

--EXERCICIO 6
SELECT  autor.nome,livro.titulo from livro INNER JOIN autor
ON livro.id_autor= autor.id_autor
where autor.nome LIKE 'D%';

--EXERCICIO 7
SELECT  autor.nome,livro.titulo from livro INNER JOIN autor
ON livro.id_autor= autor.id_autor
where autor.nome LIKE '%Mart%';

--EXERCICIO 8
SELECT  autor.nome,livro.titulo,autor.cidade from livro INNER JOIN autor
ON livro.id_autor= autor.id_autor
where autor.cidade LIKE 'Camp%';

--EXERCICIO 9
SELECT  autor.nome,livro.titulo,autor.cidade from livro INNER JOIN autor
ON livro.id_autor= autor.id_autor
where livro.titulo LIKE '%Software%'AND
autor.nome LIKE '%o%';

--EXERCICIO 10
SELECT  autor.nome,livro.titulo,autor.cidade from livro INNER JOIN autor
ON livro.id_autor= autor.id_autor
where autor.cidade LIKE '%a%'AND 
autor.nome LIKE '%a%' AND autor.nome  LIKE '%a %';

--EXERCICIO 11


