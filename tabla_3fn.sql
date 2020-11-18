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
    author_id INT,
    publisher_id INT,
    PRIMARY KEY (id),
    FOREIGN KEY (author_id) REFERENCES authors_table(id),
    FOREIGN KEY (publisher_id) REFERENCES publishers_table(id)
);

CREATE TABLE readers_table(
    id SERIAL,
    reader VARCHAR(255),
    PRIMARY KEY (id)
);

CREATE TABLE loans_table(
    book_id INT,
    reader_id INT,
    return_date DATE,
    FOREIGN KEY (reader_id) REFERENCES readers_table(id),
    FOREIGN KEY (book_id) REFERENCES books_table(id)
);


