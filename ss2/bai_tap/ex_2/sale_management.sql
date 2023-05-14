create database sale_management;
use sale_management;
create table customer(
customer_id int primary key auto_increment,
customer_name varchar(50),
age int
);
create table orders(
orders_id int primary key auto_increment,
orders_name varchar(50),
date_start date,
total_price bigint
);

create table product (
product_id int primary key auto_increment,
product_name varchar(50),
price bigint
);

create table orders_detail(
orders_id int,
product_id int,
primary key(orders_id,product_id),
foreign key(orders_id) references orders(orders_id),
foreign key(product_id) references product(product_id)
);