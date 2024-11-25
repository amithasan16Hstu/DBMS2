create database ppp;
use ppp;
create table student1(
student_id int not null,
student_name varchar(20),
age int,
major varchar(25),
primary key(student_id)
);

insert into student1(student_id,student_name,age,major)
values(101,'Alice Brown',20,'Computer science'),
(102,'John Doe',22,'Mechanical Engineering'),
(103,'Mary Connor',21,'Civil Engineering'),
(104,'Sarah Connor',23,'Computer science'),
(105,'Michael Smith',22,'Electrical Engineering');

create table Enrollment(
enrollment_id varchar(20) not null,
student_id int,
course_id varchar(25),
grade varchar(20),
primary key(enrollment_id),
foreign key(student_id) references student1(student_id)
);

insert into Enrollment(enrollment_id,student_id,course_id,grade)
values('E001',101,'C001','A'),
('E002',102,'C002','B'),
('E003',103,'C003','A'),
('E004',104,'C004','A-'),
('E005',101,'C004','B+');

SELECT 
    S.student_name, 
    E.grade
FROM 
    Enrollment E
JOIN 
    student1 S 
ON 
    E.student_id = S.student_id
WHERE 
    E.course_id = 'C004';

select s.student_name,e.course_id,e.grade 
from student1 s
cross join Enrollment e
on s.student_id=e.student_id
where e.grade='A';

