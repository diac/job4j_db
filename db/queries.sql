CREATE TABLE person (
	id serial PRIMARY KEY,
	"name" VARCHAR(255),
	age int2,
	registration_date date
);

INSERT INTO person("name", age, registration_date) VALUES ('Nikolai', 37, '2022-09-13');

UPDATE person SET registration_date = '2022-08-01';

DELETE FROM person;