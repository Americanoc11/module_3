create database student_management;
use student_management;
create table student(
id int primary key auto_increment ,
name_student varchar(45) not null,
age int,
country varchar(45)  not null
);
create table classes (  
id int primary key auto_increment,
name_classes varchar(45) not null
);
create table teacher(
id int primary key auto_increment,
name_teacher varchar(45) not null ,
age int,
country varchar(45) not null
);
insert into student(name_student,age,country)
value('Hoàng',22,'Da Nang'),
('Duc',22,'Da Nang'),
('Duc',22,'Da Nang');
insert into classes(name_classes)
value('C1222G1'),
('C1122G1');
insert into teacher(name_teacher,age,country)
value('Hai TT',25,'Đà Nẵng'),
('Quang NN',26,'Huế'),
('Công TN',31,'Đà Nẵng');
select*from student;
select*from classes;
select*from teacher;
set sql_safe_updates=0;
set sql_safe_updates=1;
delete from student;
delete from classes;
delete from teacher;
alter table student
add email varchar(45);
update student
set email="thanhahi@gmail.com"
where id= 6;
update student
set name_student="Doãn Thanh Hải"
where id=6;




