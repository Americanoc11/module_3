Create database ss2;
use ss2;

create table class(
id_class int primary key auto_increment,
name_class varchar(20)
);
create table room(
id_room int primary key auto_increment,
name_room varchar(20),
id_class int,
foreign key(id_class) references class(id_class)
);
create table jame(
`account` varchar(50) primary key,
`password` varchar(50)
);
create table student(
id int primary key auto_increment,
name_student varchar(50),
birthday date,
gender boolean,
email varchar(50),
`point` float,
id_class int,
`account` varchar(50) unique,
foreign key (id_class) references class(id_class),
foreign key (`account`) references jame(`account`)
);

create table instructor(
id_instructor int primary key auto_increment,
name_instructor varchar(50),
birthday date,
salary double
);

create table instructor_class(
 id_class int,
 id_instructor int,
 start_time date,
 end_time date,
 primary key (id_class, id_instructor),
 foreign key(id_class) references class(id_class),
 foreign key(id_instructor) references instructor(id_instructor)
);

insert into class (name_class) values ('c1121g1'), ('c1221g1'),('a0821i1'),('a0921i1');
insert into room(name_room,id_class) values ('Ken',1), ('Jame',1),('Ada',2),('Andy',2);

insert into jame(`account`,`password`)
 values('cunn','12345'),('chunglh','12345'),('hoanhh','12345'),('dungd','12345'),('huynhtd','12345'),
 ('hainm','12345'),('namtv','12345'),('hieuvm','12345'),('kynx','12345'),('vulm','12345');

insert into jame(`account`,`password`)
 values('anv','12345'),('bnv','12345');

 
insert into instructor(name_instructor,birthday, salary)
 values('tran van chanh','1985-02-03',100),('tran minh chien','1985-02-03',200),('vu thanh tien','1985-02-03',300);
insert into instructor(name_instructor,birthday, salary)
 values('tran van nam','1989-12-12',100);

 
 insert into student(name_student,birthday, gender,`point`, id_class,`account`) 
 values ('nguyen ngoc cu','1981-12-12',1,8,1,'cunn'),('le hai chung','1981-12-12',1,5,1,'chunglh'),
 ('hoang huu hoan','1990-12-12',1,6,2,'hoanhh'),('dau dung','1987-12-12',1,8,1,'dungd'),
 ('ta dinh huynh','1981-12-12',1,7,2,'huynhtd'),('nguyen minh hai','1987-12-12',1,9,1,'hainm'),
 ('tran van nam','1989-12-12',1,4,2,'namtv'),('vo minh hieu','1981-12-12',1,3,1,'hieuvm'),
 ('le xuan ky','1981-12-12',1,7,2,'kynx'),('le minh vu','1981-12-12',1,7,1,'vulm');

 insert into student(name_student,birthday, gender,`point`, id_class,`account`) 
 values ('nguyen van a','1981-12-12',1,8,null,'anv'),('tran van b','1981-12-12',1,5,null,'bnv');

 insert into instructor_class(id_class,id_instructor) values (1,1),(1,2),(2,1),(2,2),(3,1),(3,2);

-- 1. Lấy ra thông tin các học viên, và cho biết các học viên đang theo học lớp nào.
select s.*,c.name_class
from student s
join class c
on c.id_class=s.id_class;
-- 2. Lấy ra thông tin các học viên, và cho biết các học viên đang theo học lớp nào và cả các bạn đã đăng ký nhưng chưa có lớp học.
select s.*,c.name_class
from student s
left join class c
on c.id_class=s.id_class;
-- 4. Lấy thông tin của các học viên tên “Hai” và 'Huynh’.
select * from student
where name_student like '%Huynh%' or name_student like '%Hai%';
-- 5. Lấy ra học viên có điểm lớn hơn 5 .
select name_student,`point` from student
where `point`>5;
-- 6. Lấy ra học viên có họ là “nguyen”
select name_student from student 
where name_student like 'nguyen %';
-- 7. Thông kế số lượng học sinh theo từng loại điểm.
select `point`,count(id)
from student
group by `point`
order by `point`;
-- 8 . Thông kế số lượng học sinh theo điểm và điểm phải lớn hơn 5
select `point`,count(id)
from student
group by `point`
having `point`>5
order by `point`;
-- 9. Thông kế số lượng học sinh theo điểm lớn hơn 5 và chỉ hiện thị với số lượng>=2
select `point`,count(id)
from student
group by `point`
having `point`>5 and count(id)>=2
order by `point`;
-- 10. Lấy ra danh sách học viên của lớp c1121g1 và sắp xếp tên học viên theo alphabet.
select * from student s
join class c
on c.id_class=s.id_class
where name_class='c1121g1'
order by s.id;