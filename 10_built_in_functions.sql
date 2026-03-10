-- 문자열, 숫자, 날짜, 조건함수 등 가장 많이 쓰이는 내장 함수를 학습한다 
use wanted_lms;

-- 문자열 관련 내장함수
-- concat : 여러 문자열을 하나로 함치기
-- users 테이블에서 사용자의 이름, 이메일, 이름+ 이메일은 조회하라
select name, email, concat(name,'(',email,')')as '이름(이메일)' from users;

-- substr : 문자열 일부를 잘라낸다
-- substr(문자열, 시작위치, 길이)
-- locate : 특정 문자열이 다른 문자열 내부에서 처음으로 나타나는 위치 반환 
-- 이메일의 @앞부분만 출력하기 
select email, substr(email, 1, locate('@',email)-1) as '이메일 id' from users;

-- length / char_length
-- 바이트 단위 / 글자수 단위 
select name, length(name) as '이름(byte)', char_length(name) as '이름 글자수' from users;

-- replace : 문자열의 일부를 다른 문자열로 바꾼다
select email, replace(email,'example.com','wanted.com') as '바뀐 이메일' from users;


-- 숫자 관련 내장 함수
-- round, ceil, floor 
-- 반올림, 올림, 내림
select score, round(score)  ,round(score,1), ceil(score) , floor(score) from grades where grade_id=7;

-- 날짜 및 시간 관련 내장 함수 
-- now, curdate, curtime
select now(), curdate(), curtime();
select created_at 원본날짜, year(created_at), month(created_at), day(created_at) from users;

-- date-format : 날짜 데이터를 원하는 문자열 형식으로 변환
-- (포멧팅 형식 : %Y(4자리년도), %m 월, %d 일, %H 24시, %i 분, %s초)
select created_at, date_format(created_at, '%Y년 %m월 %d일') as 가입일 from users;

-- 조건 함수 (빈도 높을 수 있음)
-- if-else

-- user_profiles 테이블에서 자기소개가 null인 경우 널 대신 '자기소개서 미작성' 이라고 표기하자
select user_id, ifnull(bio,'자기소개서 미작성') from user_profiles;

-- case : 복잡한 조건부 로직을 작성한다
-- courses 테이블의 status 값에 따라 '게시됨', '초안'으로 알아보기 쉽게 조회 
select title, status, 
       case
        when status = 'published' then '게시됨'
        when status = 'draft' then '초안'
        else status
        end as '과정상태'
from courses;

-- grade 테이블의 점수에 따라서 95점 이상은 A+ / 90 A / 85 B+ / 80 B / 70 c / d
select  u.name, g.score, case 
                     when g.score>=95 then 'A+'
                     when g.score>=90 then 'A'
                     when g.score>=85 then 'B+'
                     when g.score>=80 then 'B'
                     when g.score>=70 then 'C'
                     else 'D'
                     end
                     as grade 
from grades g join users u on g.user_id= u.user_id;