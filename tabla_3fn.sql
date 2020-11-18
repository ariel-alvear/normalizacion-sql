--modelo físico
CREATE DATABASE loans_bd;

CREATE TABLE publishers_table(
    id SERIAL,
    publisher VARCHAR(255),
    PRIMARY KEY (id)
);

CREATE TABLE authors_table(
    id SERIAL,
    author VARCHAR(255),
    PRIMARY KEY (id)
);

CREATE TABLE books_table(
    id SERIAL,
    title VARCHAR(255),
    publisher_id INT,
    PRIMARY KEY (id),
    FOREIGN KEY (publisher_id) REFERENCES publishers_table(id)
);

CREATE TABLE book_authors_relation_table(  --un autor puede tener varios libros y un libro puede tener varios autores. esta tabla es para plasmar la relacion N a N
    id SERIAL,
    author_id INT,
    book_id INT,
    PRIMARY KEY (id),
    FOREIGN KEY (author_id) REFERENCES authors_table(id),
    FOREIGN KEY (book_id) REFERENCES books_table(id)
);

CREATE TABLE readers_table(
    id SERIAL,
    reader VARCHAR(255),
    PRIMARY KEY (id)
);

CREATE TABLE loans_table(
    id SERIAL,
    book_id INT,
    reader_id INT,
    return_date DATE,
    FOREIGN KEY (reader_id) REFERENCES readers_table(id),
    FOREIGN KEY (book_id) REFERENCES books_table(id)
);

-- ahora le agregaremos datos para verificar que esté ok.
--3 registros a tabla editoriales
INSERT INTO publishers_table (publisher) VALUES ('Santillana');
INSERT INTO publishers_table (publisher) VALUES ('Ariel');
INSERT INTO publishers_table (publisher) VALUES ('Ercilla');

--3 registros a tabla autores
INSERT INTO authors_table(author) VALUES ('Sigmund Freud');
INSERT INTO authors_table(author) VALUES ('Simour Skinner');
INSERT INTO authors_table(author) VALUES ('Jacques Lacan');

--3 registros a tabla libros
INSERT INTO books_table(title, publisher_id) VALUES ('Ello, yo y superyo', 1);
INSERT INTO books_table(title, publisher_id) VALUES ('Condicionamiento Clásico', 1);
INSERT INTO books_table(title, publisher_id) VALUES ('El discurso', 2);

--4 registros a tabla relacion_libro_autor
INSERT INTO book_authors_relation_table(author_id, book_id) VALUES (1, 1);
INSERT INTO book_authors_relation_table(author_id, book_id) VALUES (2, 2);
INSERT INTO book_authors_relation_table(author_id, book_id) VALUES (1, 3);
INSERT INTO book_authors_relation_table(author_id, book_id) VALUES (3, 3);

--3 registros a tabla lectores
INSERT INTO readers_table(reader) VALUES ('juan perez');
INSERT INTO readers_table(reader) VALUES ('marcos lopez');
INSERT INTO readers_table(reader) VALUES ('maria juanita');

--3 registros a tabla prestamos
INSERT INTO loans_table(book_id, reader_id, return_date) VALUES (1, 1, '2020-10-08');
INSERT INTO loans_table(book_id, reader_id, return_date) VALUES (2, 2, '2020-11-30');
INSERT INTO loans_table(book_id, reader_id, return_date) VALUES (3, 1, '2020-12-30');



-- consultamos para corroborar que está ok.
SELECT * FROM publishers_table;
SELECT * FROM authors_table;
SELECT * FROM books_table;
SELECT * FROM book_authors_relation_table;
SELECT * FROM readers_table;
SELECT * FROM loans_table;

