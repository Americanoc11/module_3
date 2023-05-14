CREATE DATABASE student_management_ss4;
USE student_management_ss4;

CREATE TABLE classes
(
    id_class   INT         NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name_class VARCHAR(60) NOT NULL,
    start_date DATETIME    NOT NULL,
    status_classes    BIT
);
CREATE TABLE student
(
    id_student   INT         NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name_student VARCHAR(30) NOT NULL,
    address     VARCHAR(50),
    phone       VARCHAR(20),
    status_student      BIT,
    class_id     INT         NOT NULL,
    FOREIGN KEY (class_id) REFERENCES classes (id_class)
);
CREATE TABLE subjects
(
    id_subjects   INT         NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name_subjects VARCHAR(30) NOT NULL,
    credit  TINYINT     NOT NULL DEFAULT 1 CHECK ( Credit >= 1 ),
    status_subjects  BIT                  DEFAULT 1
);

CREATE TABLE mark
(
    id_mark    INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    id_subjects   INT NOT NULL,
    id_student INT NOT NULL,
    mark      FLOAT   DEFAULT 0 CHECK ( Mark BETWEEN 0 AND 100),
    exam_times TINYINT DEFAULT 1,
    UNIQUE (id_subjects, id_student),
    FOREIGN KEY (id_subjects) REFERENCES subjects (id_subjects),
    FOREIGN KEY (id_student) REFERENCES student (id_student)
);

insert into classes(name_class,start_date,status_classes)
value 	( 'A1', '2008-12-20', 1),
		( 'A2', '2008-12-22', 1),
        ( 'B3', current_date, 0);

INSERT INTO student (name_student, address, phone, status_student, class_id)
VALUES ('Hung', 'Ha Noi', '0912113113', 1, 1),
		('Hoa', 'Hai phong',null, 1, 1),
		('Manh', 'HCM', '0123123123', 0, 2);

INSERT INTO subjects
VALUES (1, 'CF', 5, 1),
       (2, 'C', 6, 1),
       (3, 'HDJ', 5, 1),
       (4, 'RDBMS', 10, 1);
select*from subjects;
INSERT INTO mark (id_subjects, id_student, mark, exam_times)
VALUES (1, 1, 8, 1),
       (1, 2, 10, 2),
       (2, 1, 12, 1);
select*from mark;
select*from classes;
select* from student;
select* from subjects;

-- Display subject have max credit
select*from subjects
where credit=(select  max(credit) from subjects);

-- Display subject information max point
select sb.id_subjects,sb.name_subjects,max(m.mark) as 'max_mark' from subjects sb
join mark m
on m.id_subjects= sb.id_subjects
where m.mark=(select max(mark) from mark)
group by sb.id_subjects;
select*from student;
select*from subjects;
select*from mark;

-- Display information student and average, ranking in descending order of score
select s.*,avg(m.mark) as 'average'
from student s
join mark m
on m.id_student=s.id_student
join subjects ss
on ss.id_subjects=m.id_subjects
group by s.id_student;

