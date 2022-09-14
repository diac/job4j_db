/* Create tables */
create table car_bodies(
    id serial primary key,
    "name" varchar(255)
);

create table car_engines(
    id serial primary key,
    "name" varchar(255)
);

create table car_transmissions (
    id serial primary key,
    "name" varchar(255)
);

create table cars(
    id serial primary key,
    "name" varchar(255),
    body_id int references car_bodies(id),
    engine_id int references car_engines(id),
    transmission_id int references car_transmissions(id)
);

/* Populate data rows */
insert into car_bodies("name") values
    ('Sedan'),
    ('Coupe'),
    ('Hatchback'),
    ('Minivan'),
    ('Pickup Truck'),
    ('Cabriolet'),
    ('Roadster');

insert into car_engines("name") values
    ('V8'),
    ('V12'),
    ('Diesel'),
    ('2l, Gas'),
    ('2.4l, Gas'),
    ('1.6l, Gas'),
    ('3l, Gas');

insert into car_transmissions("name") values
    ('Manual'),
    ('Automatic'),
    ('Semi-automatic');

insert into cars("name", body_id, engine_id, transmission_id) values
    ('Kia Optima IV', 1, 4, 2),
    ('Toyota Camry Solara II', 2, 5, 2),
    ('Skoda Octavia IV (A8)', 3, 6, 2),
    ('Mercedes-Benz Viano L1 I', 4, 3, 2),
    ('Mitsubishi L200 V', 5, 5, 1),
    ('Mercedes-Benz E-Class AMG 53 AMG V', 6, 7, 2);

/* Вывести список всех машин и все привязанные к ним детали. */
select
    c.id,
    c."name" as car_name,
    b."name" as body_name,
    e."name" as engine_name,
    t."name" as transmission_name
from
    cars as c
    left join car_bodies as b on b.id = c.body_id
    left join car_engines as e on e.id = c.engine_id
    left join car_transmissions as t on t.id = c.transmission_id;

/* Вывести кузовы, которые не используются НИ в одной машине. */
select
    *
from
    car_bodies
where
    id not in (select body_id from cars);

select
    b.*
from
    car_bodies as b
    left join cars as c on c.body_id = b.id
where
    c.id is null;

/* Вывести двигатели, которые не используются НИ в одной машине */
select
    *
from
    car_engines
where
    id not in (select engine_id from cars);

select
    e.*
from
    car_engines as e
    left join cars as c on c.engine_id = e.id
where
    c.id is null;

/* Вывести коробки передач, которые не используются НИ в одной машине */
select
    *
from
    car_transmissions
where
    id not in(select transmission_id from cars);

select
    t.*
from
    car_transmissions as t
    left join cars as c on c.transmission_id = t.id
where
    c.id is null;