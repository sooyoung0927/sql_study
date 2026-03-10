-- 각 쿼리문의 결과를 합치는 union

-- 시나리오 작성
-- 운영팀에서 시스템 점검 관련 전체 공지 메일은 발송해야한다 
-- 메일 발송 대상은 active 사용자와 suspended 사용자 모두이다 
-- 탈퇴한 deleted 유저는 제외한다 

-- active 유저 조회
-- suspended 유저 조회
-- 두 유저 조합 합치기
-- 단 합칠 때에는 조회하려는 칼럼 갯수가 동일해야한다 
-- 단 select 칼럼 순서와 데이터 타입이 호환 가능해야한다 

-- 수학의 합집합이며 중복된 행을 제거한다 > 순수한 합집합을 만든다 
select email, status from users where status = 'active'
union 
select email, status from users where status = 'suspended';

-- union all
select email, status from users where status = 'active'
union all
select email, status from users where status = 'suspended';


-- 퀴즈 응시
