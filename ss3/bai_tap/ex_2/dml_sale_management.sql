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
total_price bigint,
customer_id int,
foreign key(customer_id) references customer(customer_id)
);

create table product (
product_id int primary key auto_increment,
product_name varchar(50),
price bigint
);

create table orders_detail(

orders_id int,
product_id int,
amount int,
primary key(orders_id,product_id),
foreign key(orders_id) references orders(orders_id),
foreign key(product_id) references product(product_id)
);

-- insert into

insert into customer(customer_name,age)
value ('Minh Quan',10),
		('Ngoc Oanh',20),
        ('Hong Ha',50);
 
 insert into orders(customer_id,date_start,total_price)
value 	(1,'2006-3-21',null),
		(2,'2006-3-23',null),
		(1,'2006-3-16',null);
        
insert into product(product_name,price)
value 	('May Giat',3),
		('Tu Lanh',5),
		('Dieu Hoa',7),
        ('Quat',1),
        ('Bep Dien',2);
        
insert into orders_detail(orders_id,product_id,amount)
value	(1,1,3),
		(1,3,7),
        (1,4,2),
        (2,1,1),
        (3,1,8),
        (2,5,4),
        (2,3,3);
        
-- 1. Hiển thị các thông tin  gồm oID, oDate, oPrice của tất cả các hóa đơn trong bảng Order
select od.orders_id,od.date_start,odd.amount
from orders od
join orders_detail odd
on odd.orders_id=od.orders_id;

-- 2. Hiển thị danh sách các khách hàng đã mua hàng, và danh sách sản phẩm được mua bởi các khách
select c.customer_id,c.customer_name,p.product_name,od.orders_id
from customer c
left join orders o
on o.customer_id=c.customer_id
 join orders_detail od
on od.orders_id=o.orders_id
 join product p
on p.product_id=od.product_id;

-- 3. Hiển thị tên những khách hàng không mua bất kỳ một sản phẩm nào
select c.customer_id,c.customer_name,p.product_name,od.orders_id,o.orders_id
from customer c
left join orders o
on o.customer_id=c.customer_id
left join orders_detail od
on od.orders_id=o.orders_id
left join product p
on p.product_id=od.product_id
where c.customer_id=3;


-- 4. Hiển thị mã hóa đơn, ngày bán và giá tiền của từng hóa đơn (giá một hóa đơn được tính bằng tổng giá bán của từng loại mặt hàng xuất hiện trong hóa đơn. Giá bán của từng loại được tính = odQTY*pPrice)  
SET sql_mode = 'ONLY_FULL_GROUP_BY';
 select od.orders_id,ifnull(sum(od.amount*p.price),0) as 'total price'
 from orders_detail od
 join orders o 
 on o.orders_id=od.orders_id
 join product p 
 on p.product_id=od.product_id
 group by od.orders_id;
 
  select o.orders_id,o.date_start,ifnull(sum(od.amount*p.price),0) as 'total price' 
  from customer c 
  join orders o 
  on o.customer_id=c.customer_id
  join orders_detail od
  on od.orders_id=o.orders_id
  join product p
on p.product_id=od.product_id
group by o.orders_id;
        
        
        
        