create database bai_soan_ss4;
use bai_soan_ss4;
create table classes(
  id_classes int primary key auto_increment, 
  name_classes varchar(20)
);

create table jame(
 account_jame varchar(50) primary key, 
 password_jame varchar(50)
);

create table student(
  id_student int primary key auto_increment, 
  name_student varchar(50), 
  birthday date, 
  gender boolean, 
  email varchar(50), 
  point_student float, 
  classes_id int, 
  foreign key (classes_id) references classes(id_classes)
  -- foreign key (`account`) references jame(`account`)
);


insert into classes (name_classes) values ('c1121g1'), ('c1221g1'),('a0821i1'),('a0921i1');
 insert into student(name_student,birthday, gender,point_student, classes_id) 
 values ('nguyen ngoc cu','1981-12-12',1,8,1),
 ('le hai chung','1981-12-12',1,5,1),
 ('hoang huu hoan','1990-12-12',1,6,2),
 ('dau dung','1987-12-12',1,8,1),
 ('ta dinh huynh','1981-12-12',1,7,2),
 ('nguyen minh hai','1987-12-12',1,9,1),
 ('tran van nam','1989-12-12',1,4,2),('vo minh hieu','1981-12-12',1,3,1),
 ('le xuan ky','1981-12-12',1,7,2),('le minh vu','1981-12-12',1,7,1);
 insert into student(name_student,birthday, gender,point_student, classes_id) 
 values ('nguyen van a','1981-12-12',1,8,null),('tran van b','1981-12-12',1,5,null);
 select*from student;
 select*from classes;
 -- lấy thông tin học viên đang theo học lớp nào
 SELECT 
    id_student,
    name_student,
    birthday,
    gender,
    email,
    point_student,
    class.id_class,
    name_class
FROM
    student
        INNER JOIN
    class oN student.class_id = class.id_class;
-- lấy tt học viên đang học lớp nào, các học viên đã đăng kí chưa có lớp
SELECT 
    id_student,
    name_student,
    birthday,
    gender,
    email,
    point_student,
    class.id_class,
    name_class
FROM
    student
        left JOIN
    class ON student.class_id = class.id_class;
-- lấy tt hoc vien co diem lon hon 5
SELECT 
    id_student,
    name_student,
    birthday,
    gender,
    email,
    point_student,
    class_id
    from student
    where point_student>5;
    
-- lấy học vien ten hai và huỳnh
SELECT *
FROM
    student
WHERE name_student LIKE '%hai'
OR name_student LIKE '% huynh';
    -- lấy học vien ten nguyen
SELECT *
FROM student
WHERE name_student LIKE 'nguyen %';
  -- lấy số lượng học sinh  theo tung loại điểm
-- thống kê số lượng học sinh theo điểm và điểm phải lớn hơn 5
-- Thông kế số lượng học sinh theo điểm lớn hơn 5 và chỉ hiện thị với số lượng>=2
-- Lấy ra danh sách học viên của lớp c1121g1 và sắp xếp tên học viên theo alphabet.
-- -----------------------------------------------------------------------------------------

-- Hiện thị danh sách các lớp có học viên theo học và số lượng học viên của mỗi lớp ( yêu cầu viết code ra giấy )
select*from classes;
select*from student;
select*from jame;
select
c.id_classes,c.name_classes,s.name_student
from classes c
join student s
on s.classes_id = c.id_classes;
select*from student;
select count(name_student) as 'Quantity'
from student
where classes_id=1;


-- Tính điểm lớn nhất của mỗi các lớp ( yêu cầu viết code ra giấy 
select*from classes;
select*from student;
select*from jame;
-- Tình điểm trung bình  của từng lớp ( yêu cầu viết code ra giấy )

-- Lấy ra toàn bộ tên và ngày sinh các instructor và student ở CodeGym. ( yêu cầu viết code ra giấy )

-- Lấy ra top 3 học viên có điểm cao nhất của trung tâm. ( yêu cầu viết code ra giấy )

-- Lấy ra các học viên có điểm số là cao nhất của trung tâm. ( yêu cầu viết code ra giấy )

 