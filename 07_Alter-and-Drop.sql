use wanted_lms;

-- 테이블 구조 변경하기
-- 소프트웨어는 살아있는 유기체이다 
-- 서비스는 사용자의 요구, 개발자의 요구 등에 의해 계속 변화한다
-- 그에 따라 저장해야할 데이터의 종류도 변화하게 된다

-- alter table : 이미 만들어진 테이블 설계도를 수정할 수 있게 하는 명령어 
-- drop, truncate : 테이블의 데이터를 제거하는 명령어

-- 테이블 구조 변경을 확인하기 위한 임시 테이블 생성 
create table courses_temp as select * from courses;

-- 우리가 항상 sql 문제를 풀 때 테이블 구조를 확인한다
-- 테이블 구조 확인 구문
desc courses_temp;
show create table courses_temp;

-- 칼럼 추가하기
alter table courses_temp 
add column price int not null default 0;

-- 기존에 있는 열 수정
alter table courses_temp
modify column title varchar(500);

-- 열 삭제
alter table courses_temp
drop column status; 

-- 테이블 데이터 및 구조 삭제
-- delete, drop, truncate
-- delete : dml 조작어로 행 단위 삭제, where 절로 특정 행만 삭제 가능
-- 단점 : 느리다 / 장점 : 삭제 기록(log) 를 남겨 롤백이 가능하다

-- drop : ddl 정의어로 테이블의 데이터와 구조 자체를 영구적으로 삭제
-- 장점 : 매우 빠름 / 단점 : 롤백 불가, 신중하게 사용해야 함 

-- truncate : ddl 정의어로 테이블의 구조는 남기고 내부 데이터를 삭제
-- 테이블의 구조는 남기고 데이터를 초기화할 때 사용

desc courses_temp;
select * from courses_temp;

-- 해당 테이블의 데이터 초기화
truncate table courses_temp;

-- drop 영구 삭제
drop table courses_temp;

