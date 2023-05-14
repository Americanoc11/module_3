create database product_management;
use product_management;

-- customer
create table account_health(
account_id int primary key auto_increment,
describe_account varchar(200),
is_admin tinyint(1) default'1'
);

create table decentralization(
decentralization_id int primary key auto_increment,
righth varchar(50),
is_admin tinyint(1) default'1'
);

create table customer(
customer_id int primary key auto_increment,
name_customer varchar(50),
user_name varchar(50),
passwords varchar(50),
phone varchar(10),
email varchar(50),
address varchar(100),
date_of_birth date,
gender bit(1),
decentralization_id int,
account_id int,
is_admin tinyint(1) default'1',
foreign key(decentralization_id) references decentralization(decentralization_id),
foreign key(account_id) references account_health(account_id)
);

create table customer_opinions(
opinions_id int primary key auto_increment,
customer_id int,
content varchar(300) default'null',
day_start date,
is_admin tinyint(1) default'1',
foreign key (customer_id) references customer(customer_id)
);

-- product
create table suppliers(
suppliers_id int primary key auto_increment,
name_suppliers varchar(50),
phone varchar(10),
address varchar(100),
is_admin tinyint(1) default'1'
);

create table type_goods(
type_id int primary key auto_increment,
name_type varchar(50),
is_admin tinyint(1) default'1'
);

create table product(
product_id int primary key auto_increment,
name_product varchar(200),
describe_product varchar(500),
price double,
image varchar(500),
type_id int,
note varchar(500),
amount int,
suppliers_id int,
is_admin tinyint(1) default'1',
foreign key(type_id) references type_goods(type_id),
foreign key(suppliers_id) references suppliers(suppliers_id)
);

create table promotion(
promotion_id int primary key auto_increment,
name_promotion varchar(250),
code_promotion varchar(100),
describe_promotion varchar (500),
price_promotion double,
image varchar(500),
product_id int,
is_admin tinyint(1) default'1',
foreign key(product_id) references product(product_id)
);
select * from promotion;
-- Bill
create table delivery_method(
delivery_id int primary key auto_increment,
describe_delivery varchar(200),
is_admin tinyint(1) default'1'
);

create table payment_method(
payment_id int primary key auto_increment,
describe_payment varchar(200)
,is_admin tinyint(1) default'1'
);

create table bill(
bill_id int primary key auto_increment,
customer_id int,
name_bill varchar(50),
address_receiving varchar(100),
phone_ varchar(10),
condition_bill varchar(50),
date_start date ,
date_delivery date ,
delivery_id int,
payment_id int,
is_admin tinyint(1) default'1',
foreign key (customer_id) references customer(customer_id),
foreign key (delivery_id) references delivery_method(delivery_id),
foreign key (payment_id) references payment_method(payment_id)
);

create table bill_details(
details_id int primary key auto_increment,
bill_id int,
product_id int,
amount int,
price_sale double,
total double,
note varchar (100),
is_admin tinyint(1) default'1',
foreign key (bill_id) references bill(bill_id),
foreign key (product_id) references product(product_id)
);

select * from product;

insert into suppliers(name_suppliers,phone,address)
value	 ("Acer","0123222111","Đà Nẵng")
		,("Apple","0123222111","Đà Nẵng")
        ,("Asus","0123222111","Đà Nẵng")
        ,("Dell","0123222111","Đà Nẵng")
        ,("Lenovo","0123222111","Đà Nẵng");
        
        insert into type_goods(name_type)
value ("Hand Tool")
,("Power Tool")
,("Laptop");
select * from product;

insert into product (name_product,describe_product,price,image,type_id,note,amount,suppliers_id)
value ("Laptop Dell Latitude 3420 L3420I3SSD Black","- CPU: Intel® Core™ i3-1115G4 - RAM/ SSD: 8GB DDR4/256GB SSD - VGA::Intel UHD Graphics - Màn hình: 14.0 inch HD (1366 x 768) - HĐH: Fedora - Màu sắc/ Chất liệu: Đen",10000,"https://mega.com.vn/media/product/19666_laptop_dell_latitude_3420_l3420i3ssd_black.JPG",3,"Thanh toán khi nhận hàng",1,4);
