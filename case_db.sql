create database store_internet;
use store_internet;
create table computer(
id int primary key auto_increment,
brand varchar(100),
location varchar(50)
);
create table type_customer(
id_type_customer int primary key auto_increment,
name_type varchar(50)
);
create table customer(
id int primary key auto_increment,
`name` varchar(50),
phone varchar(11),
email varchar(250),
card_id varchar(20),
id_type_customer int,
foreign key(id_type_customer) references type_customer(id_type_customer)
);

create table accompanying_service(
id int primary key auto_increment,
`name` varchar(50),
price int
);

create table service_manage(
id int primary key auto_increment,
day_start date,
day_end date,
id_computer int,
id_customer int
);

create table service_details(
id int primary key auto_increment,
id_service int,
id_accompany int,
amount int,
foreign key(id_service) references service_manage(id),
foreign key(id_accompany) references accompanying_service(id)
);
