create database student_management_ss3;
use student_management_ss3;
create table classes(
classes_id int primary key auto_increment,
classes_name varchar(50),
start_date date,
status_classes tinyint(1) default'1'
);

create table student(
student_id int primary key auto_increment,
student_name varchar(50),
address varchar(50),
phone varchar(10),
status_student tinyint(1) default'1',
classes_id int,
foreign key(classes_id) references classes(classes_id)
);

create table subjects(
subjects_id int primary key auto_increment,
subjects_name varchar(50),
credit int,
status_subjects tinyint(1) default'1'
);

create table mark(
mark_id int primary key auto_increment,
subjects_id int,
student_id int,
score double,
exam_times int,
foreign key(student_id) references student(student_id),
foreign key(subjects_id) references subjects(subjects_id)
);

-- insert values
insert into classes(classes_name,start_date,status_classes)
value   ('A1','2008-12-20',1),
		('A2','2008-12-22',1),
		('B3',null,0);

insert into student(student_name,address,phone,status_student,classes_id)
value
('Hung','Ha noi','912113113',1,1),
('Hoa','Hai phong',null,1,1),
('Manh','HCM','123123123',0,2);

insert into subjects(subjects_name,credit,status_subjects)
value
('CF',5	,1),
('C',6,1),
('HDJ',5,1),
('RDBMS',10	,1);

insert into mark(subjects_id,student_id,score,exam_times)
value
(1,	1,	8,	1),
(1,	2,	10,	2),
(2,	1,	12,	1);

-- DML
-- 1. Hiển thị tất cả các sinh vien có tên bắt đầu bảng ký tự 'h'
select * from student
where student_name like 'h%';

-- 2.Hiển thị các thông tin lớp học có thời gian bắt đầu vào tháng 12.
 select * from classes
 where month(start_date)='12';

-- 3.Hiển thị tất cả các thông tin môn học có credit trong khoảng từ 3-5.
select * from subjects
where credit >=3 and credit <=5;

-- 4.Thay đổi mã lớp(ClassID) của sinh viên có tên ‘Hung’ là 2.
set sql_safe_updates=0;
update student
set classes_id=2
where student_name='Hung';
set sql_safe_updates=1;
select * from student;

-- 5.Hiển thị các thông tin: StudentName, SubName, Mark. Dữ liệu sắp xếp theo điểm thi (mark) giảm dần. nếu trùng sắp theo tên tăng dần.
select s.student_name,sb.subjects_name,m.score
from student s
 join mark m
on m.student_id=s.student_id
 join subjects sb
on sb.subjects_id=m.subjects_id
order by m.score desc;

