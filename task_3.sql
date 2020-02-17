create schema roche_sql

--1
create table roche_sql.class_catalogue
(
class_id int primary key,
class_name varchar(15),
professor_id int,
semester varchar(20)
);

--2
create table roche_sql.students
(
student_id int primary key,
name varchar(10),
surname varchar(10),
birth_date date,
faculty varchar(20)
);

--3
create table roche_sql.exam_results
(student_id int,
class_id int,
exam_date date,
grade float,
foreign key (class_id) references roche_sql.class_catalogue (class_id),
foreign key (student_id) references roche_sql.students (student_id)
);

--4
insert into roche_sql.students
values 
(34577, 'John', 'Peters', '1993-02-15', 'Mathematics'),
(34578, 'Kate', 'Smith', '1992-10-29', 'Economy');

--5
insert into roche_sql.class_catalogue
values 
(6743, 'algebra', 4352, '2019_summer'),
(2876, 'calculus', 5325, '2019_summer'),
(3466, 'statistics', 6253, '2019_winter');

--6
insert into roche_sql.exam_results
values 
(34577, 6743, '2019-06-19', 2),
(34577, 2876, '2019-06-06', 3),
(34578, 6743, '2019-06-19', 4.5);

--7
select s.student_id, name, surname, faculty, class_name, grade  
from students s
left join exam_results er on s.student_id = er.student_id
left join class_catalogue cc on er.class_id = cc.class_id
where class_name like '%algebra%' and grade >= 4







