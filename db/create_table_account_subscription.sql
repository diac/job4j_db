create table account_subscription(
    id serial primary key,
    account_id int references account(id) unique,
    subscription_id int references subscription("id") unique
);