use chundb;
-- level1
-- 1
select department_name, category from tb_department;
-- 2
select concat(department_name,'의 정원은' ,capacity,'명 입니다' ) as '학과별 정원' from tb_department;
-- 3
select s.student_name, d.department_name, s.absence_yn
from tb_student as s join tb_department d on s.department_no = d.department_no 
where (substr(s.student_ssn,8,1)%2=0 )and s.absence_yn = 'Y'and d.department_name = '국어국문학과';
-- 4
select student_name from tb_student where student_no in ('A513079','A513090','A513091','A513110','A513119') order by student_name desc;
-- 5
select concat(department_name,'의 정원은' ,capacity,'명 입니다' ) as '학과별 정원' from tb_department 
where capacity between 20 and 30;
-- 6 
select professor_name from tb_professor where department_no is null;
-- 7
select student_name, department_no from tb_student where department_no is null;
select student_name, s.department_no 
from tb_student s left join tb_department d on s.department_no = d.department_no 
where s.department_no is null;
-- 8
select class_no from tb_class where preattending_class_no is not null;
-- 9
select distinct category from tb_department order by category asc;
-- 10
select student_no, student_name, student_ssn, absence_yn, student_address,entrance_date from tb_student 
where absence_yn in ('N') and (entrance_date between '2019-01-01' and '2019-12-31') and student_address like '%전주%'
order by student_name asc;

-- level2
-- 1
select student_no, student_name, date_format(entrance_date,'%Y-%m-%d')
from tb_student where department_no = 002 order by student_name asc;
-- 2
select professor_name, professor_ssn from tb_professor where professor_name not like '___';
-- 3 
select professor_name,YEAR(CURDATE()) - (1900 + SUBSTR(professor_ssn,1,2)) AS age  from tb_professor 
where SUBSTR(professor_ssn,1,1) != 1 order by  SUBSTR(professor_ssn,1,2) desc;
-- 4 
select substr(professor_name,2,2) from tb_professor
where professor_name like '___';
-- 5
select student_no, student_name from tb_student
where year(entrance_date) - (substr(student_ssn,1,2) +
       case
           when SUBSTR(student_ssn,7,1) in ('1','2') then 1900
           else 2000
       end) >  19
order by student_name asc;
-- 6 
select case 
        when weekday('2020-12-25') = 0 then '월요일'
        when weekday('2020-12-25') = 1 then '화요일'
        when weekday('2020-12-25') = 2 then '수요일'
        when weekday('2020-12-25') = 3 then '목요일'
        when weekday('2020-12-25') = 4 then '금요일'
        when weekday('2020-12-25') = 5 then '토요일'
        when weekday('2020-12-25') = 6 then '일요일'
        else now()
        end as '크리스마스 요일'; 
-- 7 
select STR_TO_DATE('99/10/11', '%y/%m/%d');
select STR_TO_DATE('49/10/11', '%y/%m/%d');
select STR_TO_DATE('70/10/11', '%y/%m/%d');
select STR_TO_DATE('69/10/11', '%y/%m/%d');
-- 8
select s.student_name ,round(avg(point),1), s.student_no from tb_student s join tb_grade g on s.student_no = g.student_no
where s.student_name = '한아름' and s.student_no = 'A517178' group by s.student_name  ;
-- 9 
select d.department_name ,d.department_no, count(*)
from tb_department d join tb_student s on d.department_no = s.department_no
group by department_no ;
-- 10
select count(*) from tb_student s  left join tb_professor p on s.coach_professor_no = p.professor_no 
where s.coach_professor_no is null;
-- 11
select substr(g.term_no,1,4) as 년도, round(avg(point),1) from tb_student s join tb_grade g on s.student_no = g.student_no
where s.student_name = '김고운' and s.student_no = 'A112113'
group by(substr(g.term_no,1,4)) order by substr(g.term_no,1,4) asc;
-- 12
select d.department_name ,d.department_no ,  sum(case when s.absence_yn = 'Y' then 1 else 0 end) as '휴학생 수'
from tb_department d left join tb_student s on s.department_no = d.department_no
group by(department_no) order by department_no asc ;  
-- 휴학생인 학생의 수만 걸러내기 위해 y의 조건을 where, having, 서브쿼리 등 여러 방법을 시도했으나
-- 문법상 어긋나거나 Y가 아닌 행들은 모두 걸러지게 되어 출력이 안 되기도 함 
-- 이때 left join 의 특성을 활용하여 메인이 되는 테이블을 부서 테이블로 두고 
-- sum을 통해 y가 아닌 것은 0으로, y인 것은 1로 두어 휴학생인 사람의 수를 세었다
-- count이외에 수를 셀 수 있는 방법에 대해 하나 더 알게되었다  
-- 13 
select s.student_name ,count(*) as '동명이인 수 ' from tb_student s
 group by s.student_name having count(*)>=2 order by s.student_name asc ;
-- 이름으로 그룹바이 해서 개수에 따라 걸러내는 법 
-- 14 
select substr(g.term_no,1,4) as 년도, substr(g.term_no,5,2) as '학기', round(avg(g.point),1) 
from tb_student s join tb_grade g on s.student_no = g.student_no
where s.student_name = '김고운' and s.student_no = 'A112113'
group by substr(g.term_no,1,4),substr(g.term_no,5,2) with rollup 
order by substr(g.term_no,1,4), substr(g.term_no,5,2)  ;
