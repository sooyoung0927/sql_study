-- 데이터 조작어 (Data Manipulation Language)
-- DML 이란?
-- 테이블의 데이터를 관리하고 조작하기 위한 SQL의 한 구문이다
-- 데이터의 전체 생명주기, 즉 생성 수정 삭제를 담당하며 빈번하게 사용되는 명령어이다

-- 1. INSERT : 테이블에 새로운 헹을 추가한다
-- 2. UPDATE : 기존 행의 열 값을 수정한다
-- 3. DELETE : 테이블에서 특정 행을 삭제한다 

use wanted_lms;

-- 기존에 사용 중인 예약어가 있다면 백틱으로 감싸서 사용 가능하다
INSERT INTO users (`email`, `name`) VALUES ('sooyoung01@gmail.com','임수영');
INSERT INTO users (`email`, `name`) VALUES ('sooyoung02@gmail.com','임수영영');

-- 에러케이스 확인
-- 데이터를 삽입할 때 에러가 정말 많이 발생한다
-- 항상 확인해야하는 것은 기존 테이블 생성 시 작성된 제약조건
-- email은 unique 제약조건이 걸려있기 때문에 중복된 이메일은 허용하지 않는다
INSERT INTO users (`email`, `name`) VALUES ('sooyoung01@gmail.com','신규회원');

-- 에러케이스 확인 
-- name 컬럼은 NotNull 제약조건이 걸려있으며, Default 설정이 안 되어있다
-- 따라서 insert 시 값을 전달해주지 않으면 1364 에러가 발생한다
INSERT INTO users (`email`, `name`) VALUES ('sooyoung03@gmail.com');

-- foreign key 참조 무결성 제약조건 삽입
INSERT INTO courses (`author_id`, `title`, `description`) VALUES (1, '새로운 제목','설명구문');

-- 에러케이스 
-- users 테이블에 존재하지 않는 user_id(999)를 author_id로 사용하고 있다alter
-- 에러의 원인은 courses 테이블의 author_id는 실제 users 테이블의 user_id를 참조하는 외래키 제약조건을 가지고 있기 때문이다 
INSERT INTO courses (`author_id`, `title`, `description`) VALUES (999, '새로운 제목','설명구문');

-- INSERT INTO 삽입할 테이블 명 (칼럼명) VALUES (삽입할 값)


-- UPDATE 
-- 이미 존재하는 행에 데이터를 새로운 값으로 변경하는 명령어이다
-- 예) 홍길동 학생의 이름을 김홍도로 개명하거나 과정의 설명이 변경될 때 사용된다

-- 테이블 정보 확인용 구문
SELECT*FROM users;
-- UPDATE 시 가장 유의해야하는 점
-- WHERE 조건절을 생략하게 되면 테이블의 모든 행이 SET 한 값으로 변경되는 대참사가 일어난다
-- 따라서 실무에서는 UPDATE 전, WHERE 조건절로 SELECT 를 진행한 후 작성하게 된다.
UPDATE users SET `name` = '김홍도' WHERE `user_id`=1;

-- 여러 업데이트를 한꺼번에 하는 법
UPDATE courses 
SET `status` = 'published', 
	`description` = 'SQL 입문' 
WHERE `course_id`=1;

-- DELETE
-- 테이블에서 특정 행을 삭제하는 명령어이다
-- 사용자가 탈퇴하거나 게시글을 삭제했거나 과정이 폐강될 때 사용한다
-- DELETE 절에서 WHERE 조건절을 작성하지 않으면 모든 데이터가 삭제된다
-- 따라서 UPDATE 구문과 마찬가지로 SELECT 를 통해 삭제 대상을 우석 탐색하는 게 매우 중요하다
DELETE FROM users WHERE email ='sooyoung01@gmail.com';

-- 에러케이스 
-- user_id=1 인 사용자는 courses 테이블에서 참조하고 있다 
-- user 테이블에서 courses 테이블에 user_id 칼럼을 외래키로 주고 있다
-- 자식 테이블 = courses / 부모 테이블 = user
-- 부모 테이블에 값을 삭제하려면, 외래키 제약조건에 의해 삭제가 거부 된다 
-- 거부되는 이유는 '고아 데이터(작성자가 없는 데이터)' 발생을 막기 위함이다 
DELETE FROM users WHERE user_id = 1;




