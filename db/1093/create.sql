create table role(
    id serial primary key,
    "name" varchar(255)
);

create table users(
    id serial primary key,
    "username" varchar(255),
    "password" varchar(255),
    role_id int references role(id)
);

create table rules(
    id serial primary key,
    "name" varchar(255)
);

create table role_rules(
    id serial primary key,
    role_id int references role(id),
    rule_id int references rules(id),
    unique (role_id, rule_id)
);

create table category(
    id serial primary key,
    "name" varchar(255)
)

create table state(
    id serial primary key,
    "name" varchar(255)
);

create table item(
    id serial primary key,
    "name" varchar(255),
    user_id int references users(id),
    category_id int references category(id),
    state_id int references state(id)
);

create table comments(
    id serial primary key,
    message text,
    item_id int references item(id)
);

create table attachs(
    id serial primary key,
    title varchar(255),
    "path" text,
    item_id int references item(id) unique
);

