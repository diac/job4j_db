/* Create tables */
create table "type"(
    id serial primary key,
    "name" varchar(255)
);

create table product(
    id serial primary key,
    "name" varchar(255),
    type_id int references "type"(id),
    exipred_date date,
    price real
);

/* Populate data rows */
insert into "type" ("name") values
    ('Сыр'),
    ('Молоко'),
    ('Мясо'),
    ('Крупа'),
    ('Сладости');

insert into product("name", type_id, exipred_date, price) values
    ('Сыр Российский', 1, '2022-12-01', 300),
    ('Сыр плавленный', 1, '2022-07-22', 120),
    ('Сыр Пармезан', 1, '2022-11-07', 580),
    ('Молоко пастеризованное', 2, '2022-09-25', 120),
    ('Молоко топленое', 2, '2022-09-14', 140),
    ('Молоко соевое', 2, '2022-12-20', 170),
    ('Филе индейки', 3, '2022-09-15', 800),
    ('Свинина премиум', 3, '2022-09-14', 1200),
    ('Бедро куриное', 3, '2022-09-16', 600),
    ('Рис басмати', 4, '2023-10-10', 380),
    ('Крупа гречневая', 4, '2023-12-01', 290),
    ('Мороженое пломбир', 5, '2022-12-01', 150),
    ('Мороженое эскимо', 5, '2022-12-01', 180),
    ('Конфеты ассорти', 5, '2022-12-01', 780);

/* #### Exercise queries #### */

/* Получение всех продуктов с типом "СЫР" */
select
    *
from
    product as p
    join "type" as t on t.id = p.type_id
where
    t."name" = 'Сыр';

/* Получение всех продуктов, у кого в имени есть слово "мороженое" */
select
    *
from
    product
where
    LOWER("name") like '%мороженое%';

/* Вывести все продукты, срок годности которых уже истек */
select
    *
from
    product
where
    exipred_date < NOW();

/* Вывести самый дорогой продукт. Запрос должен быть универсальный и находить все продукты с максимальной ценой.*/
select
    *
from
    product as p
where
    p.price = (select max(price) from product);

/* Вывести для каждого типа количество продуктов к нему принадлежащих. В виде имя_типа, количество */
select
    t."name",
    count(*)
from
    product as p
    join "type" as t on t."id" = p.type_id
group by
    t.id;

/* Получить все продукты с типом "СЫР" и "МОЛОКО" */
select
    *
from
    product as p
    join "type" as t on t."id" = p.type_id
where
    t."name" in ('Сыр', 'Молоко');

/* Вывести тип продуктов, которых осталось меньше 10 */
select
    t."name",
    count(*)
from
    product as p
    join "type" as t on t."id" = p.type_id
group by
    t.id
having
    count(*) < 10;

/* Вывести все продукты и их тип */
select
    p."name" as "Продукт",
    t."name" as "Тип"
from
    product as p
    join "type" as t on t."id" = p.type_id

