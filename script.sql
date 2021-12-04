-- USE below structure to execute, make sure to change "user" by your database user.
-- psql < script.sql -U "user"

-- DROP DATABASE posts.
DROP DATABASE posts;

-- CREATE DATABASE posts.
CREATE DATABASE posts;

-- Connect to database posts.
\c posts

-- CREATE TABLE posts
CREATE TABLE posts(
id INT,
nombre_de_usuario VARCHAR(25),
fecha_de_creacion DATE,
contenido VARCHAR(255),
descripcion VARCHAR(255),
PRIMARY KEY(id));

-- INSERT 2 POSTS FOR USER Pamela AND 1 FOR USER Carlos.
INSERT INTO posts(id, nombre_de_usuario, fecha_de_creacion, contenido, descripcion) VALUES
(1, 'Pamela', '2021-11-30', 'Post 1 Pamela', 'Descripcion de Post 1 Pamela.');

INSERT INTO posts(id, nombre_de_usuario, fecha_de_creacion, contenido, descripcion) VALUES
(2, 'Pamela', '2021-11-30', 'Post 2 Pamela', 'Descripcion de Post 2 Pamela.');

INSERT INTO posts(id, nombre_de_usuario, fecha_de_creacion, contenido, descripcion) VALUES
(3, 'Carlos', '2021-11-30', 'Post 1 Carlos', 'Descripcion de Post 1 Carlos.');

-- ALTER TABLE TO ADD A NEW COLUMN NAMED titulo.
ALTER TABLE posts ADD titulo VARCHAR(255);

-- UPDATE TABLE TO INCLUDE GENERIC TITLE FOR EACH USER'S POST.
UPDATE posts SET titulo = 'Titulo Generico';

-- INSERT 2 POSTS FOR USER Pedro.
INSERT INTO posts(id, nombre_de_usuario, fecha_de_creacion, contenido, descripcion, titulo) VALUES
(4, 'Pedro', '2021-11-30', 'Post 1 Pedro', 'Descripcion de Post 1 Pedro.', 'Titulo Generico Post 1 Pedro');

INSERT INTO posts(id, nombre_de_usuario, fecha_de_creacion, contenido, descripcion, titulo) VALUES
(5, 'Pedro', '2021-11-30', 'Post 2 Pedro', 'Descripcion de Post 2 Pedro.', 'Titulo Generico Post 2 Pedro');

-- DELETE POST FROM Carlos.

DELETE FROM posts WHERE nombre_de_usuario = 'Carlos';

-- INSERT A NEW POST FOR USER Carlos.
INSERT INTO posts(id, nombre_de_usuario, fecha_de_creacion, contenido, descripcion, titulo) VALUES
(6, 'Carlos', '2021-11-30', 'Post 1 Carlos', 'Descripcion de Post 1 Carlos.', 'Titulo Generico Post 1 Carlos');

-- CREATE A NEW TABLE comments.
CREATE TABLE comments(
    id SERIAL,
    fecha_hora_creacion TIMESTAMP,
    contenido VARCHAR(255),
    post_id INT,
    PRIMARY KEY(id),
    FOREIGN KEY(post_id) REFERENCES posts(id)
);

-- INSERT 2 COMMENTS FOR THE POST OF Pamela AND 4 FOR Carlos POST.

INSERT INTO comments(fecha_hora_creacion, contenido, post_id) VALUES
('2021-12-04','Contenido comentario post Pamela 1.', 1);

INSERT INTO comments(fecha_hora_creacion, contenido, post_id) VALUES
('2021-12-04','Contenido comentario post Pamela 2.', 1);

INSERT INTO comments(fecha_hora_creacion, contenido, post_id) VALUES
('2021-12-04','Contenido comentario post Carlos 1.', 6);

INSERT INTO comments(fecha_hora_creacion, contenido, post_id) VALUES
('2021-12-04','Contenido comentario post Carlos 2.', 6);

INSERT INTO comments(fecha_hora_creacion, contenido, post_id) VALUES
('2021-12-04','Contenido comentario post Carlos 3.', 6);

INSERT INTO comments(fecha_hora_creacion, contenido, post_id) VALUES
('2021-12-04','Contenido comentario post Carlos 4.', 6);

-- CREATE A NEW POST FOR Margarita

INSERT INTO posts(id, nombre_de_usuario, fecha_de_creacion, contenido, descripcion, titulo) VALUES
(7, 'Margarita', '2021-12-04', 'Post 1 Margarita', 'Descripcion de Post 1 Margarita.', 'Titulo Generico Post 1 Margarita');

-- CREATE 5 COMMENTS FOR Margarita's POST.

INSERT INTO comments(fecha_hora_creacion, contenido, post_id) VALUES
('2021-12-04', 'Contenido comentario post Margarita 1.', 7);

INSERT INTO comments(fecha_hora_creacion, contenido, post_id) VALUES
('2021-12-04', 'Contenido comentario post Margarita 2.', 7);

INSERT INTO comments(fecha_hora_creacion, contenido, post_id) VALUES
('2021-12-04', 'Contenido comentario post Margarita 3.', 7);

INSERT INTO comments(fecha_hora_creacion, contenido, post_id) VALUES
('2021-12-04', 'Contenido comentario post Margarita 4.', 7);

INSERT INTO comments(fecha_hora_creacion, contenido, post_id) VALUES
('2021-12-04', 'Contenido comentario post Margarita 5.', 7);