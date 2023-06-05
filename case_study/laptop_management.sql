CREATE DATABASE laptop_management;
USE laptop_management;

CREATE TABLE roles (
	role_id INT PRIMARY KEY AUTO_INCREMENT,
    role_name VARCHAR(50) NOT NULL
);

CREATE TABLE account_users(
	account_id INT PRIMARY KEY AUTO_INCREMENT,
    user_name VARCHAR(50) UNIQUE NOT NULL,
    `password` VARCHAR(50) NOT NULL
);
CREATE TABLE users_role (
	role_id INT,
    account_id INT,
    PRIMARY KEY(role_id, account_id),
    FOREIGN KEY (role_id) REFERENCES roles(role_id),
    FOREIGN KEY(account_id) REFERENCES account_users(account_id)
);

CREATE TABLE customers(
	customer_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_name VARCHAR(50) NOT NULL,
    email VARCHAR(50) UNIQUE NOT NULL,
    phone_number VARCHAR(11) UNIQUE NOT NULL,
    address TEXT NOT NULL,
    account_id INT,
    createAt DATETIME DEFAULT CURRENT_TIMESTAMP,
    updateAt DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (account_id) REFERENCES account_users(account_id)
);

CREATE TABLE product_type(
	product_type_id INT PRIMARY KEY AUTO_INCREMENT,
    product_type_name VARCHAR(50) NOT NUll
);

