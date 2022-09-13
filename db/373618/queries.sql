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