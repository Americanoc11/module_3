use demo;
create table student(
id int primary key ,
name_student varchar(50),
age int 
);
select*from student;
insert into student(id,name_student,age)
value
		(4,'Hanh',18);
        select name_student,age,id from student;
        
        set sql_safe_updates=1;
         
        