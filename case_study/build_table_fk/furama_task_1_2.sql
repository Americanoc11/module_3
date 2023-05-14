create database if not exists furama;
use furama;
-- Customer--
create table type_customer(
id_type_customer int primary key auto_increment,
name_type_customer varchar(45)
);
create table customer(
id_customer int primary key auto_increment,
name_customer varchar(45) not null,
date_of_birth date,
gender bit(1),
card_id_customer varchar(45) unique,
phone varchar(45) unique,
email varchar(45) unique,
address varchar(45),
id_type_customer int,
foreign key(id_type_customer) references type_customer(id_type_customer)
);
-- Service
create table type_service(-- loại dịch vụ--
id_type_service int primary key auto_increment,
name_type_service varchar(45)
);
create table rental_type_service(-- kiểu thuê--
id_rental_type int primary key auto_increment,
name_rental_type varchar(45)
);
create table service_furama(-- dịch vụ--
id_service int primary key auto_increment,
name_service varchar(45) not null,
usable_area double,
rental_cost double,
number_person int,
room_standards varchar(45),
description_facility varchar(45) not null,
pool_area double,
floor int,
id_rental_type int,
id_type_service int,
foreign key(id_rental_type) references rental_type_service(id_rental_type),
foreign key(id_type_service) references type_service(id_type_service)
);
-- Employee
create table position_employee(
id_position int primary key auto_increment,
name_position varchar(45) not null
);
create table qualification_employee(
id_qualification int primary key auto_increment,
name_qualification varchar(45) not null
);
create table partscode_employee(
id_partscode int primary key auto_increment,
name_partscode varchar(45)
);
create table employee(
id_employee int primary key auto_increment,
name_employee varchar(45) not null,
date_of_birth date,
idcard varchar(45) not null unique, 
salary double,
phone varchar(45) unique,
email varchar(45) not null unique,
address varchar(45) not null,
id_position int,
id_qualification int,
id_partscode int,
foreign key(id_position) references position_employee(id_position),
foreign key(id_qualification) references qualification_employee(id_qualification),
foreign key(id_partscode) references partscode_employee(id_partscode)
);

-- Contract
create table accompanying_services (
id_service int primary key auto_increment,
name_service varchar(45),
price double,
unit varchar(45),
condition_service varchar(45)
);
create table contract(
id_contract int primary key auto_increment,
date_start_contract datetime,
date_end_contract datetime,
deposit double,
id_employee int,
id_customer int,
id_service int,
foreign key(id_employee) references employee(id_employee),
foreign key(id_customer) references customer(id_customer),
foreign key(id_service) references service_furama(id_service)
);

create table contract_details(
id_contract_details int primary key auto_increment,
amount int,
id_contract int,
id_service int,
foreign key(id_contract) references contract(id_contract),
foreign key(id_service) references accompanying_services(id_service)
); 

select* from contract;

delimiter $
create procedure select_all(id int)
begin
select name_customer from customer
where id_customer=id;
end $
delimiter ;
select * from customer;
call select_all(3);
call select_all(date_start_contract,date_end_contract);
