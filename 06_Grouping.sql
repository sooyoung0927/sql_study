-- 데이터에 그룹을 만드는 Group By 및 집계 함수

use wanted_lms;

-- 홍길동의 이메일은 무엇인가
-- sql 입문이라고 하는 과정의 과정 설명은 무엇인가
-- 위 예시처럼 단순한 SELECT 를 진행했었다

-- 하지만 비즈니스의 의사결정에는 더 그림이 필요하다 
-- 예) 우리 플렛폼의 총 사용자 수는 몇명인가?
-- 예) 가장 게시글을 많이 쓴 사람은 누구인가?

-- 집계함수 : 데이터를 하나의 값으로 요약하기 
/*
  집계함수란 여러 행의 데이터를 입력 받아 단 하나의 결과 값을 반환하는 함수이다
  count(칼럼명) : 해당 칼럼의 데이터 개수를 센다 (널 제외)
  sum(칼럼명) : 해당 칼럼의 데이터 합계 
  avg(칼럼명) : 해당 칼럼의 데이터 평균
  max(칼럼명) : 해당 칼럼의 최댓값
  min(칼럼명) : 해당 칼럼의 최솟값
*/


-- 우리 LMS 플렛폼에서 전체 사용자 수 조회
select count(*) as '총 사용자 수' from users;

-- user_profiles 테이블에서 bio(자기소개)를 작성한 사용자는 몇 명인지 조회
select count(*) as '자기소개 작성한 사용자 수' from user_profiles where bio is not null; 
select count(bio) as '자기소개 작성한 사용자 수' from user_profiles;

-- courses 테이블에서 과정을 등록한 교육자가 총 몇명인지 중복없이 계산
select count(distinct author_id) as '과정 등록한 교육자 수' from courses;

-- sum,avg,max,min 
-- grades 등급 테이블에서 모든 제출물의 총점과 평균 점수를 조회해라
select sum(score)  as '총점',avg(score) as '평균점수' from grades;
-- grades 등급 테이블에서 모든 제출물 중 최고점수과 최저점수를 조회해라
select max(score)  as '최고점수', min(score) as '최저점수' from grades;


-- 에러케이스 : 비집계 함수와 집계함수를 동시에 사용
-- 집계 함수를 여러 행의 값을 하나의 결과로 요약한다 
-- 하지만 select 절에서 집계함수와 함께 그룹 바이 절 없이 일반 칼럼을 쓰게 되면
-- 어떤 name 값읃 count와 함께 묶어야할지 알 수 없어서 에러가 발생한다 
select name, count(*) as '총 사용자 수' from users;

-- Group By 
-- : 테이블의 데이터를 특정 칼럼을 기준으로 그룹을 묶고 각 그룹에 대해 집계함수를 적용하여 소계를 계산

-- users 테이블에서 status 별로 사용자가 몇 명인지 조회
select status, count(*) as '총 사용자 수' from users group by status;

-- courses 테이블에서 각 교육자가 몇 개의 과정을 개설했는지 조회
select author_id, count(*) as '개설한 과정 수' from courses group by author_id;

-- having
-- where 절처럼 조건을 작성할 때 기술한다
-- 가장 큰 차이점은 where은 데이터를 그룹화 하기 전에,
-- having은 그룹화 후에 집계함수를 계산한 후에 필터링 한다 

-- 개설 강좌 수가 3개 이상인 author_id와 개설 강좌 수만 조회
select author_id, count(*) as '개설한 과정 수' from courses group by author_id having count(*)>=3;

-- 'completed' 상태인 과정 중에서, 2명 이상의 학생이 등록한 과정(course_id)과 해당 학생 수를 조회한다.
select course_id, count(*) as '등록학생 수' from enrollments where status = 'completed' group by course_id  having count(*)>=2 
order by count(*) desc;

-- 2024년에 가입한 사용자들 중에 월별 가입자 수가 15명 이상인 월과 해당 월의 가입자 수를 조회
-- 월별로 데이터를 그룹화 해야하는데 실제 created_at 칼럼은 일과 시간도 포함되어 있다 
-- 따라서 우리는 create_at 칼럼의 데이터를 format 후 그룹화 할 것이다 
-- 내장 함수 맛보기 DATE_FORMAT(날짜 , 형식) 날짜 데이터를 원하는 문자열 형식으로 바꿔주는 함수
select DATE_FORMAT(created_at,'%Y-%m') as '가입 월', count(*) as '가입자 수' 
from users 
where created_at between ' 2024-01-01' and '2024-12-31' 
-- where created_at >= '2024-01-01' and created_at < '2025-01-01'
group by `가입 월` having `가입자 수` >=15;
