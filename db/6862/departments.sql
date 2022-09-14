/* Create tables */
create table departments(
    id serial primary key,
    "name" varchar(255)
);

create table employees(
    id serial primary key,
    "name" varchar(255),
    department_id int references departments(id)
);

/* Populate data rows */
insert into departments("name") values
    ('Software Development'),
    ('Quality Assurance'),
    ('Dev Ops'),
    ('Design'),
    ('Accounting'),
    ('Management'),
    ('Caffeteria');

insert into employees("name", department_id) values
    ('John Smith', 1),
    ('James Miller', 1),
    ('Tim Wilson', 1),
    ('Jacek Zamachowski', 1),
    ('Astrid Bjornsdottir', 1),
    ('Sergey Smirnov', 1),
    ('Robert Brown', 2),
    ('Istvan Kovacs', 2),
    ('Marcello Giordano', 2),
    ('Dan Harris', 2),
    ('Patricia Martinez', 2),
    ('Bruno Lewenberg', 3),
    ('Kevin Xiao', 3),
    ('Chong Wu Park', 3),
    ('Alizee Dubois', 4),
    ('Oksana Mirgorod', 4),
    ('Sayane Kaito', 4),
    ('Akua Ndebelede', 5),
    ('Joshua Bernstein', 5),
    ('Rachel Goldblum', 5),
    ('Hubert Locke', 6),
    ('Maria Romanov', 6),
    ('John Doe', null);

/* #### Exercise queries #### */

/* Left join */
select
    *
from
    departments as d
    left join employees as e on e.department_id = d.id;

/* Right join */
select
    *
from
    departments as d
    right join employees as e on e.department_id = d.id;

/* Full join */
select
    *
from
    departments as d
    full join employees as e on e.department_id = d.id;

/* Cross join */
select
    *
from
    departments
    cross join employees;

/* Используя left и right join написать запросы, которые давали бы одинаковый результат
(порядок вывода колонок в эти запросах также должен быть идентичный). */
select
    e."name",
    d."name"
from
    departments as d
    left join employees as e on e.department_id = d.id;

select
    e."name",
    d."name"
from
    employees as e
    left join departments as d on e.department_id = d.id;