/* Создаем таблицы:  */
CREATE TABLE company
(
    id integer NOT NULL,
    "name" character varying,
    CONSTRAINT company_pkey PRIMARY KEY (id)
);

CREATE TABLE person
(
    id integer NOT NULL,
    "name" character varying,
    company_id integer references company(id),
    CONSTRAINT person_pkey PRIMARY KEY (id)
);

/* Наполняем таблицы данными */
INSERT INTO company VALUES
    (1, 'Apple Inc.'),
    (2, 'Microsoft Corporation'),
    (3, 'HP Inc.'),
    (4, 'Sony Group Corporation'),
    (5, 'AsusTek Computer Inc'),
    (6, 'Samsung Group');

INSERT INTO person VALUES
    (1, 'John Smith', 1),
    (2, 'James Miller', 1),
    (3, 'Tim Wilson', 1),
    (4, 'Jacek Zamachowski', 1),
    (5, 'Astrid Bjornsdottir', 1),
    (6, 'Sergey Smirnov', 1),
    (7, 'Robert Brown', 2),
    (8, 'Istvan Kovacs', 2),
    (9, 'Marcello Giordano', 2),
    (10, 'Dan Harris', 2),
    (11, 'Patricia Martinez', 2),
    (12, 'Bruno Lewenberg', 3),
    (13, 'Kevin Xiao', 3),
    (14, 'Chong Wu Park', 3),
    (15, 'Alizee Dubois', 4),
    (16, 'Oksana Mirgorod', 4),
    (17, 'Sayane Kaito', 4),
    (18, 'Akua Ndebelede', 5),
    (19, 'Joshua Bernstein', 5),
    (20, 'Rachel Goldblum', 5),
    (21, 'Hubert Locke', 6),
    (22, 'Maria Romanov', 6),
    (23, 'John Doe', 2);

/*
В одном запросе получить:
- имена всех person, которые не состоят в компании с id = 5;
- название компании для каждого человека.
 */
SELECT
    p.name, c.name
FROM
    person AS p
INNER JOIN
    company AS c ON c.id = p.company_id
WHERE
    company_id <> 5;

/*
Выбрать название компании с максимальным количеством человек + количество человек в этой компании
нужно учесть, что таких компаний может быть несколько, и вывести надо информацию о каждой компании.
*/
SELECT
    c.name AS company_name,
    COUNT(p.id) AS person_count
FROM
    company AS c
INNER JOIN
    person AS p ON p.company_id = c.id
GROUP BY
    c.id
HAVING
    COUNT(p.id) = (
		SELECT
			MAX(person_count)
		FROM (
			SELECT
				COUNT(p.id) AS person_count
			FROM
				company AS c
			INNER JOIN
				person AS p ON p.company_id = c.id
			GROUP BY
				c.id
			) AS r
    )