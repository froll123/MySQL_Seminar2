create database seminar_2;
use seminar_2;

# Задача 1. Используя операторы языка SQL, 
# создайте таблицу “sales”. Заполните ее данными.

create table sales (
	id int not null auto_increment primary key, 
	order_date date not null,
	order_cnt int not null);

insert sales (order_date, order_cnt)
values 
("2022-10-02", 150), 
("2023-09-15", 250), 
("2022-06-06", 25), 
("2023-04-15", 450), 
("2022-09-25", 60);

select * from sales;

# 2. Сгруппируйте значений количества в 3 сегмента —
# меньше 100, 100-300 и больше 300.

select id, order_date,
case
when order_cnt < 100 then 'Small order'
when order_cnt >= 100 and order_cnt <= 300 then 'Average order'
else 'Large order'
end as bucket
from sales;

# 3. Создайте таблицу “orders”, заполните ее значениями. 
# Покажите “полный” статус заказа, используя оператор CASE

create table orders (
    order_id int not null auto_increment primary key, 
	employeid varchar(10) not null,
	amount float(10,5) not null,
	order_status varchar(30) not null);
    
insert orders(employeid, amount, order_status)
values
("e07", 16.00, 'OPEN'),
("e06", 45.90, 'OPEN'),
("e01", 97.70, 'CLOSED'),
("e03", 123.18, 'OPEN'),
("e02", 11.44, 'CANCELLED'),
("e04", 39.87, 'OPEN');

select * from orders;

select order_id, order_status,
case
	when order_status = 'OPEN' then 'Order is in open state.'
	when order_status = 'CLOSED' then 'Order is closed.'
	when order_status = 'CANCELLED' then 'Order is in open state.'
	else 'none'
end as order_summary
from orders;


# 4. Чем NULL отличается от 0?

# NULL отличается от 0 тем, что NULL - это специальное значение, обозначающее
# "значение не определено", а 0 представляет арифметическое значение нуля.
