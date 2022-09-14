/* Create tables */
create table teens(
    id serial primary key,
    "name" varchar(255),
    gender varchar(10)
);

/* Populate data rows */
insert into teens("name", gender) values
    ('John Smith', 'male'),
    ('James Miller', 'male'),
    ('Tim Wilson', 'male'),
    ('Jacek Zamachowski', 'male'),
    ('Astrid Bjornsdottir', 'female'),
    ('Sergey Smirnov', 'male'),
    ('Robert Brown', 'male'),
    ('Istvan Kovacs', 'male'),
    ('Marcello Giordano', 'male'),
    ('Dan Harris', 'male'),
    ('Patricia Martinez', 'female'),
    ('Bruno Lewenberg', 'male'),
    ('Kevin Xiao', 'male'),
    ('Chong Wu Park', 'male'),
    ('Alizee Dubois', 'female'),
    ('Oksana Mirgorod', 'female'),
    ('Sayane Kaito', 'female'),
    ('Akua Ndebelede', 'female'),
    ('Joshua Bernstein', 'male'),
    ('Rachel Goldblum', 'female'),
    ('Hubert Locke', 'male'),
    ('Maria Romanov', 'female'),
    ('John Doe', 'male');

/* Используя cross join составить все возможные разнополые пары */
select
    t1."name",
    t2."name"
from
    teens as t1
    cross join teens as t2
where
    t1.gender <> t2.gender;