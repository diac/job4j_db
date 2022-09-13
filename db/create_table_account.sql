create table account(
    id serial primary key,
    username varchar(255),
    password varchar(255),
    person_id int references person unique
);