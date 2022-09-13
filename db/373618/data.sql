/* Create tables */
create table devices(
    id serial primary key,
    "name" varchar(255),
    price real
);

create table people(
    id serial primary key,
    "name" varchar(255)
);

create table devices_people(
    id serial primary key,
    device_id int references devices(id),
    people_id int references people(id)
);

/* Populate data rows */
insert into people("name") values
    ('Jack'),
    ('Dan'),
    ('Bob');

insert into devices("name", price) values
    ('Laptop', 2000),
    ('Desktop', 5000),
    ('Smartphone', 1200),
    ('WiFi Router', 300),
    ('Electrocar', 80000);

insert into devices_people(device_id, people_id) values
    (1, 1),
    (2, 1),
    (3, 1),
    (4, 1),
    (1, 2),
    (3, 2),
    (4, 3),
    (5, 1);

/* #### Exercise queries #### */

/* Используя агрегатные функции вывести среднюю цену устройств */
select
    avg(price) as "Среднаяя цена устройств"
from
    devices;

/* Используя группировку вывести для каждого человека среднюю цену его устройств */
select
    p."name",
    avg(d.price) as "Среднаяя цена устройств"
from
    people as p
    join devices_people as dp on dp.people_id = p."id"
    join devices as d on d."id" = dp.device_id
group by
    p."id";

/* Дополнить запрос п.4. условием, что средняя стоимость устройств должна быть больше 5000 */

select
    p."name",
    avg(d.price) as "Среднаяя цена устройств"
from
    people as p
    join devices_people as dp on dp.people_id = p."id"
    join devices as d on d."id" = dp.device_id
group by
    p."id"
having
    avg(d.price) > 5000;