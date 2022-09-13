/* Create tables */
create table invoice(
    id serial primary key,
    title varchar(255),
    client_name varchar(255),
    invoice_date date,
    payment_due_date date
);

create table invoice_item(
    id serial primary key,
    "name" varchar(255),
    quantity int,
    price int,
    invoice_id int references invoice("id")
);

/* Populate data rows */
insert into invoice (title, client_name, invoice_date, payment_due_date) values
    ('20220801', 'Empirical Bioscience', '2022-09-11', '2022-09-25'),
    ('20220802', 'Access Hardware Supply', '2022-09-12', '2022-09-28');

insert into invoice_item("name", quantity, price, invoice_id) values
    ('Database design', 1, 100000, 1),
    ('Troubleshooting', 1, 40000, 2);

/* Exercise queries */

select
    Inv.client_name as "Клиент",
    Item."name" as "Наименование",
    Item.quantity as "Количество"
from
    invoice as Inv
    join invoice_item as Item on Item.invoice_id = Inv."id";

select
    Inv.title "Номер счета",
    Inv.payment_due_date "Срок оплаты",
    price / 100 "Цена"
from
    invoice as Inv
    join invoice_item as Item on Item.invoice_id = Inv."id";

select
    Inv.client_name as "Клиент",
    Inv.payment_due_date "Срок оплаты",
    Item."name" as "Наименование",
    Item.quantity as "Количество"
from
    invoice as Inv
    join invoice_item as Item on Item.invoice_id = Inv."id";