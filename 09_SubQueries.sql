-- 쿼리 내부에 또 다른 쿼리

-- sql 기초 강의를 수강하는 학생들의 평균 점수보다 높은 점수를 받은 학생의 이름은 무엇인가
-- 1. sql 기초 강의 수강생들의 평균 점수 구하기 
-- 2. 1번 단계에서 도출된 85점보다 높은 점수를 받은 학생 조회

-- where 조건절에서 사용하는 서브쿼리 
-- '홀길동' 사용자와 같은 해애 가입한 모든 사용자의 이름과 가입일 조회 
-- 1. 
select name, created_at from users; 
-- 2. 홍길동의 가입 년도 파악
select year(created_at) from users where name = '홍길동';
-- 3. 완성
-- 해당 식은 단일행 서브쿼리라고 불리운다 
-- 서브쿼리가 하나의 행, 하나의 열인 결과를 반환해야한다 
select name, created_at 
from users where year(created_at) = (
select year(created_at) from users where name = '홍길동'
);

-- 다중행 서브쿼리
-- 서브쿼리가 여러 개의 행을 결과로 반환할 때를 의미한다
-- in, any, all 과 같은 연산자와 함께 사용한다 

-- Python 테그가 붙은 과정을 수강 신청한 모든 학생 / 의 user_id 와 name을 조회하라
-- enrollments, tags, courses 에서 조인
select u.user_id, u.name, e.course_id from users u join enrollments e on u.user_id = e.user_id
where e.course_id in (
 -- 여기서 도출해야하는 값은 course_id 가 Python 태그를 포함하고 있는 것
 select c.course_id 
 from courses c join course_tags ct on (c.course_id = ct.course_id)
 join tags t on (ct.tag_id = t.tag_id)
 where t.name like '%Python%'
); 


-- from 절에 사용하는 서브쿼리 (인라인 뷰)
-- from 테이블명 
-- 마치 하나의 테이블처럼 쿼리의 결과를 사용하는 것이다 
-- 이 가상 테이블과 users 테이블을 조인하여 교육자 이름과 개성 과정 수를 조회하라 
select u.name as '교육자 이름', author_stats.course_count as '개설 강좌 수' 
from users u join (
 select author_id, count(*) as course_count
 from courses 
 group by author_id 
) as author_stats on u.user_id = author_stats.author_id
order by `개설 강좌 수` desc ;


