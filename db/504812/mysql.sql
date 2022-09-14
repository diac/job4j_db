CREATE TABLE exams_records(
	id SERIAL PRIMARY KEY,
	subject_name VARCHAR(255),
	score INT,
	`date` TIMESTAMP
);

INSERT INTO `exams_records` (`id`, `subject_name`, `score`, `date`) VALUES
	(1, 'Programming', 89, '2022-09-14 14:06:36'),
	(2, 'Databases', 76, '2022-09-14 14:06:45'),
	(3, 'OOP', 82, '2022-09-14 14:06:55');