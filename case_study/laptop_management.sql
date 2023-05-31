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
    product_name VARCHAR(50) NOT NULL,
	product_type_id INT,
    `describe` TEXT NOT NULL,
    price LONG CHECK(price > 0),
    product_image_url TEXT NOT NULL,
    createAt DATETIME DEFAULT CURRENT_TIMESTAMP,
    updateAt DATETIME DEFAULT CURRENT_TIMESTAMP,
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
-- product
insert into products(product_name,product_type_id,`describe`,price,product_image_url,createAt,updateAt)
value
        ('Laptop Asus TUF Gaming FX506LHB-HN188W',1,'-15.6 inch, 1920 x 1080 Pixels, IPS, 60 Hz, 600 nits, OLED\r -Intel, Core i5, 12500H\r -8 GB (1 thanh 8 GB), DDR4, 3200 MHz\r -SSD 512 GB\r -Intel UHD Graphics',1000,'https://images.fpt.shop/unsafe/fit-in/240x215/filters:quality(90):fill(white)/fptshop.com.vn/Uploads/Originals/2022/1/26/637787904727727554_asus-tuf-gaming-fx506lh-den-2022-dd.jpg',null,null),
        ('Laptop Asus TUF Gaming FX506LHB-HN188W',1,'-15.6 inch, 1920 x 1080 Pixels, IPS, 144 Hz, Anti-glare LED-backlit\r -Intel, Core i5, 11400H\r -8 GB (1 thanh 8 GB), DDR4, 3200 MHz\r -SSD 512 GB\r -NVIDIA GeForce RTX 3050 4GB; Intel UHD Graphics',
 '15490000',1000,'https://images.fpt.shop/unsafe/fit-in/240x215/filters:quality(90):fill(white)/fptshop.com.vn/Uploads/Originals/2022/1/26/637787904727727554_asus-tuf-gaming-fx506lh-den-2022-dd.jpg',null,null),
        ('Laptop Asus Vivobook E1404FA-NK186W R5',1,'-14.0 inch Chính:, 1920 x 1080 Pixels Màn hình chính:, IPS, 60 Hz Màn hình chính:, 250 nits, LED Backlit Chính:\r AMD, Ryzen 5, 7520U\r -16 GB, LPDDR5, 5500 MHz\r -SSD 512 GB\r -AMD Radeon Graphics',
 '15490000',1000,'https://images.fpt.shop/unsafe/fit-in/240x215/filters:quality(90):fill(white)/fptshop.com.vn/Uploads/Originals/2022/1/26/637787904727727554_asus-tuf-gaming-fx506lh-den-2022-dd.jpg',null,null);
  
 



