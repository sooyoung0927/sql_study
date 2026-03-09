-- SELECT (조회)
-- SQL의 전부 -> 대부분의 작성 90% 이상이 SELECT 조회 구문이다
-- DDL(DataBase Create), DML(INSERT, UPDATE, DELETE)는 데이터를 저장하고 관리하기 위한 준비 작업에 가깝다

-- SELECT 구문은 관리 혹은 저장된 데이터를 어떤 식으로 활용할지 담당하는 명령어이다 
-- SELECT 구문의 핵심 두 가지
-- 1. 어떤 열을 가져올 것인가? (정보의 종류)
-- 2. 어떤 행을 가져올 것인가? (정보의 범위)

-- *: 에스터리스트라고 불리우며, 모든 열을 의미하는 와일드카드이다 
select * from users;

-- users 테이블에서 name과 email만 조회해보자
select `name`,`email` from users;

-- as : ALIAS 별칭 
select name as '사용자 이름', email as '이메일 주소' , created_at as ' 가입일' 
from users;

-- 중복된 값 제거하고 조회하기
-- distinct : 중복된 값을 제거하고 유일한 값만 조회한다 
select distinct role_id from user_roles;

-- where : 어떤 행을 가져올 것인가를 기술하는 필터링
-- where 절은 SQL의 심장 -> 수많은 데이터 속에서 원하는 조건의 데이터만 정확하게 필터링하는 
-- where를 얼마나 잘 사용하느냐에 따라 SQL의 성능과 정확성이 결정된다 

-- users 테이블에서 user의 status가 active가 아닌 모든 사용자의 user_id와 status를 조회
/*
비교연산자 
  = : 같다
  !=, <> : 같지 않다
  > < >= <= : 크다 작다 크거나같다 작거나같다
  LIKE : 특정 패턴을 포함한다
  IN : 목록 안의 값 중 하나와 일치한다
  BETWEEN : 두 값 사이의 범위에 있다
- 
*/
select user_id, status 
from users
where status != 'active';

-- users 테이블에서 user_id가 10보다 큰 사용자 조회
select * from users where user_id>10;

-- 24년 02월 01일에 가입한 회원을 모두 조회
-- between a and b 범위 조건을 통해 날짜를 지정
select * from users where created_at between '2024-02-01 00:00:00' and '2024-02-01 23:59:59';

-- 목록 조건(IN)
-- user_id가 1,5,10번인 사용자 정보 조회
select * from users where user_id not in(1,5,10);

-- 패턴 매칭 (LIKE)
-- 이름이 '김'으로 시작하는 모든 사용자 조회
-- % : 0글자 이상 
-- 김% : 김으로 시작하는 모든 문자열 의미
-- %철수 : 철수로 끝나는 모든 문자열 의미
-- %이% : 이를 포함하는 모든 문자열 의미
-- '_' : 정확하게 한 문자를 지정
-- 김_수 : 김으로 시작하고 수로 끝나는 세 글자 문자열 
select * from users where name like '김%';

-- 이메일 주소에 'jae' 라는 단어가 포함된 사용자의 이름과 이메일, status 를 조회하라
select name, email, status from users where email like '%jae%';

-- 널 값 확인 구문
-- is null : 해당 칼럼의 값이 비어있는 레코드 조회
-- is not null : 해당 칼럼의 값이 비어있지 않은 레코드 조회alter

-- user 테이블에서 user_id, 이름, 마지막 로그인 일시를 조회할건데
-- 마지막 로그인 일시가 널인 사용자만 조회
select user_id, name, last_login_at from users where last_login_at is null;

-- 놀리 연산자 and or not
-- AND : 둘 다 참이어야 참
-- OR : 둘 다 거짓할 때 거짓
-- NOT : 참과 거짓을 반전

-- 2024년 3월 이후에 가입하고 status가 active인 사용자의 이름과 이메일 조회
select name,user_id, email from users where created_at >= '2024-03-01' and status = 'active';

-- 성이 김이거나 활성사용자가 아닌 사용자의 이름, user_id, 이메일 조회
select name,user_id,email from users where name like '김%' or status <> 'active';

-- not 은 참을 거짓으로, 거짓을 참으로 반전시키는 연산자이다 
select name,user_id,email from users where not(name like '김%' or status <> 'active');


-- order by 와 limit
-- order by : 조회된 결과에 명확한 순서와 질서를 부여하는 기능
-- 예) 최신가입자 순서 , 이름 가나다 순서 등 정렬된 기능을 제공하여 사용자 입장에서 데이터를 쉽게 인지하도록 도와준다 

-- limit : 조회 결과의 갯수를 제한하는 기능
-- 수백만 건의 데이터를 한 번에 조회하게 되면 시스템 상에 큰 부하를 주게 된다 
-- 예) 상위 5개만 보기 , 한 페이지에 10개씩 보기 등 웹 어플리케이션의 페이징 기능을 구현하는 데에 필수 핵심 문법이다 

-- users 테이블에서 아이디, 이름, 가입입을 조회할건데 가장 최근에 가입한 순서대로 나열
select user_id, name, created_at from users order by created_at desc; 

-- users 테이블에서 아이디, 이름, 가입입을 조회할건데 가장 나중에 가입한 순서대로 나열
select user_id, name, created_at from users order by created_at asc; 

-- 가장 최근에 가입한 사용자 5명의 조회
-- order by + limit 조합
select * from users order by created_at desc limit 5;

-- 페이징 구현
-- 사용자 목록에 두 번째 페이지 (11~20) 를 조회한다
select * from users order by created_at asc limit 10,10;

-- 최종실습
-- 요구사항 : LXP 플랫폼의 운영팀에서 마케팅 이메일 발송 대상을 찾는다
-- 1. 2024 4월 또는 5월에 가입한 사용자
-- 2. 계정의 상태가 활성화 상태
-- 3. 이메일 주소가 'example.com'으로 끝나야한다
-- 4. 위 조건에 맞는 사용자들을 최근에 가입한 순서대로 정렬하여 두 번째 페이지에 해당하는 5명(6~10번째)의 user_id, name, email, created_at을 조회

-- sql에서 where 조건절의 연산 우선순위 
-- NOT > AND > OR
select user_id, name, email, created_at from users 
where (created_at between '2024-04-01' and '2024-05-31 23:59:59') and status = 'active' and email like '%example.com' 
order by created_at desc limit 5,5;

