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