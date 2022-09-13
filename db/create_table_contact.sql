create table contact(
    id serial primary key,
    phone varchar(50),
    address varchar(400),
    person_id int references person
);