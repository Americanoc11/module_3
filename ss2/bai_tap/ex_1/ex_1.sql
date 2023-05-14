create database ex_1_erd;
use ex_1_erd;
CREATE TABLE coupons (-- vật tư
    id_votes INT PRIMARY KEY AUTO_INCREMENT,
    start_export DATE
);
SELECT 
    *
FROM
    coupons;
CREATE TABLE coupons_details ( -- chi tiết phiếu xuất
    id_coupons_details INT,
    id_votes INT,
    id_material INT,
    PRIMARY KEY (id_votes , id_material),
    FOREIGN KEY (id_votes)
        REFERENCES coupons (id_votes),
    FOREIGN KEY (id_material)
        REFERENCES supplies (id_material)
);
SELECT 
    *
FROM
    coupons_details;
CREATE TABLE supplies ( -- vật tư
    id_material INT PRIMARY KEY AUTO_INCREMENT,
    name_material VARCHAR(255)
);
SELECT 
    *
FROM
    supplies;
CREATE TABLE entry_slips ( -- phiếu nhập
    id_entry_slips INT PRIMARY KEY AUTO_INCREMENT,
    entry_day DATE
);
SELECT 
    *
FROM
    entry_slips;
CREATE TABLE entry_slips_details ( -- chi tiết phiếu nhập
    id_entry_slips_details INT,
    id_entry_slips INT,
    id_material INT,
    price INT,
    amount INT,
    PRIMARY KEY (id_entry_slips , id_material),
    FOREIGN KEY (id_entry_slips)
        REFERENCES entry_slips (id_entry_slips),
    FOREIGN KEY (id_material)
        REFERENCES supplies (id_material)
);
SELECT 
    *
FROM
    entry_slips_details;
CREATE TABLE purchase_orders (-- đơn đặt hàng
    id_purchase_orders INT PRIMARY KEY AUTO_INCREMENT,
    day_orders DATE,
    id_supplier INT,
    FOREIGN KEY (id_supplier)
        REFERENCES supplier (id_supplier)
);
SELECT 
    *
FROM
    purchase_orders;
CREATE TABLE purchase_orders_details (-- chi tiết đơn hàng
    id_purchase_orders_details INT,
    id_purchase_orders INT,
    id_material INT,
    PRIMARY KEY (id_purchase_orders , id_material),
    FOREIGN KEY (id_purchase_orders)
        REFERENCES purchase_orders (id_purchase_orders),
    FOREIGN KEY (id_material)
        REFERENCES supplies (id_material)
);
SELECT 
    *
FROM
    purchase_orders_details;

CREATE TABLE supplier ( -- nhà cung cấp
    id_supplier INT PRIMARY KEY AUTO_INCREMENT,
    name_supplier VARCHAR(255),
    address_supplier VARCHAR(255),
    phone_supplier VARCHAR(45)
);
SELECT 
    *
FROM
    supplier;

CREATE TABLE phone_supplier ( -- sdt nhà cung cấp
    id_phone_supplier INT PRIMARY KEY AUTO_INCREMENT,
    phone VARCHAR(45),
    id_supplier INT,
    FOREIGN KEY (id_supplier)
        REFERENCES supplier (id_supplier)
);

SELECT 
    *
FROM
    phone_supplier;
