create table products (
    id serial primary key,
    "name" varchar(50),
    producer varchar(50),
    count integer default 0,
    price integer
);

create table history_of_price (
    id serial primary key,
    "name" varchar(50),
    price integer,
    "date" timestamp
);

/* Налог 9% на любой товар дороже 100 денег, применяется после других расчетов */
create or replace function post_tax()
    returns trigger as
$$
    BEGIN
        update
            products
        set
            price = price + price * 0.09
        where
            price > 100
			and id = (select id from inserted);
        return new;
    END;
$$
LANGUAGE 'plpgsql';

create trigger post_insert_tax_trigger
    after insert
    on products
	referencing new table as inserted
    for each statement
    execute procedure post_tax();

/* Налог 2% на любой товар, не произведенный Microsoft. Применяется до всех расчетов */
create or replace function pre_tax()
    returns trigger as
$$
    BEGIN
		if new.producer <> 'Microsoft' then
        	new.price = new.price + new.price * 0.02;
		end if;
        return new;
    END;
$$
LANGUAGE 'plpgsql';

create trigger pre_insert_tax_trigger
    before insert
    on products
    for each row
    execute procedure pre_tax();

create or replace function log_price_history()
    returns trigger as
$$
    BEGIN
        insert into
             history_of_price("name", price, date)
		values (
			new."name", 
			new.price,
			now()
		);		
        return new;
    END;
$$
LANGUAGE 'plpgsql';

create trigger log_price_history_trigger
    after insert
    on products
    for each row
    execute procedure log_price_history();