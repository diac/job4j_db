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

set session characteristics as transaction isolation level serializable;

begin transaction;

select * from exams_records;

savepoint before_any_changes;

update exams_records set score = 100 where subject_name = 'Programming';

select * from exams_records;

savepoint before_delete;

delete from exams_records where subject_name = 'OOP';

select * from exams_records;

rollback to before_delete;

select * from exams_records;

savepoint before_insert;

insert into exams_records (subject_name, score, "date") values
	('Dev Ops', 73, NOW());
	
select * from exams_records;

rollback to before_insert;

select * from exams_records;

rollback to before_any_changes;
	
commit;

select * from exams_records;
