-- 데이터베이스를 설치하면, root 라는 사용자가 주어지게 된다.
-- root 는 마스터 키 같은 존재이다.
-- 실무에서는 최소 권한의 원칙에 의해 하나의 프로젝트 데이터베이스를 만들 때 모든 권한을 가지고 있는 root 에 데이터베이스를 만드는 것이 아닌,
-- 반드시 필요한 권한만 가진 최소의 connection 을 만들어서 데이터베이스를 구축하게 된다.

-- 기존 데이터베이스 삭제 (있다면)
DROP DATABASE IF EXISTS WANTED_LMS;


-- 새로운 데이터베이스 생성
CREATE DATABASE WANTED_LMS;

-- SQL 계정 생성.
-- @'호스트' <- 해당 호스트에 포함하지 않은 대상은 접속이 제한된다.
-- localhost : 나의 로컬 환경에서만 가능
-- % : 모든 원격에서 접속가능
-- 특정 ip : 해당 ip 및 local에서 접속가능
create user 'wanted'@'%' IDENTIFIED BY 'wanted';


-- 계정 권한 부여
-- GRANT 권한을 부여하기 위한 명령문이다.
-- ALL PRIVILEGES 'root'계정과 비슷한 수준의 권한을 준다.
-- GRANT 권한목록 ON 데이터베이스.테이블 TO '사용자명'@'호스트';
-- 데이터베이스.*에서 *은 모든 테이블을 의미한다.
GRANT ALL PRIVILEGES ON WANTED_LMS.* TO 'wanted'@'%';


-- WANTED_LMS 사용
USE WANTED_LMS;

-- SHOW TABLES: 현재 테이블 목록 확인.
SHOW TABLES;      