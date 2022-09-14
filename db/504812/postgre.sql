CREATE TABLE exams_records(
	id SERIAL PRIMARY KEY,
	subject_name VARCHAR(255),
	score INT,
	"date" TIMESTAMP
);

INSERT INTO exams_records (subject_name, score, "date") VALUES
	('Programming', 89, '2022-09-14 14:06:36'),
	('Databases', 76, '2022-09-14 14:06:45'),
	('OOP', 82, '2022-09-14 14:06:55');


/* ### Скрипты для воспроизведения ошибки согласованности при serializable ### */
/* # Для первой транзакции # */
begin transaction isolation level serializable;

select sum (score) from exams_records;

update exams_records set score = 100 where subject_name = 'Programming';

COMMIT; /* Здесь транзакция падает с ошибкой, если сначала фиксируется вторая транзакция */

/* # Для второй транзакции # */
begin transaction isolation level serializable;

select sum (score) from exams_records;

update exams_records set score = 100 where subject_name = 'OOP';

COMMIT; /* Транзакция выполняется без ошибки, если она фиксируется раньше первой */