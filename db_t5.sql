create database laptop_manager;
use laptop_manager;
CREATE TABLE roles (
	role_id INT PRIMARY KEY AUTO_INCREMENT,
    role_name VARCHAR(50) NOT NULL
);
CREATE TABLE account_users(
	account_id INT PRIMARY KEY AUTO_INCREMENT,
    user_name VARCHAR(50) UNIQUE NOT NULL,
    `password` VARCHAR(50) NOT NULL,
    role_id int,
foreign key(role_id) references roles(role_id)
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
CREATE TABLE employee(
	employee_id INT PRIMARY KEY AUTO_INCREMENT,
    employee_name VARCHAR(50) NOT NULL,
    email VARCHAR(50) UNIQUE NOT NULL,
    phone_number VARCHAR(11) UNIQUE NOT NULL,
    address TEXT NOT NULL,
    account_id INT,
    createAt DATETIME DEFAULT CURRENT_TIMESTAMP,
    updateAt DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (account_id) REFERENCES account_users(account_id)
);
create table product_type(
	product_type_id int primary key auto_increment,
    product_type_name varchar(50) not null
);
create table product(
	product_id INT PRIMARY KEY AUTO_INCREMENT,
    product_type_id int,
    product_name VARCHAR(500) NOT NULL,
    `describe` TEXT NOT NULL,
    price bigint ,
    quantity int,
    product_image_url TEXT NOT NULL,
    create_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    update_at DATETIME DEFAULT CURRENT_TIMESTAMP,
     foreign key (product_type_id) references product_type(product_type_id)
);
CREATE TABLE `order`(
	order_id INT PRIMARY KEY AUTO_INCREMENT,
    order_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    customer_id INT,
    employee_id int,
    price_total LONG ,
    FOREIGN KEY(customer_id) REFERENCES customers(customer_id),
    foreign key(employee_id) references employee(employee_id)
);
CREATE TABLE order_detail(
	order_detail_id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT,
    product_id int,
    quantity int,
    FOREIGN KEY(order_id) REFERENCES `order`(order_id),
    foreign key(product_id) references product(product_id)
    );
    -- VALUE PRODUCT
insert into product_type (product_type_name)
value ("asus"),("macbook"),("dell"),("acer"),("msi"),("lenovo"),("hp");
select * from product;
INSERT INTO `laptop_manager`.`product` (`product_type_id`, `product_name`, `describe`, `price`, `quantity`, `product_image_url`) VALUES (1, 'Laptop Asus Vivobook M513UA-EJ704W R7 5700U/8GB/512GB SSD/15.6\" FHD/Win11\'', '15.6 inch, FHD (1920 x 1080), TN, 60 Hz, Anti-Glare LED-Backlit Display\r \r AMD, Ryzen 7, 5700U\r \r 8 GB, DDR4, 3200 MHz\r \r SSD 512 GB', '14490000', '10', 'https://images.fpt.shop/unsafe/fit-in/240x215/filters:quality(90):fill(white)/fptshop.com.vn/Uploads/Originals/2023/3/10/638140621884222540_asus-tuf-gaming-fx506h-den-dd.jpg');
INSERT INTO `laptop_manager`.`product` (`product_type_id`, `product_name`, `describe`, `price`, `quantity`, `product_image_url`) VALUES (1, 'Laptop Asus Zenbook UM5401QA-KN209W R5 5600H/8GB/512GB SSD/14\" OLED 2.8K Touch/Win11\'', '\"\n14.0 inch, 2880 x 1800 Pixels, OLED, 90 Hz, 500 nits, OLED\n\nAMD, Ryzen 5, 5600H\n\n8 GB, LPDDR4X, 4267 MHz\n\nSSD 512 GB\n\nAMD Radeon Graphics\"', '18790000', '10', 'https://images.fpt.shop/unsafe/fit-in/240x215/filters:quality(90):fill(white)/fptshop.com.vn/Uploads/Originals/2023/4/19/638175171985162982_asus-vivobook-e1404fa-nk186w-r5-7520u-den-dd-moi.jpg');
INSERT INTO `laptop_manager`.`product` (`product_type_id`, `product_name`, `describe`, `price`, `quantity`, `product_image_url`) VALUES (1, 'Laptop Asus Vivobook A1503ZA-L1139W i5 12500H/8GB/512GB/15.6\"FHD/Win 11\'', '\"15.6 inch, 1920 x 1080 Pixels, IPS, 60 Hz, 600 nits, FHD', '16790000', '10', 'https://encrypted-tbn1.gstatic.com/shopping?q=tbn:ANd9GcTXPeGTLUVJoBfm-Wfhm7-nxRQGh_ub3UZBiff6KNBIsEdiUuSXPcYyIsD-6tRLs6zjExI17j1GWpmRSX2Mi1FRkagL6NYxHqF2XOtdb0VatsyP_WaWmme7iXEba87clF2FpN8&usqp=Cac');
INSERT INTO `laptop_manager`.`product` (`product_type_id`, `product_name`, `describe`, `price`, `quantity`, `product_image_url`) VALUES (4, 'Laptop Acer Aspire 3 A315-58-54M5 i5 1135G7/8GB/512GB/15.6\"FHD/Win 11\'', '\"15.6 inch, 1920 x 1080 Pixels, TN, 60 Hz, Acer ComfyView LED-backlit\n\nIntel, Core i5, 1135G7\n\n8 GB (2 thanh 4 GB), DDR4, 2400 MHz\n\nSSD 512 GB\n\nIntel Iris Xe Graphics\"', '12990000', '10', 'https://images.fpt.shop/unsafe/fit-in/240x215/filters:quality(90):fill(white)/fptshop.com.vn/Uploads/Originals/2023/4/20/638176054475714902_acer-aspire-a315-59-321n-i3-1215u-bac-dd.jpg');
INSERT INTO `laptop_manager`.`product` (`product_type_id`, `product_name`, `describe`, `price`, `quantity`, `product_image_url`) VALUES (4, 'Laptop Acer Aspire 5 A514-54-5127 i5 1135G7/8GB/512GB SSD/14.0\'\'FHD/Win11', '\"14.0 inch, 1920 x 1080 Pixels, IPS, 60 Hz, Acer ComfyView Anti-glare LED-backlit\n\nIntel, Core i5, 1135G7\n\n8 GB, DDR4, 2666 MHz\n\nSSD 512 GB\n\nIntel Iris Xe Graphics\"', '14190000', '10', 'https://images.fpt.shop/unsafe/fit-in/240x215/filters:quality(90):fill(white)/fptshop.com.vn/Uploads/Originals/2022/1/22/637784626016113737_acer-swift-3-sf314-511-bac-dd.jpg');
INSERT INTO `laptop_manager`.`product` (`product_type_id`, `product_name`, `describe`, `price`, `quantity`, `product_image_url`) VALUES (4, 'Laptop Acer Nitro Gaming AN515-57-54MV i5 11400H/8GB/512GB/15.6\"FHD/NVIDIA GeForce RTX 3050 4GB/Win10\'', '\"\n15.6 inch, 1920 x 1080 Pixels, IPS, 144 Hz, Acer ComfyView LED-backlit\n\nIntel, Core i5, 11400H\n\n8 GB (1 thanh 8 GB), DDR4, 3200 MHz\n\nSSD 512 GB\n\nNVIDIA GeForce RTX 3050 4GB; Intel UHD Graphics\"', '19990000', '10', 'https://images.fpt.shop/unsafe/fit-in/240x215/filters:quality(90):fill(white)/fptshop.com.vn/Uploads/Originals/2023/3/10/638140612136202106_acer-nitro-gaming-an515-58-dd.jpg');
INSERT INTO `laptop_manager`.`product` (`product_type_id`, `product_name`, `describe`, `price`, `quantity`, `product_image_url`) VALUES (4, 'Laptop Acer Nitro Gaming AN515-57-54MV i5 11400H/8GB/512GB/15.6\"FHD/NVIDIA GeForce RTX 3050 4GB/Win10\'', '\"\n15.6 inch, 1920 x 1080 Pixels, IPS, 144 Hz, Acer ComfyView LED-backlit\n\nIntel, Core i5, 11400H\n\n8 GB (1 thanh 8 GB), DDR4, 3200 MHz\n\nSSD 512 GB\n\nNVIDIA GeForce RTX 3050 4GB; Intel UHD Graphics\"', '19990000', '10', 'https://images.fpt.shop/unsafe/fit-in/240x215/filters:quality(90):fill(white)/fptshop.com.vn/Uploads/Originals/2023/3/10/638140612136202106_acer-nitro-gaming-an515-58-dd.jpg');
INSERT INTO `laptop_manager`.`product` (`product_type_id`, `product_name`, `describe`, `price`, `quantity`, `product_image_url`) VALUES (5, 'Laptop MSI Gaming GF63 Thin 11SC-664VN i5 11400H/8GB/512GB/15.6\"FHD/GeForce GTX 1650 4GB/Win 11\'', '\"15.6 inch, 1920 x 1080 Pixels, IPS, 144 Hz, 250 nits, FHD\n\nIntel, Core i5, 11400H\n\n8 GB, DDR4, 3200 MHz\n\nSSD 512 GB\n\nNVIDIA GeForce GTX 1650 4GB\"', '15990000', '10', 'https://images.fpt.shop/unsafe/fit-in/240x215/filters:quality(90):fill(white)/fptshop.com.vn/Uploads/Originals/2023/2/16/638121568991277911_msi-gaming-gf63-thin-11-den-dd.jpg');
INSERT INTO `laptop_manager`.`product` (`product_type_id`, `product_name`, `describe`, `price`, `quantity`, `product_image_url`) VALUES (5, 'Laptop MSI Gaming Alpha 15 B5EEK-203VN R5 5600H/8GB/512GB/15.6\"FHD/RX6600M 8GB/Win 11_Balo\'', '\"\n15.6 inch, 1920 x 1080 Pixels, IPS, 144 Hz, 358 nits, IPS FHD\n\nAMD, Ryzen 5, 5600H\n\n8 GB (1 thanh 8 GB), DDR4, 3200 MHz\n\nSSD 512 GB\n\nAMD Radeon RX 6600M 8GB; AMD Radeon Graphics Vega 6\"', '17990000', '10', 'https://images.fpt.shop/unsafe/fit-in/240x215/filters:quality(90):fill(white)/fptshop.com.vn/Uploads/Originals/2021/9/23/637679951533296877_msi-gaming-alpha-15-den-rgb-1-zone-dd.jpg');
INSERT INTO `laptop_manager`.`product` (`product_type_id`, `product_name`, `describe`, `price`, `quantity`, `product_image_url`) VALUES (5, 'Laptop MSI GF63 Thin 11UC-444VN i5 11400H/8GB/512GB/15.6\"FHD/GeForce RTX 3050 4GB/Win10/Balo\'', '\"\n15.6 inch, 1920 x 1080 Pixels, IPS, 60 Hz, 300 nits, IPS LCD LED Backlit, True Tone\n\nIntel, Core i5, 11400H\n\n8 GB, DDR4, 3200 MHz\n\nSSD 512 GB\n\nNVIDIA GeForce RTX 3050 4GB; Intel UHD Graphics\"', '17990000', '10', 'https://images.fpt.shop/unsafe/fit-in/240x215/filters:quality(90):fill(white)/fptshop.com.vn/Uploads/Originals/2023/2/16/638121561917481306_msi-gaming-gf63-thin-11uc-1228vn-i7-11800h-dd.jpg');
INSERT INTO `laptop_manager`.`product` (`product_type_id`, `product_name`, `describe`, `price`, `quantity`, `product_image_url`) VALUES (5, 'Laptop MSI Modern 14 C13M-608VN i5 1335U/16GB/512GB/14\" FHD/Win 11\'', '\"\n14.0 inch, 1920 x 1080 Pixels, IPS, 60 Hz, IPS\n\nIntel, Core i5, 1335U\n\n16 GB, DDR4, 3200 MHz\n\nSSD 512 GB\"', '17990002', '10', 'https://images.fpt.shop/unsafe/fit-in/240x215/filters:quality(90):fill(white)/fptshop.com.vn/Uploads/Originals/2023/2/16/638121594284039797_msi-modern-14-c5m-den-dd.jpg');
INSERT INTO `laptop_manager`.`product` (`product_type_id`, `product_name`, `describe`, `price`, `quantity`, `product_image_url`) VALUES (2, 'Macbook Pro M1 Pro', '14inch 16GB 512GB | New CPO', '40799000', '10', 'https://ionevn.vn/wp-content/uploads/2022/11/macbook-pro-14-inch-m1-pro-16-core-gpu-ram-32gb-ssd-512gb-mau-bac-ione-vn.png');
INSERT INTO `laptop_manager`.`product` (`product_type_id`, `product_name`, `describe`, `price`, `quantity`, `product_image_url`) VALUES (2, 'MacBook Air M1', '16GB 512GB 2020 I Chính hãng Apple Việt Nam', '36500000', '10', 'https://lh3.googleusercontent.com/Ezh1zisXToaMPP30pXE50dnotXpEyxnGsYpbd6uZc6jEWRWhMrMY2EDuXNcWPhw4nfcwwC-mGGVEkkRtRSJE0P3hRPuvCjw=w500-rw');
INSERT INTO `laptop_manager`.`product` (`product_type_id`, `product_name`, `describe`, `price`, `quantity`, `product_image_url`) VALUES (7, 'HP Gaming Victus 16-e1107AX', 'R5 6600H/8GB/512GB/16.1\"FHD/Nvidia', '25490000', '10', 'https://images.fpt.shop/unsafe/fit-in/240x215/filters:quality(90):fill(white)/fptshop.com.vn/Uploads/Originals/2023/2/17/638122294500233505_hp-gaming-victus-16-e1107ax-r5-6600h-den-dd.jpg');
INSERT INTO `laptop_manager`.`product` (`product_type_id`, `product_name`, `describe`, `price`, `quantity`, `product_image_url`) VALUES (7, 'HP Victus 16', 'CORE I5-11400H/8 GB/SSD 256GB/NVIDIA GEFORCE RTX 3050 4GB/16.1 INCH FULL HD', '16790000', '10', 'https://lapvip.vn/upload/products/original/hp-victus-16-1641873751.jpg');
INSERT INTO `laptop_manager`.`product` (`product_type_id`, `product_name`, `describe`, `price`, `quantity`, `product_image_url`) VALUES (7, 'HP EliteBook 830 G9', 'CORE I5-1235U/8 GB/SSD 512GB/INTEL IRIS XE GRAPHICS/13.3 INCH WUXGA', '36500000', '10', 'https://cdn.ankhang.vn/media/product/22536_laptop_hp_elitebook_x360_830_g9_6z962pa_5.jpg');
INSERT INTO `laptop_manager`.`product` (`product_type_id`, `product_name`, `describe`, `price`, `quantity`, `product_image_url`) VALUES (6, 'Lenovo Ideapad Gaming 3 15ARH7', 'R7 6800H/8GB/512GB/15.6\" FHD/GeForce RTX 3050 4GB/ Win 11', '19490000', '10', 'https://images.fpt.shop/unsafe/fit-in/240x215/filters:quality(90):fill(white)/fptshop.com.vn/Uploads/Originals/2022/8/15/637961542143431053_lenovo-ideapad-gaming-3-15arh7-r7-xam-dd.jpg');
INSERT INTO `laptop_manager`.`product` (`product_type_id`, `product_name`, `describe`, `price`, `quantity`, `product_image_url`) VALUES (6, 'Lenovo ThinkBook 14 G3 ACL', 'R7 5700U/8GB/512GB/14.0\"FHD/Win 11', '12990000', '10', 'https://images.fpt.shop/unsafe/fit-in/240x215/filters:quality(90):fill(white)/fptshop.com.vn/Uploads/Originals/2023/3/27/638155274560650577_lenovo-thinkbook-14-g3-alc-xam-dd.jpg');
INSERT INTO `laptop_manager`.`product` (`product_type_id`, `product_name`, `describe`, `price`, `quantity`, `product_image_url`) VALUES (6, 'Lenovo IdeaPad 5 15ABA7', 'R5 5625U/8GB/512GB/15.6\" FHD/Win 11', '12990000', '10', 'https://images.fpt.shop/unsafe/fit-in/240x215/filters:quality(90):fill(white)/fptshop.com.vn/Uploads/Originals/2023/3/27/638155274560650577_lenovo-thinkbook-14-g3-alc-xam-dd.jpg');
