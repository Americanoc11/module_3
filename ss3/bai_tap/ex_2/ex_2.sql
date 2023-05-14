create database build_database_sales_manager_ss3;
use build_database_sales_manager_ss3;

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
create table customer(
id_customer int primary key auto_increment,
name_customer varchar(255),
age_customer int,
id_orders int,
foreign key(id_orders) references orders(id_orders)
);
create table orders_detail(
id_orders int,
id_product int,
quantity int,
primary key(id_orders,id_product),
foreign key(id_orders) references orders(id_orders),
foreign key(id_product) references product(id_product)
);
-- data customer
insert into customer(name_customer,age_customer,id_orders)
value	('Minh Quan',10,1),
		('Ngoc Oanh',20,2),
		('Hong Ha',50,1);
insert into orders(name_orders,day_orders,total_price)
value	 (1,'2006-3-21',Null)
		,(2,'2006-3-23',Null)
		,(1,'2006-3-16',null);
insert into product(name_product,price)
value 	('May Giat',3),
		('Tu Lanh',5),
        ('Dieu Hoa',7),
        ('Quat',1),
		('Bep Dien',2);

insert into orders_detail(id_orders,id_product,quantity)
value	(1,1,3),
		(1,3,7),
        (1,4,2),
        (2,1,1),
        (3,1,8),
        (2,5,4),
        (2,3,null);
        
select*from orders;
select*from orders_detail;
select*from customer;
select*from product;

-- Display information order_id, order_date, order_price 
select* from orders;

-- Display list customer, and customer buy product
select
c.id_customer, c.name_customer, c.age_customer,p.name_product
from customer c
left join orders o
on c.id_orders= o.id_orders
left join orders_detail cd
on cd.id_orders= c.id_orders
left join product p
on p.id_product=cd.id_product;

-- Display name customer dont buy anything
select
c.id_customer, c.name_customer, c.age_customer,p.name_product,cd.quantity
from customer c
join orders o
on c.id_orders= o.id_orders
join orders_detail cd
on cd.id_orders= c.id_orders
left join product p
on p.id_product=cd.id_product
where cd.quantity is null;


-- display total price
select
o.id_orders,o.day_orders,sum(p.price * od.quantity) as total_price
from orders o
left join orders_detail od
on od.id_orders=o.id_orders
inner join product p
on p.id_product=od.id_product
group by o.id_orders;
