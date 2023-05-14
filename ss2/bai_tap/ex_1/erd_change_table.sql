create database change_erd;
use change_erd;
create table export_slip(
export_id int primary key auto_increment,
day_start date
);

create table supplies(
supplies_id int primary key,
supplies_name varchar(50)
);

create table entry_slip(
entry_id int primary key auto_increment,
date_start date
);

create table entry_slip_details(
entry_id int,
supplies_id int,
price int,
amount int,
primary key(entry_id,supplies_id),
foreign key(entry_id) references entry_slip(entry_id),
foreign key(supplies_id) references supplies(supplies_id)
);

create table export_slip_details(
export_id int,
supplies_id int,
price int,
amount int,
primary key(export_id,supplies_id),
foreign key(export_id) references export_slip(export_id),
foreign key(supplies_id) references supplies(supplies_id)
);

create table purchase_orders(
orders_id int primary key auto_increment,
date_start date
);

create table purchase_orders_details(
orders_id int,
supplies_id int,
primary key(orders_id,supplies_id),
foreign key(orders_id) references purchase_orders(orders_id),
foreign key(supplies_id) references supplies(supplies_id)
);

create table phone_number(
phone_id int primary key auto_increment,
phone_number varchar(10)
);

create table supplier(
supplier_id int primary key auto_increment,
supplier_name varchar(50),
address varchar(50),
phone_id int,
foreign key(phone_id) references phone_number(phone_id)
);


