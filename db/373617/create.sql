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