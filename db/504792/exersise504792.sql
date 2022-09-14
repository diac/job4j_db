/* Создаем и наполняем таблицы */
create table students (
    id serial primary key,
    "name" varchar(50)
);

insert into students (name) values ('Иван Иванов');
insert into students (name) values ('Петр Петров');

create table authors (
    id serial primary key,
    "name" varchar(50)
);

insert into authors (name) values ('Александр Пушкин');
insert into authors (name) values ('Николай Гоголь');

create table books (
    id serial primary key,
    "name" varchar(200),
    author_id integer references authors(id)
);

insert into books (name, author_id) values ('Евгений Онегин', 1);
insert into books (name, author_id) values ('Капитанская дочка', 1);
insert into books (name, author_id) values ('Дубровский', 1);
insert into books (name, author_id) values ('Мертвые души', 2);
insert into books (name, author_id) values ('Вий', 2);

create table orders (
    id serial primary key,
    active boolean default true,
    book_id integer references books(id),
    student_id integer references students(id)
);

insert into orders (book_id, student_id) values (1, 1);
insert into orders (book_id, student_id) values (3, 1);
insert into orders (book_id, student_id) values (5, 2);
insert into orders (book_id, student_id) values (4, 1);
insert into orders (book_id, student_id) values (2, 2);

/* максимально громоздкий SQL – запрос */
select
    s.name,
    a.name,
    count(*)
from
    orders as o
    join books as b on b.id = o.book_id
    join students as s on s.id = o.student_id
    join authors as a on a.id = b.author_id
where
    lower(b.name) like '%капитан%'
    or a.name in ('Александр Пушкин', 'Николай Гоголь')
group by
    s.name,
    a.name
having
    lower(s.name) like '%иван%'
    or a.name = 'Николай Гоголь';

/* Определение представления */
create view exersise_view
    as select
        s.name as student_name,
        a.name as author_name,
        count(*) as total_count
    from
        orders as o
        join books as b on b.id = o.book_id
        join students as s on s.id = o.student_id
        join authors as a on a.id = b.author_id
    where
        lower(b.name) like '%капитан%'
        or a.name in ('Александр Пушкин', 'Николай Гоголь')
    group by
        s.name,
        a.name
    having
        lower(s.name) like '%иван%'
        or a.name = 'Николай Гоголь';

/* Получение данных из представления */
select
    *
from
    exersise_view
where
    student_name = 'Иван Иванов'
    and author_name = 'Александр Пушкин';

/* Переименование представления */
alter view exersise_view rename to exersise_view_updated;

/* Удаление ппредставления */
drop view exersise_view_updated;