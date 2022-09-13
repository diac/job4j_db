create table person (
	id serial primary key,
	"name" VARCHAR(255),
	age int,
	registration_date date
);

create table account(
    id serial primary key,
    username varchar(255),
    password varchar(255),
    person_id int references person(id) unique
);

create table subscription(
    id serial primary key,
    "name" varchar(255)
);

create table account_subscription(
    id serial primary key,
    account_id int references account(id),
    subscription_id int references subscription("id"),
    unique(account_id, subscription_id)
);

create table post(
    id serial primary key,
    title varchar(400),
    "content" text,
    account_id int references account(id)
);
