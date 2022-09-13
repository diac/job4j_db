insert into "role"(name) values ('Admin');
insert into "role"(name) values ('Manager');
insert into "role"(name) values ('Visitor');

insert into users("username", "password", role_id) values
    ('john', '********', 1),
    ('bill', '********', 2),
    ('bob', '********', 3);

insert into rules("name") values
    ('create_users'),
    ('edit_users'),
    ('delete_users'),
    ('create_items'),
    ('edit_items'),
    ('delete_items');

insert into role_rules(role_id, rule_id) values
    (1, 1),
    (1, 2),
    (1, 3),
    (2, 4),
    (2, 5),
    (2, 6);

insert into category("name") values
    ('Feature'),
    ('Fix'),
    ('Chore');

insert into  "state"("name") values
    ('Created'),
    ('In progress'),
    ('Complete'),
    ('Cancelled');

insert into item ("name", user_id, category_id, state_id) values
    ('Add new awesome feature', 3, 1, 1),
    ('Fix that critical bug!', 3, 2, 2),
    ('Setup new environment', 1, 3, 1);

insert into "comments"(message, item_id) values
    ('ASAP!!!', 2);

insert into attachs(title, "path", item_id) values
    ('Screenshot', 'screenshot.png', 2);