create database add_value_database;
use add_value_database;
CREATE TABLE classes
(
    id_classes   INT         NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name_classes VARCHAR(60) NOT NULL,
    start_date DATETIME    NOT NULL,
    status_class    BIT
);
CREATE TABLE student
(
    id_student   INT         NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name_student VARCHAR(30) NOT NULL,
    address     VARCHAR(50),
    phone       VARCHAR(20),
    status_student      BIT,
    id_classes     INT         NOT NULL,
    FOREIGN KEY (id_classes) REFERENCES classes (id_classes)
);
CREATE TABLE subjects
(
    id_sup   INT         NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name_sup VARCHAR(30) NOT NULL,
    creadit  TINYINT     NOT NULL DEFAULT 1 CHECK ( creadit >= 1 ),
    status_sub  BIT                  DEFAULT 1
);

CREATE TABLE mark
(
    id_mark    INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    id_sup     INT NOT NULL,
    id_student INT NOT NULL,
    mark      FLOAT   DEFAULT 0 CHECK ( mark BETWEEN 0 AND 100),
    exam_time TINYINT DEFAULT 1,
    UNIQUE (id_sup, id_student),
    FOREIGN KEY (id_sup) REFERENCES subjects (id_sup),
    FOREIGN KEY (id_student) REFERENCES student (id_student)
);

INSERT INTO classes (name_classes,start_date,status_class)
VALUES ( 'A1', '2008-12-20', 1),
		( 'A2', '2008-12-22', 1),
		('B3', current_date, 0);

INSERT INTO student (name_student, address, phone, status_student, id_classes)
VALUES 	 ('Hung', 'Ha Noi', '0912113113', 1, 1)
		,('Hoa', 'Hai phong',0123123121, 1, 1)
		,('Manh', 'HCM', '0123123123', 0, 2);

INSERT INTO subjects 
VALUES (1, 'CF', 5, 1),
       (2, 'C', 6, 1),
       (3, 'HDJ', 5, 1),
       (4, 'RDBMS', 10, 1);

INSERT INTO mark(id_sup, id_student, mark, exam_time)
VALUES (1, 1, 8, 1),
       (1, 2, 10, 2),
       (2, 1, 12, 1);
select*from classes;
select*from student;
select*from subjects;
select*from mark;
-- Display student character name 'h'
select*from student
where name_student like'h%';
-- Display class information start on month 12
select*from classes
where  start_date like '%-12-%';
-- Display information subjects have credit 3-5
select*from subjects
where creadit>3 and creadit<=5;
-- Edit id class, student name' Hung' 2
set sql_safe_updates=0;
update student
set id_classes=2
where name_student='Hung';
select*from student;
-- Display information: name_student, name_subject, mark
select
s.name_student,subjects.name_sup,mark.mark
from student s
join subjects
on s.status_student=subjects.id_sup
join mark
on mark.id_student=s.id_student;

