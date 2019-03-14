DROP TABLE castings;
DROP TABLE movies;
DROP TABLE performers;

CREATE TABLE performers (
  id SERIAL8 PRIMARY KEY,
  first_name VARCHAR(255),
  last_name VARCHAR(255)
);

CREATE TABLE movies (
  id SERIAL8 PRIMARY KEY,
  title VARCHAR(255),
  genre VARCHAR(255),
  budget INT8
);

CREATE TABLE castings (
  id SERIAL8 PRIMARY KEY,
  movie_id INT8 REFERENCES movies(id) ON DELETE CASCADE,
  performer_id INT8 REFERENCES performers(id) ON DELETE CASCADE,
  fee INT8
);
