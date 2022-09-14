/* Создаем таблицу и заполняем данными */
create table products (
    id serial primary key,
    "name" varchar(50),
    count integer default 0,
    price integer
);

insert into products (name, count, price) VALUES ('product_1', 1, 5);
insert into products (name, count, price) VALUES ('product_2', 2, 10);
insert into products (name, count, price) VALUES ('product_3', 3, 15);
insert into products (name, count, price) VALUES ('product_4', 4, 20);
insert into products (name, count, price) VALUES ('product_5', 5, 25);
insert into products (name, count, price) VALUES ('product_6', 6, 30);
insert into products (name, count, price) VALUES ('product_7', 7, 35);
insert into products (name, count, price) VALUES ('product_8', 8, 40);
insert into products (name, count, price) VALUES ('product_9', 9, 45);
insert into products (name, count, price) VALUES ('product_10', 10, 50);
insert into products (name, count, price) VALUES ('product_11', 11, 55);
insert into products (name, count, price) VALUES ('product_12', 12, 60);
insert into products (name, count, price) VALUES ('product_13', 13, 65);
insert into products (name, count, price) VALUES ('product_14', 14, 70);
insert into products (name, count, price) VALUES ('product_15', 15, 75);
insert into products (name, count, price) VALUES ('product_16', 16, 80);
insert into products (name, count, price) VALUES ('product_17', 17, 85);
insert into products (name, count, price) VALUES ('product_18', 18, 90);
insert into products (name, count, price) VALUES ('product_19', 19, 95);
insert into products (name, count, price) VALUES ('product_20', 20, 100);

/* Скрипт обратного прохода по курсору */
BEGIN;
DECLARE
    cursor_products scroll cursor for
                        select * from products;
						
move forward all from cursor_products;

/* Через fetch prior */
fetch prior from cursor_products; /* 20 */
fetch prior from cursor_products; /* 19 */
fetch prior from cursor_products; /* 18 */
fetch prior from cursor_products; /* 17 */
fetch prior from cursor_products; /* 16 */
fetch prior from cursor_products; /* 15 */
fetch prior from cursor_products; /* 14 */
fetch prior from cursor_products; /* 13 */
fetch prior from cursor_products; /* 12 */
fetch prior from cursor_products; /* 11 */
fetch prior from cursor_products; /* 10 */
fetch prior from cursor_products; /* 9 */
fetch prior from cursor_products; /* 8 */
fetch prior from cursor_products; /* 7 */
fetch prior from cursor_products; /* 6 */
fetch prior from cursor_products; /* 5 */
fetch prior from cursor_products; /* 4 */
fetch prior from cursor_products; /* 3 */
fetch prior from cursor_products; /* 2 */
fetch prior from cursor_products; /* 1 */

move forward all from cursor_products;

/* Через move backward и fetch */
move backward 2 from cursor_products;
fetch from cursor_products;
move backward 2 from cursor_products;
fetch from cursor_products;
move backward 2 from cursor_products;
fetch from cursor_products;
move backward 2 from cursor_products;
fetch from cursor_products;
move backward 2 from cursor_products;
fetch from cursor_products;
move backward 2 from cursor_products;
fetch from cursor_products;
move backward 2 from cursor_products;
fetch from cursor_products;
move backward 2 from cursor_products;
fetch from cursor_products;
move backward 2 from cursor_products;
fetch from cursor_products;
move backward 2 from cursor_products;
fetch from cursor_products;
move backward 2 from cursor_products;
fetch from cursor_products;
move backward 2 from cursor_products;
fetch from cursor_products;
move backward 2 from cursor_products;
fetch from cursor_products;
move backward 2 from cursor_products;
fetch from cursor_products;
move backward 2 from cursor_products;
fetch from cursor_products;
move backward 2 from cursor_products;
fetch from cursor_products;
move backward 2 from cursor_products;
fetch from cursor_products;
move backward 2 from cursor_products;
fetch from cursor_products;
move backward 2 from cursor_products;
fetch from cursor_products;
move backward 2 from cursor_products;
fetch from cursor_products;
						
CLOSE cursor_products;

COMMIT;