use chundb;
-- 1
select department_name, category from tb_department;
-- 2
select concat(department_name,'의 정원은' ,capacity,'명 입니다' ) as '학과별 정원' from tb_department;
-- 5
select concat(department_name,'의 정원은' ,capacity,'명 입니다' ) as '학과별 정원' from tb_department 
where capacity between 20 and 30;
-- 6 
select professor_name from tb_professor where department_no is null;
-- 8
select class_no from tb_class where preattending_class_no is not null;
-- 9
select distinct category from tb_department order by category asc;
-- 10
select student_no, student_name, student_ssn, absence_yn, student_address,entrance_date from tb_student 
where absence_yn in ('N') and (entrance_date between '2019-01-01' and '2019-12-31') and student_address like '%전주%'
order by student_name asc;