CREATE TABLE products(
	product_id INT PRIMARY KEY AUTO_INCREMENT,
    product_name VARCHAR(500) NOT NULL,
	product_type_id INT,
    `describe` TEXT NOT NULL,
    price LONG CHECK(price > 0),
    amount int,
    product_image_url TEXT NOT NULL,
    createAt DATETIME DEFAULT CURRENT_TIMESTAMP,
    updateAt DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY(product_type_id) REFERENCES product_type(product_type_id)
);
alter table products
add amount int;
CREATE TABLE products_details(
	product_details_id INT PRIMARY KEY AUTO_INCREMENT,
    product_details_name VARCHAR(500) NOT NULL,
	product_type_id INT,
    `describe` TEXT NOT NULL,
    price LONG CHECK(price > 0),
    product_image_url TEXT NOT NULL,
    FOREIGN KEY(product_type_id) REFERENCES product_type(product_type_id)
);
CREATE TABLE accessory(
	accessory_id INT PRIMARY KEY AUTO_INCREMENT,
    accessory_name VARCHAR(50) NOT NULL,
    accessory_price DOUBLE CHECK(accessory_price > 0),
    image_accessory TEXT NOT NULL,
    createAt DATETIME DEFAULT CURRENT_TIMESTAMP,
    updateAt DATETIME DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE `order`(
	order_id INT PRIMARY KEY AUTO_INCREMENT,
    order_date DATETIME,
    customer_id INT,
    product_id INT,
    price_order LONG ,
    FOREIGN KEY(customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY(product_id) REFERENCES products(product_id)
);

CREATE TABLE order_detail(
	order_detail_id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT,
	order_detail_date DATETIME,
    accessory_id INT,
    FOREIGN KEY(order_id) REFERENCES `order`(order_id),
    FOREIGN KEY(accessory_id) REFERENCES accessory(accessory_id)
);
-- account
insert into account_users(user_name,`password`) 
value	('nam','nam123'),('thai','thai123'),('tin','tin123'),('duc','duc123'),('hai','hai123');
insert into customers(customer_name,email,phone_number,address,account_id,createAt,updateAt)
value 	('Nam','nam@gmail.com','0124456789','260 THD',1,null,null),
		('Tin','tin@gmail.com','0123556789','260 THD',3,null,null),
		('Thai','thai@gmail.com','0223456789','260 THD',2,null,null),
		('Duc','duc@gmail.com','0133456789','260 THD',4,null,null),
        ('Hai','hai@gmail.com','0123456789','260 THD',5,null,null);
insert into roles(role_name)
value ('admin'),('user'),('customer'),('employee');
insert into users_role(role_id,account_id)
value 	(1,1),
		(2,2),
        (2,3),
        (2,4),
        (2,5);
-- product
insert into product_type(product_type_name)
value ('Asus'),('Macbook'),('Acer'),('MSI');
insert into products(product_name,product_type_id,`describe`,price,product_image_url,createAt,updateAt)
value
        ('Laptop Asus TUF Gaming FX506LHB-HN188W'
        ,1
        ,'-15.6 inch, 1920 x 1080 Pixels, IPS, 60 Hz, 600 nits, OLED\r -Intel, Core i5, 12500H\r -8 GB (1 thanh 8 GB), DDR4, 3200 MHz\r -SSD 512 GB\r -Intel UHD Graphics'
        ,1000
        ,'https://images.fpt.shop/unsafe/fit-in/240x215/filters:quality(90):fill(white)/fptshop.com.vn/Uploads/Originals/2022/1/26/637787904727727554_asus-tuf-gaming-fx506lh-den-2022-dd.jpg'
        ,null
        ,null);
 

 
select a.user_name,a.`password`,r.role_name
from account_users a
join users_role ur
on ur.account_id=a.account_id
join roles r
on r.role_id=ur.role_id;
    

    
    delimiter$$
create procedure select_product_by_name(`name`)
begin
select *
from products p
join product_type pt
on pt.product_type_id=p.product_type_id
where p.product_name=`name`
end $$
delimiter ;

delimiter $$
create procedure select_product_by_name(`name` varchar(500))
begin
select *
from products p
join product_type pt
on pt.product_type_id=p.product_type_id
where pt.product_type_name like `%name%`;
end$$
delimiter ;
-- - create new account
-- delimiter //
-- create procedure create_customer_account(first_name varchar(25), last_name varchar(25), username varchar(50), password varchar(50))
-- begin
-- insert into account_users(user_email,user_password) values (username, password);
-- insert into user_role(role_id, account_id) values (2, last_insert_id());
-- insert into customers(customer_name, email, account_id) values (concat(first_name, ” “, last_name), username, last_insert_id());
-- end //
-- delimiter ;

delimiter //
create procedure create_account(`user` varchar(50),pass varchar(50))
begin
insert into account_users(user_name,`password`) value (`user`,pass);
insert into users_role(role_id,account_id) value (2,last_insert_id());
end //
delimiter ;

insert into products(product_name,product_type_id,`describe`,price,product_image_url,createAt,updateAt)
value 
('Laptop Asus Vivobook M513UA-EJ704W R7 5700U/8GB/512GB SSD/15.6" FHD/Win11',
1,
'-15.6 inch, FHD (1920 x 1080), TN, 60 Hz, Anti-Glare LED-Backlit Display
- AMD, Ryzen 7, 5700U
- 8 GB, DDR4, 3200 MHz
- SSD 512 GB',
14490000,
'https://encrypted-tbn0.gstatic.com/shopping?q=tbn:ANd9GcS0HPn261SUr4PHCbZ0yIj9H_rqwCEyY-xWeHISPKDK5UE6Hby-gS-f2ylnLwm-eYlihbzN48OzcpWBe6rkvEknt9ZwR2_xxV8kGdsRJgR679zT9ROPVj5BSeR1T2qEHgcQUA&usqp=Cac',
null,
null),
('Laptop Asus Zenbook UM5401QA-KN209W R5 5600H/8GB/512GB SSD/14" OLED 2.8K Touch/Win11',
1,"-14.0 inch, 2880 x 1800 Pixels, OLED, 90 Hz, 500 nits, OLED
-AMD, Ryzen 5, 5600H
-8 GB, LPDDR4X, 4267 MHz
-SSD 512 GB
-AMD Radeon Graphics",
18790000,
'https://encrypted-tbn1.gstatic.com/shopping?q=tbn:ANd9GcTXPeGTLUVJoBfm-Wfhm7-nxRQGh_ub3UZBiff6KNBIsEdiUuSXPcYyIsD-6tRLs6zjExI17j1GWpmRSX2Mi1FRkagL6NYxHqF2XOtdb0VatsyP_WaWmme7iXEba87clF2FpN8&usqp=Cac',
null,
null),
('Laptop Asus Vivobook A1503ZA-L1139W i5 12500H/8GB/512GB/15.6"FHD/Win 11',
1,
'-15.6 inch, 1920 x 1080 Pixels, IPS, 60 Hz, 600 nits, OLED
-Intel, Core i5, 12500H
-8 GB (1 thanh 8 GB), DDR4, 3200 MHz
-SSD 512 GB
-Intel UHD Graphics',
16790000,
'https://encrypted-tbn1.gstatic.com/shopping?q=tbn:ANd9GcQkOUte_lb7oyuHcT7a8BNIc7VcqvZE-vFwEgc_McRyxsBdV-rvCf-B-sibMK2KLvqPExGa3QTsu-mAosPoHnPKWbgSGIPm8An-eyMMHT89BAhBwWNwhtW6PMJiq7BIoWY-&usqp=Cac',
null,
null),
('Laptop Asus Vivobook 15 OLED A1505VA-L1113W i5 13500H/16GB/512GB/15.6''FHD/Win11',
1,
"-15.6 inch, 1920 x 1080 Pixels, IPS, 60 Hz, 600 nits, FHD
-Intel, Core i5, 13500H
-16 GB, DDR4, 3200 MHz
-SSD 512 GB
-Intel UHD Graphics"
,
19490000
,
'https://encrypted-tbn3.gstatic.com/shopping?q=tbn:ANd9GcRK-PW45zfLY14-z4qLYWN7sf4MGMcSL0B61armCU4FGEfo7ku5EisG0YCOYhqdCEJUbzCBW1YACUhL_ihGDsKlsScQk7D5xLiqe51QOGrUCG5zavi5Z6fN&usqp=Cac
',
null,
null),
('Laptop Asus TUF Gaming FX506HC-HN949W i5 11400H/16GB/512GB/15.6''FHD/GeForce RTX 3050 4GB/Win 11'
,
1,
"-15.6 inch, 1920 x 1080 Pixels, IPS, 144 Hz, 250 nits, Anti-Glare LED Backlit
-Intel, Core i5, 11400
-16 GB (2 thanh 8 GB), DDR4, 3200 MHz
-SSD 512 GB
-NVIDIA GeForce RTX 3050 4GB; Intel HD Graphics",
21490000
,
'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTcOah7xUuF2UBTAQb_vl2HV-FK91XfUI64yQ&usqp=CAU',
null,
null),
('Laptop Asus ROG Strix Gaming G513IE-HN246W R7 4800H/8GB/512GB/15.6FHD/GeForce RTX 3050 Ti 4GB/Win 11'
,
1,
"-15.6 inch, 1920 x 1080 Pixels, IPS, 144 Hz, 250 nits, FHD
-AMD, Ryzen 7, 4800H
-8 GB (1 thanh 8 GB), DDR4, 3200 MHz
-SSD 512 GB
-NVIDIA GeForce RTX 3050 Ti 4 GB; AMD Radeon Graphics",
21990000,
'https://www.google.com/aclk?sa=l&ai=DChcSEwiS79Wgr6b_AhWKQmAKHcfGCu0YABABGgJ0bQ&ase=2&sig=AOD64_0zrjJe68gMwp3jdo1kNzhCV64Dqw&ctype=5&nis=5&adurl&ved=2ahUKEwjcgMegr6b_AhX6p1YBHVkfD14Qvhd6BAgBEC8',
null,
null)
;

