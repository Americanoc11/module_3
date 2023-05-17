create database product_management_web;
use product_management_web;
create table product_details(
product_id int,
describe_1 varchar(200),
describe_2 varchar(200),
describe_3 varchar(200),
describe_4 varchar(200),
describe_5 varchar(200),
image varchar(500)
);

create table `account` (
account_user varchar(100) primary key,
password_user varchar(50),
user_name varchar(50),
gender bit,
phone varchar(11),
email varchar(250),
date_of_birth date,
amount_purchases int
);

create table 