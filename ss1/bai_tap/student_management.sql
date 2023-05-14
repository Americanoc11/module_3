create database db_student_management;
use db_student_management;
create table student(
student_id int primary key auto_increment,
student_name varchar(50),
age int,
country varchar(50)
);
create table teacher(
teacher_id int primary key auto_increment,
teacher_name varchar(50),
age int,
country varchar(50)
);
create table classes(
classes_id int primary key auto_increment,
classes_name varchar(50)
);

-- insert values
insert into student(student_name,age,country)
value	('Đức',20,'Đà Nẵng'),
		('Huy',20,'Đà Nẵng'),
        ('Hạnh',20,'Đà nẵng');
        
insert into teacher(teacher_name,age,country)
value	('HaiTT',20,'Tam kì'),
		('CongNT',20,'Đà Nẵng'),
        ('TrungTV',20,'Huế');
        
insert into classes(classes_name)
value 	('C1122G1'),
		('C1222G1'),
        ('C0222G1');
-- select from
select * from student;
select * from teacher;
select * from classes;

-- update
update student
set student_name= 'Đức'
where student_id=1;

update teacher
set teacher_name= 'HaiTT'
where student_id=1;

update classes
set classes_name='C1122G1'
where classes_id=1;

-- add new column

alter table student
add email varchar(100);

alter table teacher
add email varchar(100);

-- delete
set sql_safe_updates=0;
delete from student
where student_id=3;
set sql_safe_updates=1;

set sql_safe_updates=0;
delete from teacher
where teacher_id=3;
set sql_safe_updates=1;