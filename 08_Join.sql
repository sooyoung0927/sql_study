use wanted_lms;
-- 테이블 연결 (join) ★★★★★★★★
-- 테이블 정보는 각각의 테이블에 저장이 되어있다
-- 테이블을 나는 것은 정규화 라고 하며, 정규화에 의해 비슷한 종류의 데이터끼리 테이블을 구성하게 된다
-- join은 이렇게 분리된 테이블 중 공통으로 포함하는 값(주로 pk-fk) 을 기준으로 다시 합쳐서 의미 있는 결과 집합을 만들어낸다
 
-- inner join (두 테이블의 교집합)
-- 두 테이블을 연결할 때 양쪽 테이블에 모두 존재하는 데이터만을 보여준다 = 교집합 

select * from courses;
select * from users;
desc courses;
desc users;
show create table courses;

-- `` , '', "" 
-- `` : 칼럼명, 테이블명
-- '' : 문자열
-- "" : 문자열  

-- courses 테이블과 users 테이블을 조합하여 과정 제목과 그 과정을 만든 교육자의 이름을 조회하라
select c.title as '과정 제목' , u.name as '교육자명' 
from courses as c inner join users as u 
on c.author_id = u.user_id;

-- 테이블 3개 조인하기 
-- enrollments 테이블 기준으로 users, courses 를 연결하여 
-- 어떤 학생이 어떤 과정에 등록했는지 학생 이름과 과정 제목과 등록일을 조회하라 
select u.name as '학생 이름', c.title as '과정 제목' , e.enrolled_at as '등록일' 
from enrollments as e 
inner join users as u on e.user_id = u.user_id
inner join courses as c on c.course_id = e.course_id; 

-- left join 
-- inner join 은 양쪽에 모두 데이터가 있는 경우만 보여준다. (교집합)
-- 하지만 요구사항이 만약 과정을 하나도 개설하지 않은 교육자를 포함하여 모든 교육자 목록을 보고싶다 라는 것이라면 
select c.title as '과정 제목' , u.name as '교육자명' 
from users as u  left join courses as c
on c.author_id = u.user_id;

-- left 조인과 where 절을 사용해서 과정을 단 한번도 개설하지 않은 교육자 조회하기
-- 조회 시 이름 출력
select u.name 
from users as u left join courses as c on c.author_id = u.user_id
where c.title is null;

-- right join
-- left join과 반대로 오른쪽 테이블의 모든 데이터를 우선적으로 기준 삼는다 
-- 왼쪽 테이블의 경우 매칭되는 데이터가 없으면 널로 표기된다 

-- user 테이블을 기준으로 user_auth_provider 를 right 조인 하여 모든 사용자 이름과 연동된 로그인 제공자를 조회한다
select u.name, uap.provider 
from user_auth_providers as uap right join users as u 
on u.user_id = uap.user_id;

-- self join 
-- 하나의 테이블 안에 계층적인 관계가 포함될 때 
-- 예를들어, 댓글이 있고 대댓글이 있다라고 가정을 하면, 댓글과 대댓글 또한 댓글이다
-- 하지만 대댓글의 경우 부모 댓글에 대한 정보를 가져야 어떤 댓글의 대댓글인지 확인할 수 있다 

-- forum_posts 테이블 사용하여 self 조인을 진행하고 대댓글, 댓글 내용 조회 진행
-- self 조인이라는 키워드는 없지만 inner 조인으로 자기가 자기자신을 참조 
select parents.post_id as '원본 댓글 ID', child.post_id as '대댓글 ID', child.content as '대댓글 내용', parents.content '원본 댓글 내용' 
from forum_posts as parents join forum_posts as child
on parents.post_id = child.parent_post_id;
