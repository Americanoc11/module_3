create database build_database_sales_manager;
use build_database_sales_manager;
create table customer(
id_customer int primary key auto_increment,
name_customer varchar(255),
age_customer int,
id_orders int,
foreign key(id_orders) references orders(id_orders)
);
create table orders(
id_orders int primary key auto_increment,
name_orders varchar(255),
day_orders date,
total_price double
);
create table product(
id_product int primary key auto_increment,
name_product varchar(255),
price double
);
create table orders_detail(
id_orders_detail int,
id_orders int,
id_product int,
quantity int,
primary key(id_orders,id_product),
foreign key(id_orders) references orders(id_orders),
foreign key(id_product) references product(id_product)
);
select * from customer;
insert into customer(name_customer,age_customer,id_orders)
value ('Duc',18,2),('Danh',18,1);

insert into orders(name_orders,day_orders,total_price)
value ('Hanh','2020-01-01',null)
	,('Hung','2022-12-12',null);
    select*from orders;
    select customer.*,o.* from customer
    join orders o
    on o.id_orders=customer.id_orders;