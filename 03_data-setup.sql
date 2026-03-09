-- ------------------------------------------------------------------------------------
-- -- 외래 키 제약 조건 비활성화 (대량 데이터 입력 시 안정성 확보)
-- ------------------------------------------------------------------------------------
SET FOREIGN_KEY_CHECKS = 0;

-- ------------------------------------------------------------------------------------
-- -- 도메인 1: 사용자 및 인증 (User & Authentication) 데이터
-- -- 의존성 순서: roles -> users -> user_profiles -> user_roles -> user_auth_providers
-- ------------------------------------------------------------------------------------

-- roles 테이블 데이터
INSERT INTO `roles` (`role_id`, `name`) VALUES
(1, 'ROLE_LEARNER'),
(2, 'ROLE_EDUCATOR');

-- users 테이블 데이터 (120명)
INSERT INTO `users` (`user_id`, `email`, `password_hash`, `name`, `status`, `last_login_at`, `created_at`) 
VALUES
(1, 'gildong.hong@example.com', 'pbkdf2:sha256:150000$1a2b3c4d$a1b2c3d4e5f6a7b8c9d0e1f2a3b4c5d6', '홍길동', 'active', '2025-09-01 10:00:00', '2024-01-15 09:00:00'),
(2, 'cheolsu.kim@example.com', 'pbkdf2:sha256:150000$1a2b3c4d$a1b2c3d4e5f6a7b8c9d0e1f2a3b4c5d6', '김철수', 'active', '2025-09-02 11:30:00', '2024-01-16 14:20:00'),
(3, 'younghee.lee@example.com', 'pbkdf2:sha256:150000$1a2b3c4d$a1b2c3d4e5f6a7b8c9d0e1f2a3b4c5d6', '이영희', 'active', '2025-09-03 08:45:00', '2024-01-17 18:00:00'),
(4, 'minsu.park@example.com', 'pbkdf2:sha256:150000$1a2b3c4d$a1b2c3d4e5f6a7b8c9d0e1f2a3b4c5d6', '박민수', 'suspended', '2025-08-20 15:00:00', '2024-02-01 11:00:00'),
(5, 'soojin.choi@example.com', 'pbkdf2:sha256:150000$1a2b3c4d$a1b2c3d4e5f6a7b8c9d0e1f2a3b4c5d6', '최수진', 'active', '2025-09-04 14:00:00', '2024-02-05 16:30:00'),
(6, 'junho.jeong@example.com', 'pbkdf2:sha256:150000$1a2b3c4d$a1b2c3d4e5f6a7b8c9d0e1f2a3b4c5d6', '정준호', 'active', '2025-09-05 17:20:00', '2024-02-10 20:00:00'),
(7, 'eunji.kang@example.com', 'pbkdf2:sha256:150000$1a2b3c4d$a1b2c3d4e5f6a7b8c9d0e1f2a3b4c5d6', '강은지', 'active', '2025-09-06 09:10:00', '2024-02-11 22:15:00'),
(8, 'seongho.yoon@example.com', 'pbkdf2:sha256:150000$1a2b3c4d$a1b2c3d4e5f6a7b8c9d0e1f2a3b4c5d6', '윤성호', 'deleted', '2025-07-30 12:00:00', '2024-02-15 13:00:00'),
(9, 'jihye.han@example.com', 'pbkdf2:sha256:150000$1a2b3c4d$a1b2c3d4e5f6a7b8c9d0e1f2a3b4c5d6', '한지혜', 'active', '2025-09-07 11:00:00', '2024-02-20 10:40:00'),
(10, 'donghyun.lim@example.com', 'pbkdf2:sha256:150000$1a2b3c4d$a1b2c3d4e5f6a7b8c9d0e1f2a3b4c5d6', '임동현', 'active', '2025-09-08 13:50:00', '2024-03-01 19:00:00'),
(11, 'seoyeon.oh@example.com', 'pbkdf2:sha256:150000$1a2b3c4d$a1b2c3d4e5f6a7b8c9d0e1f2a3b4c5d6', '오서연', 'active', '2025-09-01 18:00:00', '2024-03-02 09:30:00'),
(12, 'minjun.jang@example.com', 'pbkdf2:sha256:150000$1a2b3c4d$a1b2c3d4e5f6a7b8c9d0e1f2a3b4c5d6', '장민준', 'active', '2025-09-02 20:10:00', '2024-03-03 11:00:00'),
(13, 'yujin.seo@example.com', 'pbkdf2:sha256:150000$1a2b3c4d$a1b2c3d4e5f6a7b8c9d0e1f2a3b4c5d6', '서유진', 'active', '2025-09-03 21:00:00', '2024-03-04 14:00:00'),
(14, 'gunwoo.kwon@example.com', 'pbkdf2:sha256:150000$1a2b3c4d$a1b2c3d4e5f6a7b8c9d0e1f2a3b4c5d6', '권건우', 'active', '2025-09-04 22:30:00', '2024-03-05 17:45:00'),
(15, 'haeun.hwang@example.com', 'pbkdf2:sha256:150000$1a2b3c4d$a1b2c3d4e5f6a7b8c9d0e1f2a3b4c5d6', '황하은', 'active', '2025-09-05 23:00:00', '2024-03-06 20:00:00'),
(16, 'jiwoo.song@example.com', 'pbkdf2:sha256:150000$1a2b3c4d$a1b2c3d4e5f6a7b8c9d0e1f2a3b4c5d6', '송지우', 'active', '2025-09-06 10:00:00', '2024-03-07 21:00:00'),
(17, 'doyoon.jung@example.com', 'pbkdf2:sha256:150000$1a2b3c4d$a1b2c3d4e5f6a7b8c9d0e1f2a3b4c5d6', '정도윤', 'active', '2025-09-07 12:30:00', '2024-03-08 23:00:00'),
(18, 'gaeun.shin@example.com', 'pbkdf2:sha256:150000$1a2b3c4d$a1b2c3d4e5f6a7b8c9d0e1f2a3b4c5d6', '신가은', 'active', '2025-09-08 14:00:00', '2024-03-09 10:00:00'),
(19, 'siwoo.ahn@example.com', 'pbkdf2:sha256:150000$1a2b3c4d$a1b2c3d4e5f6a7b8c9d0e1f2a3b4c5d6', '안시우', 'active', '2025-09-01 16:00:00', '2024-03-10 12:00:00'),
(20, 'seohyun.moon@example.com', 'pbkdf2:sha256:150000$1a2b3c4d$a1b2c3d4e5f6a7b8c9d0e1f2a3b4c5d6', '문서현', 'active', '2025-09-02 18:30:00', '2024-03-11 15:00:00'),
(21, 'yejun.son@example.com', 'pbkdf2:sha256:150000$1a2b3c4d$a1b2c3d4e5f6a7b8c9d0e1f2a3b4c5d6', '손예준', 'active', '2025-09-03 19:00:00', '2024-03-12 18:00:00'),
(22, 'hayoon.bae@example.com', 'pbkdf2:sha256:150000$1a2b3c4d$a1b2c3d4e5f6a7b8c9d0e1f2a3b4c5d6', '배하윤', 'active', '2025-09-04 20:00:00', '2024-03-13 21:00:00'),
(23, 'eunwoo.heo@example.com', 'pbkdf2:sha256:150000$1a2b3c4d$a1b2c3d4e5f6a7b8c9d0e1f2a3b4c5d6', '허은우', 'active', '2025-09-05 21:30:00', '2024-03-14 09:00:00'),
(24, 'jiho.noh@example.com', 'pbkdf2:sha256:150000$1a2b3c4d$a1b2c3d4e5f6a7b8c9d0e1f2a3b4c5d6', '노지호', 'active', '2025-09-06 22:00:00', '2024-03-15 11:00:00'),
(25, 'yoonseo.im@example.com', 'pbkdf2:sha256:150000$1a2b3c4d$a1b2c3d4e5f6a7b8c9d0e1f2a3b4c5d6', '임윤서', 'active', '2025-09-07 23:10:00', '2024-03-16 13:00:00'),
(26, 'junseo.cho@example.com', 'pbkdf2:sha256:150000$1a2b3c4d$a1b2c3d4e5f6a7b8c9d0e1f2a3b4c5d6', '조준서', 'active', '2025-09-08 09:00:00', '2024-03-17 16:00:00'),
(27, 'minseo.kang@example.com', 'pbkdf2:sha256:150000$1a2b3c4d$a1b2c3d4e5f6a7b8c9d0e1f2a3b4c5d6', '강민서', 'active', '2025-09-01 10:30:00', '2024-03-18 19:00:00'),
(28, 'yubin.yoo@example.com', 'pbkdf2:sha256:150000$1a2b3c4d$a1b2c3d4e5f6a7b8c9d0e1f2a3b4c5d6', '유유빈', 'active', '2025-09-02 12:00:00', '2024-03-19 22:00:00'),
(29, 'jian.jin@example.com', 'pbkdf2:sha256:150000$1a2b3c4d$a1b2c3d4e5f6a7b8c9d0e1f2a3b4c5d6', '진지안', 'active', '2025-09-03 13:45:00', '2024-03-20 08:00:00'),
(30, 'hyunwoo.na@example.com', 'pbkdf2:sha256:150000$1a2b3c4d$a1b2c3d4e5f6a7b8c9d0e1f2a3b4c5d6', '나현우', 'active', '2025-09-04 15:00:00', '2024-03-21 10:00:00'),
(31, 'sua.cha@example.com', 'pbkdf2:sha256:150000$1a2b3c4d$a1b2c3d4e5f6a7b8c9d0e1f2a3b4c5d6', '차수아', 'active', '2025-09-05 16:30:00', '2024-04-01 12:00:00'),
(32, 'geonu.ryu@example.com', 'pbkdf2:sha256:150000$1a2b3c4d$a1b2c3d4e5f6a7b8c9d0e1f2a3b4c5d6', '류건우', 'active', '2025-09-06 18:00:00', '2024-04-02 14:00:00'),
(33, 'arin.byun@example.com', 'pbkdf2:sha256:150000$1a2b3c4d$a1b2c3d4e5f6a7b8c9d0e1f2a3b4c5d6', '변아린', 'active', '2025-09-07 19:30:00', '2024-04-03 16:00:00'),
(34, 'seojun.go@example.com', 'pbkdf2:sha256:150000$1a2b3c4d$a1b2c3d4e5f6a7b8c9d0e1f2a3b4c5d6', '고서준', 'active', '2025-09-08 21:00:00', '2024-04-04 18:00:00'),
(35, 'yeeun.um@example.com', 'pbkdf2:sha256:150000$1a2b3c4d$a1b2c3d4e5f6a7b8c9d0e1f2a3b4c5d6', '엄예은', 'active', '2025-09-01 22:30:00', '2024-04-05 20:00:00'),
(36, 'sihyun.jo@example.com', 'pbkdf2:sha256:150000$1a2b3c4d$a1b2c3d4e5f6a7b8c9d0e1f2a3b4c5d6', '조시현', 'active', '2025-09-02 09:30:00', '2024-04-06 22:00:00'),
(37, 'jiyul.hong@example.com', 'pbkdf2:sha256:150000$1a2b3c4d$a1b2c3d4e5f6a7b8c9d0e1f2a3b4c5d6', '홍지율', 'active', '2025-09-03 11:30:00', '2024-04-07 09:00:00'),
(38, 'seonwoo.gil@example.com', 'pbkdf2:sha256:150000$1a2b3c4d$a1b2c3d4e5f6a7b8c9d0e1f2a3b4c5d6', '길선우', 'active', '2025-09-04 13:00:00', '2024-04-08 11:00:00'),
(39, 'chaeun.ma@example.com', 'pbkdf2:sha256:150000$1a2b3c4d$a1b2c3d4e5f6a7b8c9d0e1f2a3b4c5d6', '마채은', 'active', '2025-09-05 14:45:00', '2024-04-09 13:00:00'),
(40, 'yihan.pi@example.com', 'pbkdf2:sha256:150000$1a2b3c4d$a1b2c3d4e5f6a7b8c9d0e1f2a3b4c5d6', '표이한', 'active', '2025-09-06 16:00:00', '2024-04-10 15:00:00'),
(41, 'hyejin.kim@example.com', 'pbkdf2:sha256:150000$1a2b3c4d$a1b2c3d4e5f6a7b8c9d0e1f2a3b4c5d6', '김혜진', 'active', '2025-09-01 14:00:00', '2024-04-11 17:00:00'),
(42, 'seungmin.lee@example.com', 'pbkdf2:sha256:150000$1a2b3c4d$a1b2c3d4e5f6a7b8c9d0e1f2a3b4c5d6', '이승민', 'active', '2025-09-02 15:30:00', '2024-04-12 19:00:00'),
(43, 'jiyeon.park@example.com', 'pbkdf2:sha256:150000$1a2b3c4d$a1b2c3d4e5f6a7b8c9d0e1f2a3b4c5d6', '박지연', 'active', '2025-09-03 17:00:00', '2024-04-13 21:00:00'),
(44, 'hyunsoo.choi@example.com', 'pbkdf2:sha256:150000$1a2b3c4d$a1b2c3d4e5f6a7b8c9d0e1f2a3b4c5d6', '최현수', 'active', '2025-09-04 18:30:00', '2024-04-14 23:00:00'),
(45, 'sunyoung.jeong@example.com', 'pbkdf2:sha256:150000$1a2b3c4d$a1b2c3d4e5f6a7b8c9d0e1f2a3b4c5d6', '정선영', 'active', '2025-09-05 20:00:00', '2024-04-15 08:00:00'),
(46, 'sanghoon.kang@example.com', 'pbkdf2:sha256:150000$1a2b3c4d$a1b2c3d4e5f6a7b8c9d0e1f2a3b4c5d6', '강상훈', 'active', '2025-09-06 21:30:00', '2024-04-16 10:00:00'),
(47, 'miyoung.yoon@example.com', 'pbkdf2:sha256:150000$1a2b3c4d$a1b2c3d4e5f6a7b8c9d0e1f2a3b4c5d6', '윤미영', 'active', '2025-09-07 23:00:00', '2024-04-17 12:00:00'),
(48, 'kyungmin.han@example.com', 'pbkdf2:sha256:150000$1a2b3c4d$a1b2c3d4e5f6a7b8c9d0e1f2a3b4c5d6', '한경민', 'active', '2025-09-08 10:00:00', '2024-04-18 14:00:00'),
(49, 'seunghyun.lim@example.com', 'pbkdf2:sha256:150000$1a2b3c4d$a1b2c3d4e5f6a7b8c9d0e1f2a3b4c5d6', '임승현', 'active', '2025-09-01 11:30:00', '2024-04-19 16:00:00'),
(50, 'jisoo.oh@example.com', 'pbkdf2:sha256:150000$1a2b3c4d$a1b2c3d4e5f6a7b8c9d0e1f2a3b4c5d6', '오지수', 'active', '2025-09-02 13:00:00', '2024-04-20 18:00:00'),
(51, 'dohyun.jang@example.com', 'pbkdf2:sha256:150000$1a2b3c4d$a1b2c3d4e5f6a7b8c9d0e1f2a3b4c5d6', '장도현', 'active', '2025-09-01 10:15:00', '2024-05-01 09:00:00'),
(52, 'soyeon.seo@example.com', 'pbkdf2:sha256:150000$1a2b3c4d$a1b2c3d4e5f6a7b8c9d0e1f2a3b4c5d6', '서소연', 'active', '2025-09-02 12:45:00', '2024-05-02 10:30:00'),
(53, 'jaewon.kwon@example.com', 'pbkdf2:sha256:150000$1a2b3c4d$a1b2c3d4e5f6a7b8c9d0e1f2a3b4c5d6', '권재원', 'active', '2025-09-03 14:20:00', '2024-05-03 11:45:00'),
(54, 'eunseo.hwang@example.com', 'pbkdf2:sha256:150000$1a2b3c4d$a1b2c3d4e5f6a7b8c9d0e1f2a3b4c5d6', '황은서', 'suspended', '2025-08-15 11:00:00', '2024-05-04 13:00:00'),
(55, 'taemin.song@example.com', 'pbkdf2:sha256:150000$1a2b3c4d$a1b2c3d4e5f6a7b8c9d0e1f2a3b4c5d6', '송태민', 'active', '2025-09-05 16:00:00', '2024-05-05 14:15:00'),
(56, 'yuna.jung@example.com', 'pbkdf2:sha256:150000$1a2b3c4d$a1b2c3d4e5f6a7b8c9d0e1f2a3b4c5d6', '정유나', 'active', '2025-09-06 17:30:00', '2024-05-06 15:30:00'),
(57, 'seojin.shin@example.com', 'pbkdf2:sha256:150000$1a2b3c4d$a1b2c3d4e5f6a7b8c9d0e1f2a3b4c5d6', '신서진', 'active', '2025-09-07 19:00:00', '2024-05-07 16:45:00'),
(58, 'jihoon.ahn@example.com', 'pbkdf2:sha256:150000$1a2b3c4d$a1b2c3d4e5f6a7b8c9d0e1f2a3b4c5d6', '안지훈', 'active', '2025-09-08 20:30:00', '2024-05-08 18:00:00'),
(59, 'chaewon.moon@example.com', 'pbkdf2:sha256:150000$1a2b3c4d$a1b2c3d4e5f6a7b8c9d0e1f2a3b4c5d6', '문채원', 'active', '2025-09-01 22:00:00', '2024-05-09 19:15:00'),
(60, 'minjae.son@example.com', 'pbkdf2:sha256:150000$1a2b3c4d$a1b2c3d4e5f6a7b8c9d0e1f2a3b4c5d6', '손민재', 'active', '2025-09-02 09:00:00', '2024-05-10 20:30:00'),
(61, 'seungho.bae@example.com', 'pbkdf2:sha256:150000$1a2b3c4d$a1b2c3d4e5f6a7b8c9d0e1f2a3b4c5d6', '배승호', 'active', '2025-09-03 10:30:00', '2024-05-11 21:45:00'),
(62, 'yeseo.heo@example.com', 'pbkdf2:sha256:150000$1a2b3c4d$a1b2c3d4e5f6a7b8c9d0e1f2a3b4c5d6', '허예서', 'active', '2025-09-04 12:00:00', '2024-05-12 23:00:00'),
(63, 'dongjun.noh@example.com', 'pbkdf2:sha256:150000$1a2b3c4d$a1b2c3d4e5f6a7b8c9d0e1f2a3b4c5d6', '노동준', 'active', '2025-09-05 13:30:00', '2024-05-13 08:15:00'),
(64, 'soomin.im@example.com', 'pbkdf2:sha256:150000$1a2b3c4d$a1b2c3d4e5f6a7b8c9d0e1f2a3b4c5d6', '임수민', 'active', '2025-09-06 15:00:00', '2024-05-14 09:30:00'),
(65, 'woojin.cho@example.com', 'pbkdf2:sha256:150000$1a2b3c4d$a1b2c3d4e5f6a7b8c9d0e1f2a3b4c5d6', '조우진', 'active', '2025-09-07 16:30:00', '2024-05-15 10:45:00'),
(66, 'dayeon.kang@example.com', 'pbkdf2:sha256:150000$1a2b3c4d$a1b2c3d4e5f6a7b8c9d0e1f2a3b4c5d6', '강다연', 'active', '2025-09-08 18:00:00', '2024-05-16 12:00:00'),
(67, 'haejun.yoo@example.com', 'pbkdf2:sha256:150000$1a2b3c4d$a1b2c3d4e5f6a7b8c9d0e1f2a3b4c5d6', '유해준', 'active', '2025-09-01 19:30:00', '2024-05-17 13:15:00'),
(68, 'seoa.jin@example.com', 'pbkdf2:sha256:150000$1a2b3c4d$a1b2c3d4e5f6a7b8c9d0e1f2a3b4c5d6', '진서아', 'active', '2025-09-02 21:00:00', '2024-05-18 14:30:00'),
(69, 'geon.na@example.com', 'pbkdf2:sha256:150000$1a2b3c4d$a1b2c3d4e5f6a7b8c9d0e1f2a3b4c5d6', '나건', 'active', '2025-09-03 22:30:00', '2024-05-19 15:45:00'),
(70, 'yuri.cha@example.com', 'pbkdf2:sha256:150000$1a2b3c4d$a1b2c3d4e5f6a7b8c9d0e1f2a3b4c5d6', '차유리', 'active', '2025-09-04 09:45:00', '2024-05-20 17:00:00'),
(71, 'jeongwoo.ryu@example.com', 'pbkdf2:sha256:150000$1a2b3c4d$a1b2c3d4e5f6a7b8c9d0e1f2a3b4c5d6', '류정우', 'active', '2025-09-05 11:15:00', '2024-06-01 18:15:00'),
(72, 'hayul.byun@example.com', 'pbkdf2:sha256:150000$1a2b3c4d$a1b2c3d4e5f6a7b8c9d0e1f2a3b4c5d6', '변하율', 'active', '2025-09-06 12:45:00', '2024-06-02 19:30:00'),
(73, 'siwon.go@example.com', 'pbkdf2:sha256:150000$1a2b3c4d$a1b2c3d4e5f6a7b8c9d0e1f2a3b4c5d6', '고시원', 'active', '2025-09-07 14:15:00', '2024-06-03 20:45:00'),
(74, 'jiwoo.um@example.com', 'pbkdf2:sha256:150000$1a2b3c4d$a1b2c3d4e5f6a7b8c9d0e1f2a3b4c5d6', '엄지우', 'active', '2025-09-08 15:45:00', '2024-06-04 22:00:00'),
(75, 'minhyuk.jo@example.com', 'pbkdf2:sha256:150000$1a2b3c4d$a1b2c3d4e5f6a7b8c9d0e1f2a3b4c5d6', '조민혁', 'active', '2025-09-01 17:15:00', '2024-06-05 23:15:00'),
(76, 'narin.hong@example.com', 'pbkdf2:sha256:150000$1a2b3c4d$a1b2c3d4e5f6a7b8c9d0e1f2a3b4c5d6', '홍나린', 'active', '2025-09-02 18:45:00', '2024-06-06 08:30:00'),
(77, 'juwon.gil@example.com', 'pbkdf2:sha256:150000$1a2b3c4d$a1b2c3d4e5f6a7b8c9d0e1f2a3b4c5d6', '길주원', 'active', '2025-09-03 20:15:00', '2024-06-07 09:45:00'),
(78, 'yerin.ma@example.com', 'pbkdf2:sha256:150000$1a2b3c4d$a1b2c3d4e5f6a7b8c9d0e1f2a3b4c5d6', '마예린', 'active', '2025-09-04 21:45:00', '2024-06-08 11:00:00'),
(79, 'yeongjun.pi@example.com', 'pbkdf2:sha256:150000$1a2b3c4d$a1b2c3d4e5f6a7b8c9d0e1f2a3b4c5d6', '표영준', 'active', '2025-09-05 23:15:00', '2024-06-09 12:15:00'),
(80, 'soeun.kim@example.com', 'pbkdf2:sha256:150000$1a2b3c4d$a1b2c3d4e5f6a7b8c9d0e1f2a3b4c5d6', '김소은', 'active', '2025-09-06 10:00:00', '2024-06-10 13:30:00'),
(81, 'jaehyun.lee@example.com', 'pbkdf2:sha256:150000$1a2b3c4d$a1b2c3d4e5f6a7b8c9d0e1f2a3b4c5d6', '이재현', 'active', '2025-09-01 11:00:00', '2024-06-11 15:00:00'),
(82, 'minji.park@example.com', 'pbkdf2:sha256:150000$1a2b3c4d$a1b2c3d4e5f6a7b8c9d0e1f2a3b4c5d6', '박민지', 'active', '2025-09-02 12:30:00', '2024-06-12 16:30:00'),
(83, 'sungmin.choi@example.com', 'pbkdf2:sha256:150000$1a2b3c4d$a1b2c3d4e5f6a7b8c9d0e1f2a3b4c5d6', '최성민', 'active', '2025-09-03 14:00:00', '2024-06-13 18:00:00'),
(84, 'hyunjoo.jeong@example.com', 'pbkdf2:sha256:150000$1a2b3c4d$a1b2c3d4e5f6a7b8c9d0e1f2a3b4c5d6', '정현주', 'active', '2025-09-04 15:30:00', '2024-06-14 19:30:00'),
(85, 'dongwook.kang@example.com', 'pbkdf2:sha256:150000$1a2b3c4d$a1b2c3d4e5f6a7b8c9d0e1f2a3b4c5d6', '강동욱', 'active', '2025-09-05 17:00:00', '2024-06-15 21:00:00'),
(86, 'suji.yoon@example.com', 'pbkdf2:sha256:150000$1a2b3c4d$a1b2c3d4e5f6a7b8c9d0e1f2a3b4c5d6', '윤수지', 'active', '2025-09-06 18:30:00', '2024-06-16 22:30:00'),
(87, 'youngho.han@example.com', 'pbkdf2:sha256:150000$1a2b3c4d$a1b2c3d4e5f6a7b8c9d0e1f2a3b4c5d6', '한영호', 'active', '2025-09-07 20:00:00', '2024-06-17 09:00:00'),
(88, 'boomi.lim@example.com', 'pbkdf2:sha256:150000$1a2b3c4d$a1b2c3d4e5f6a7b8c9d0e1f2a3b4c5d6', '임보미', 'active', '2025-09-08 21:30:00', '2024-06-18 10:30:00'),
(89, 'junyoung.oh@example.com', 'pbkdf2:sha256:150000$1a2b3c4d$a1b2c3d4e5f6a7b8c9d0e1f2a3b4c5d6', '오준영', 'active', '2025-09-01 23:00:00', '2024-06-19 12:00:00'),
(90, 'sarah.jang@example.com', 'pbkdf2:sha256:150000$1a2b3c4d$a1b2c3d4e5f6a7b8c9d0e1f2a3b4c5d6', '장새라', 'active', '2025-09-02 09:15:00', '2024-06-20 13:30:00'),
(91, 'minho.seo@example.com', 'pbkdf2:sha256:150000$1a2b3c4d$a1b2c3d4e5f6a7b8c9d0e1f2a3b4c5d6', '서민호', 'active', '2025-09-03 10:45:00', '2024-07-01 15:00:00'),
(92, 'eunha.kwon@example.com', 'pbkdf2:sha256:150000$1a2b3c4d$a1b2c3d4e5f6a7b8c9d0e1f2a3b4c5d6', '권은하', 'active', '2025-09-04 12:15:00', '2024-07-02 16:30:00'),
(93, 'sangwoo.hwang@example.com', 'pbkdf2:sha256:150000$1a2b3c4d$a1b2c3d4e5f6a7b8c9d0e1f2a3b4c5d6', '황상우', 'active', '2025-09-05 13:45:00', '2024-07-03 18:00:00'),
(94, 'seulgi.song@example.com', 'pbkdf2:sha256:150000$1a2b3c4d$a1b2c3d4e5f6a7b8c9d0e1f2a3b4c5d6', '송슬기', 'active', '2025-09-06 15:15:00', '2024-07-04 19:30:00'),
(95, 'taehyun.jung@example.com', 'pbkdf2:sha256:150000$1a2b3c4d$a1b2c3d4e5f6a7b8c9d0e1f2a3b4c5d6', '정태현', 'active', '2025-09-07 16:45:00', '2024-07-05 21:00:00'),
(96, 'yujung.shin@example.com', 'pbkdf2:sha256:150000$1a2b3c4d$a1b2c3d4e5f6a7b8c9d0e1f2a3b4c5d6', '신유정', 'active', '2025-09-08 18:15:00', '2024-07-06 22:30:00'),
(97, 'junwoo.ahn@example.com', 'pbkdf2:sha256:150000$1a2b3c4d$a1b2c3d4e5f6a7b8c9d0e1f2a3b4c5d6', '안준우', 'active', '2025-09-01 19:45:00', '2024-07-07 09:00:00'),
(98, 'haein.moon@example.com', 'pbkdf2:sha256:150000$1a2b3c4d$a1b2c3d4e5f6a7b8c9d0e1f2a3b4c5d6', '문해인', 'active', '2025-09-02 21:15:00', '2024-07-08 10:30:00'),
(99, 'youngjae.son@example.com', 'pbkdf2:sha256:150000$1a2b3c4d$a1b2c3d4e5f6a7b8c9d0e1f2a3b4c5d6', '손영재', 'active', '2025-09-03 22:45:00', '2024-07-09 12:00:00'),
(100, 'chloe.bae@example.com', 'pbkdf2:sha256:150000$1a2b3c4d$a1b2c3d4e5f6a7b8c9d0e1f2a3b4c5d6', '배서아', 'active', '2025-09-04 09:00:00', '2024-07-10 13:30:00'),
(101, 'daniel.heo@example.com', 'pbkdf2:sha256:150000$1a2b3c4d$a1b2c3d4e5f6a7b8c9d0e1f2a3b4c5d6', '허다니엘', 'active', '2025-09-05 10:20:00', '2024-07-11 14:45:00'),
(102, 'elizabeth.noh@example.com', 'pbkdf2:sha256:150000$1a2b3c4d$a1b2c3d4e5f6a7b8c9d0e1f2a3b4c5d6', '노엘리자베스', 'deleted', '2025-08-01 00:00:00', '2024-07-12 16:00:00'),
(103, 'leo.im@example.com', 'pbkdf2:sha256:150000$1a2b3c4d$a1b2c3d4e5f6a7b8c9d0e1f2a3b4c5d6', '임레오', 'active', '2025-09-06 11:40:00', '2024-07-13 17:15:00'),
(104, 'grace.cho@example.com', 'pbkdf2:sha256:150000$1a2b3c4d$a1b2c3d4e5f6a7b8c9d0e1f2a3b4c5d6', '조은혜', 'active', '2025-09-07 13:00:00', '2024-07-14 18:30:00'),
(105, 'kevin.kang@example.com', 'pbkdf2:sha256:150000$1a2b3c4d$a1b2c3d4e5f6a7b8c9d0e1f2a3b4c5d6', '강케빈', 'active', '2025-09-08 14:20:00', '2024-07-15 19:45:00'),
(106, 'emily.yoo@example.com', 'pbkdf2:sha256:150000$1a2b3c4d$a1b2c3d4e5f6a7b8c9d0e1f2a3b4c5d6', '유에밀리', 'active', '2025-09-01 15:40:00', '2024-07-16 21:00:00'),
(107, 'peter.jin@example.com', 'pbkdf2:sha256:150000$1a2b3c4d$a1b2c3d4e5f6a7b8c9d0e1f2a3b4c5d6', '진피터', 'active', '2025-09-02 17:00:00', '2024-07-17 22:15:00'),
(108, 'cindy.na@example.com', 'pbkdf2:sha256:150000$1a2b3c4d$a1b2c3d4e5f6a7b8c9d0e1f2a3b4c5d6', '나신디', 'active', '2025-09-03 18:20:00', '2024-07-18 23:30:00'),
(109, 'brian.cha@example.com', 'pbkdf2:sha256:150000$1a2b3c4d$a1b2c3d4e5f6a7b8c9d0e1f2a3b4c5d6', '차브라이언', 'active', '2025-09-04 19:40:00', '2024-07-19 08:45:00'),
(110, 'jenny.ryu@example.com', 'pbkdf2:sha256:150000$1a2b3c4d$a1b2c3d4e5f6a7b8c9d0e1f2a3b4c5d6', '류제니', 'active', '2025-09-05 21:00:00', '2024-07-20 10:00:00'),
(111, 'alex.byun@example.com', 'pbkdf2:sha256:150000$1a2b3c4d$a1b2c3d4e5f6a7b8c9d0e1f2a3b4c5d6', '변알렉스', 'active', '2025-09-06 22:20:00', '2024-07-21 11:15:00'),
(112, 'susan.go@example.com', 'pbkdf2:sha256:150000$1a2b3c4d$a1b2c3d4e5f6a7b8c9d0e1f2a3b4c5d6', '고수잔', 'active', '2025-09-07 23:40:00', '2024-07-22 12:30:00'),
(113, 'john.um@example.com', 'pbkdf2:sha256:150000$1a2b3c4d$a1b2c3d4e5f6a7b8c9d0e1f2a3b4c5d6', '엄요한', 'active', '2025-09-08 08:00:00', '2024-07-23 13:45:00'),
(114, 'luna.jo@example.com', 'pbkdf2:sha256:150000$1a2b3c4d$a1b2c3d4e5f6a7b8c9d0e1f2a3b4c5d6', '조루나', 'active', '2025-09-01 09:20:00', '2024-07-24 15:00:00'),
(115, 'tom.hong@example.com', 'pbkdf2:sha256:150000$1a2b3c4d$a1b2c3d4e5f6a7b8c9d0e1f2a3b4c5d6', '홍톰', 'active', '2025-09-02 10:40:00', '2024-07-25 16:15:00'),
(116, 'anna.gil@example.com', 'pbkdf2:sha256:150000$1a2b3c4d$a1b2c3d4e5f6a7b8c9d0e1f2a3b4c5d6', '길안나', 'active', '2025-09-03 12:00:00', '2024-07-26 17:30:00'),
(117, 'eric.ma@example.com', 'pbkdf2:sha256:150000$1a2b3c4d$a1b2c3d4e5f6a7b8c9d0e1f2a3b4c5d6', '마에릭', 'active', '2025-09-04 13:20:00', '2024-07-27 18:45:00'),
(118, 'clara.pi@example.com', 'pbkdf2:sha256:150000$1a2b3c4d$a1b2c3d4e5f6a7b8c9d0e1f2a3b4c5d6', '표클라라', 'active', '2025-09-05 14:40:00', '2024-07-28 20:00:00'),
(119, 'james.kim@example.com', 'pbkdf2:sha256:150000$1a2b3c4d$a1b2c3d4e5f6a7b8c9d0e1f2a3b4c5d6', '김제임스', 'active', '2025-09-06 16:00:00', '2024-07-29 21:15:00'),
(120, 'lucy.lee@example.com', 'pbkdf2:sha256:150000$1a2b3c4d$a1b2c3d4e5f6a7b8c9d0e1f2a3b4c5d6', '이루시', 'active', '2025-09-07 17:20:00', '2024-07-30 22:30:00');

-- user_profiles 테이블 데이터
INSERT INTO `user_profiles` (`user_id`, `bio`, `avatar_url`, `learning_goal`) 
VALUES
(1, '데이터 과학과 머신러닝에 관심이 많은 개발자입니다.', 'https://example.com/avatars/user_1.png', '실무 데이터 분석 능력 향상'),
(2, '새로운 기술을 배우는 것을 좋아하는 학생입니다.', 'https://example.com/avatars/user_2.png', '풀스택 웹 개발자 되기'),
(3, '디자인과 코딩을 함께 공부하고 있습니다.', 'https://example.com/avatars/user_3.png', '인터랙티브 웹사이트 제작'),
(4, '경력 전환을 위해 프로그래밍을 배우고 있습니다.', 'https://example.com/avatars/user_4.png', '백엔드 개발자로 취업하기'),
(5, 'IT 기획자입니다. 개발 지식을 넓히고 싶습니다.', 'https://example.com/avatars/user_5.png', '개발자와 원활한 커뮤니케이션'),
(6, '알고리즘과 자료구조에 대해 깊이 있게 공부하고 싶습니다.', 'https://example.com/avatars/user_6.png', '코딩 테스트 통과 및 CS 기본기 강화'),
(7, '프론트엔드 개발자입니다. 최신 프레임워크를 익히고 있습니다.', 'https://example.com/avatars/user_7.png', 'React, Vue.js 마스터하기'),
(8, '모바일 앱 개발에 도전하고 있습니다.', 'https://example.com/avatars/user_8.png', '나만의 앱 출시하기'),
(9, '클라우드 기술과 DevOps에 관심이 많습니다.', 'https://example.com/avatars/user_9.png', 'AWS, Docker, Kubernetes 활용 능력 습득'),
(10, '보안 전문가를 꿈꾸고 있습니다.', 'https://example.com/avatars/user_10.png', '네트워크 및 시스템 보안 지식 함양'),
(11, '파이썬을 이용한 업무 자동화를 배우고 싶습니다.', 'https://example.com/avatars/user_11.png', '반복적인 사무업무 자동화'),
(12, '데이터베이스 설계와 SQL에 대해 배우고 있습니다.', 'https://example.com/avatars/user_12.png', '효율적인 데이터 관리 및 쿼리 작성'),
(13, '게임 개발에 관심이 있습니다.', 'https://example.com/avatars/user_13.png', 'Unity 엔진을 사용한 게임 제작'),
(14, '인공지능의 기초부터 응용까지 배우고 싶습니다.', 'https://example.com/avatars/user_14.png', '머신러닝 모델 개발 및 튜닝'),
(15, '디지털 마케팅과 데이터 분석을 접목하고 싶습니다.', 'https://example.com/avatars/user_15.png', '데이터 기반 마케팅 전략 수립'),
(16, 'UX/UI 디자인 원칙을 배우고 싶은 개발자입니다.', 'https://example.com/avatars/user_16.png', '사용자 친화적인 인터페이스 설계'),
(17, '블록체인 기술의 가능성을 탐구하고 있습니다.', 'https://example.com/avatars/user_17.png', '스마트 컨트랙트 개발'),
(18, 'R을 이용한 통계 분석을 공부하고 있습니다.', 'https://example.com/avatars/user_18.png', '통계적 데이터 분석 능력 강화'),
(19, '사물인터넷(IoT) 프로젝트를 해보고 싶습니다.', 'https://example.com/avatars/user_19.png', '임베디드 시스템 및 센서 데이터 처리'),
(20, '금융 데이터 분석에 관심이 있습니다.', 'https://example.com/avatars/user_20.png', '퀀트 트레이딩 시스템 개발 기초'),
(21, '자바와 스프링 프레임워크를 마스터하고 싶습니다.', 'https://example.com/avatars/user_21.png', '엔터프라이즈급 백엔드 시스템 구축'),
(22, 'C++로 고성능 컴퓨팅을 공부하고 싶습니다.', 'https://example.com/avatars/user_22.png', '알고리즘 최적화 및 성능 개선'),
(23, 'Node.js를 이용한 비동기 프로그래밍에 관심이 있습니다.', 'https://example.com/avatars/user_23.png', '실시간 웹 애플리케이션 개발'),
(24, '타입스크립트를 배워 코드의 안정성을 높이고 싶습니다.', 'https://example.com/avatars/user_24.png', '대규모 자바스크립트 프로젝트 관리'),
(25, 'Go 언어의 동시성 프로그래밍을 배우고 싶습니다.', 'https://example.com/avatars/user_25.png', '분산 시스템 및 마이크로서비스 아키텍처 이해'),
(26, '코틀린으로 안드로이드 앱을 개발하고 있습니다.', 'https://example.com/avatars/user_26.png', '안드로이드 최신 개발 트렌드 습득'),
(27, 'Swift를 이용한 iOS 앱 개발을 배우고 싶습니다.', 'https://example.com/avatars/user_27.png', 'iOS 앱 개발 및 앱스토어 출시'),
(28, '데이터 시각화 기술을 향상시키고 싶습니다.', 'https://example.com/avatars/user_28.png', 'D3.js, Chart.js 등을 활용한 인터랙티브 대시보드 제작'),
(29, '자연어 처리(NLP) 기술에 대해 공부하고 있습니다.', 'https://example.com/avatars/user_29.png', '챗봇, 텍스트 분석 시스템 개발'),
(30, '컴퓨터 비전 기술을 배우고 싶습니다.', 'https://example.com/avatars/user_30.png', '이미지 인식 및 객체 탐지 모델 개발'),
(31, '강화학습의 기초를 다지고 싶습니다.', 'https://example.com/avatars/user_31.png', '게임 AI 및 최적화 문제 해결'),
(32, '웹 접근성에 대해 배우고 싶은 프론트엔드 개발자입니다.', 'https://example.com/avatars/user_32.png', '모든 사용자를 위한 웹사이트 만들기'),
(33, 'GraphQL을 이용한 API 설계에 관심이 있습니다.', 'https://example.com/avatars/user_33.png', '효율적인 데이터 통신 API 구축'),
(34, 'Rust 언어의 안정성과 성능에 매력을 느낍니다.', 'https://example.com/avatars/user_34.png', '시스템 프로그래밍 역량 강화'),
(35, 'IT 프로젝트 관리 방법론을 배우고 싶습니다.', 'https://example.com/avatars/user_35.png', '애자일, 스크럼 프로세스 이해'),
(36, 'MSA(마이크로서비스 아키텍처)를 공부하고 있습니다.', 'https://example.com/avatars/user_36.png', '확장성 높은 서비스 설계 및 구축'),
(37, '서버리스 아키텍처에 대해 배우고 싶습니다.', 'https://example.com/avatars/user_37.png', 'AWS Lambda, Google Cloud Functions 활용'),
(38, 'SQL 쿼리 최적화에 대해 깊이있게 공부하고 싶습니다.', 'https://example.com/avatars/user_38.png', '대용량 데이터베이스 성능 개선'),
(39, 'NoSQL 데이터베이스를 활용하는 방법을 배우고 싶습니다.', 'https://example.com/avatars/user_39.png', 'MongoDB, Redis 등 비관계형 데이터베이스 사용법'),
(40, '데이터 파이프라인 구축에 관심이 있습니다.', 'https://example.com/avatars/user_40.png', 'Airflow, Kafka를 이용한 데이터 엔지니어링'),
(41, '새로운 기술을 탐구하는 것을 즐깁니다.', 'https://example.com/avatars/user_41.png', '다양한 프로그래밍 언어 및 프레임워크 경험'),
(42, '개발과 비즈니스의 연결고리를 찾고 있습니다.', 'https://example.com/avatars/user_42.png', '기술을 활용한 비즈니스 문제 해결'),
(43, '코딩을 통해 창의적인 아이디어를 실현하고 싶습니다.', 'https://example.com/avatars/user_43.png', '토이 프로젝트 진행 및 프로토타이핑'),
(44, '오픈소스 프로젝트에 기여하고 싶습니다.', 'https://example.com/avatars/user_44.png', 'Git, GitHub 활용 및 협업 능력 향상'),
(45, '기술 블로그를 운영하며 지식을 공유하고 있습니다.', 'https://example.com/avatars/user_45.png', '정확하고 깊이 있는 기술 콘텐츠 작성'),
(46, '컴퓨터 공학 전공 학생입니다. 기초를 탄탄히 하고 싶습니다.', 'https://example.com/avatars/user_46.png', '운영체제, 네트워크 등 CS 핵심 과목 이해'),
(47, '비전공자 출신 개발자입니다. 부족한 부분을 채우고 싶습니다.', 'https://example.com/avatars/user_47.png', '자료구조, 알고리즘, 컴퓨터 아키텍처 공부'),
(48, '품질 좋은 코드를 작성하는 방법을 배우고 싶습니다.', 'https://example.com/avatars/user_48.png', '클린 코드, 리팩토링, 테스트 주도 개발(TDD) 습득'),
(49, '개발 생산성을 높이는 도구에 관심이 많습니다.', 'https://example.com/avatars/user_49.png', 'IDE, 디버거, 빌드 도구 등 효율적으로 사용하기'),
(50, '팀 프로젝트를 성공적으로 이끌고 싶습니다.', 'https://example.com/avatars/user_50.png', '소프트웨어 아키텍처 설계 및 리더십 함양'),
(51, '안녕하세요, 꾸준히 배우는 개발자입니다.', 'https://example.com/avatars/user_51.png', '최신 웹 기술 트렌드 따라가기'),
(52, '데이터 분석으로 인사이트를 찾는 것을 좋아합니다.', 'https://example.com/avatars/user_52.png', 'Python(Pandas, Scikit-learn) 숙련도 향상'),
(53, '백엔드 시스템의 안정적인 운영에 관심이 많습니다.', 'https://example.com/avatars/user_53.png', '시스템 모니터링 및 로깅, 트러블슈팅 능력 배양'),
(54, '새로운 도전을 즐기는 기획자입니다.', 'https://example.com/avatars/user_54.png', '데이터 기반의 서비스 기획 능력 강화'),
(55, '함수형 프로그래밍에 대해 공부하고 있습니다.', 'https://example.com/avatars/user_55.png', 'Scala, Haskell 등 함수형 언어 학습'),
(56, '3D 모델링과 렌더링 기술을 배우고 싶습니다.', 'https://example.com/avatars/user_56.png', 'Blender, Three.js 활용'),
(57, 'VR/AR 콘텐츠 개발에 관심이 있습니다.', 'https://example.com/avatars/user_57.png', 'Unity, Unreal Engine을 사용한 XR 개발'),
(58, '로보틱스 분야를 공부하고 싶은 학생입니다.', 'https://example.com/avatars/user_58.png', 'ROS(Robot Operating System) 학습'),
(59, '금융공학(Financial Engineering)을 공부하고 있습니다.', 'https://example.com/avatars/user_59.png', '파생상품 모델링 및 리스크 관리'),
(60, '생물정보학(Bioinformatics)에 관심이 있습니다.', 'https://example.com/avatars/user_60.png', '유전체 데이터 분석'),
(61, '안녕하세요. 함께 성장하고 싶습니다.', 'https://example.com/avatars/user_61.png', '협업 능력과 커뮤니케이션 스킬 향상'),
(62, '코딩 교육 분야에 관심이 많습니다.', 'https://example.com/avatars/user_62.png', '효과적인 프로그래밍 교육 방법론 연구'),
(63, '기술로 사회 문제를 해결하고 싶습니다.', 'https://example.com/avatars/user_63.png', '소셜 임팩트를 위한 프로젝트 참여'),
(64, '데이터 저널리즘에 대해 공부하고 있습니다.', 'https://example.com/avatars/user_64.png', '데이터를 활용한 스토리텔링'),
(65, 'MMLOps에 대해 배우고 싶습니다.', 'https://example.com/avatars/user_65.png', '머신러닝 모델의 배포 및 운영 자동화'),
(66, '추천 시스템의 원리를 이해하고 직접 만들어보고 싶습니다.', 'https://example.com/avatars/user_66.png', '협업 필터링, 콘텐츠 기반 필터링 등 추천 알고리즘 구현'),
(67, '검색 엔진의 작동 원리에 대해 공부하고 있습니다.', 'https://example.com/avatars/user_67.png', 'Elasticsearch, Solr 등 검색 솔루션 활용'),
(68, 'A/B 테스트를 통한 서비스 개선에 관심이 있습니다.', 'https://example.com/avatars/user_68.png', '통계적 가설 검정 및 데이터 기반 의사결정'),
(69, '그로스 해킹에 대해 배우고 싶습니다.', 'https://example.com/avatars/user_69.png', '사용자 데이터 분석을 통한 서비스 성장 전략 수립'),
(70, '퍼블릭 스피킹 능력을 키우고 싶은 개발자입니다.', 'https://example.com/avatars/user_70.png', '기술 컨퍼런스 및 밋업 발표'),
(71, '코딩을 처음 시작하는 비전공자입니다.', 'https://example.com/avatars/user_71.png', '프로그래밍의 기초 개념과 논리적 사고력 기르기'),
(72, '정보처리기사 자격증을 준비하고 있습니다.', 'https://example.com/avatars/user_72.png', '자격증 취득에 필요한 CS 지식 습득'),
(73, '사이드 프로젝트를 함께 할 동료를 찾고 있습니다.', 'https://example.com/avatars/user_73.png', '팀워크 및 프로젝트 관리 경험 쌓기'),
(74, '프리랜서 개발자로 활동하고 싶습니다.', 'https://example.com/avatars/user_74.png', '다양한 프로젝트 경험과 기술 스택 확장'),
(75, '해외 취업을 목표로 공부하고 있습니다.', 'https://example.com/avatars/user_75.png', '영어 실력 및 글로벌 수준의 개발 역량 확보'),
(76, '안녕하세요, 배움에는 끝이 없다고 생각합니다.', 'https://example.com/avatars/user_76.png', '지속적인 자기계발 및 학습'),
(77, '개발 관련 서적을 꾸준히 읽고 있습니다.', 'https://example.com/avatars/user_77.png', '이론적 깊이와 실무 능력의 조화'),
(78, '안녕하세요, 열심히 배우겠습니다.', 'https://example.com/avatars/user_78.png', '기초부터 차근차근 실력 쌓기'),
(79, '미래 기술에 대한 탐구를 즐깁니다.', 'https://example.com/avatars/user_79.png', '양자 컴퓨팅, 인공 일반 지능(AGI) 등 신기술 동향 파악'),
(80, '코딩을 통해 세상을 바꾸고 싶습니다.', 'https://example.com/avatars/user_80.png', '혁신적인 서비스와 제품 개발'),
(81, '데이터 엔지니어링의 세계에 빠져있습니다.', 'https://example.com/avatars/user_81.png', '대용량 데이터 처리 파이프라인 설계 및 구축'),
(82, 'UI/UX 디자이너로, 개발자와의 협업을 위해 코딩을 배웁니다.', 'https://example.com/avatars/user_82.png', '디자인 시스템과 컴포넌트 기반 개발 이해'),
(83, '정보 보안 컨설턴트가 목표입니다.', 'https://example.com/avatars/user_83.png', '모의 해킹 및 취약점 분석 기술 습득'),
(84, '클라우드 네이티브 애플리케이션 개발을 공부하고 있습니다.', 'https://example.com/avatars/user_84.png', '컨테이너, 서비스 메시 등 관련 기술 이해'),
(85, '인프라 자동화에 관심이 많습니다.', 'https://example.com/avatars/user_85.png', 'Terraform, Ansible을 이용한 IaC(Infrastructure as Code)'),
(86, '핀테크 서비스 개발에 참여하고 싶습니다.', 'https://example.com/avatars/user_86.png', '금융 도메인 지식과 보안 개발 역량 강화'),
(87, '헬스케어 IT 분야에 관심이 있습니다.', 'https://example.com/avatars/user_87.png', '의료 데이터 표준(HL7, DICOM) 및 관련 규제 이해'),
(88, '에듀테크 서비스를 만들고 싶습니다.', 'https://example.com/avatars/user_88.png', '개인화 학습 추천 시스템 개발'),
(89, 'e커머스 플랫폼 개발을 공부하고 있습니다.', 'https://example.com/avatars/user_89.png', '대규모 트래픽 처리 및 재고 관리 시스템 설계'),
(90, '여행 기술(Travel Tech) 분야에 관심이 많습니다.', 'https://example.com/avatars/user_90.png', '항공, 숙박 예약 시스템 및 추천 서비스 개발'),
(91, '소셜 미디어 플랫폼의 아키텍처가 궁금합니다.', 'https://example.com/avatars/user_91.png', '대용량 트래픽을 처리하는 시스템 설계 원리 학습'),
(92, '스트리밍 서비스 기술을 배우고 싶습니다.', 'https://example.com/avatars/user_92.png', '동영상 인코딩, CDN, 실시간 스트리밍 프로토콜 이해'),
(93, '지도 및 위치 기반 서비스(LBS) 개발을 공부하고 있습니다.', 'https://example.com/avatars/user_93.png', '공간 데이터 처리 및 관련 API 활용'),
(94, '메타버스 플랫폼 개발에 도전하고 싶습니다.', 'https://example.com/avatars/user_94.png', '실시간 3D 렌더링 및 네트워크 동기화 기술 학습'),
(95, '개발자로서의 생산성을 높이고 싶습니다.', 'https://example.com/avatars/user_95.png', 'Vim, Emacs 등 고급 편집기 사용 및 스크립팅'),
(96, '알고리즘 문제 해결 능력을 꾸준히 키우고 있습니다.', 'https://example.com/avatars/user_96.png', '백준, LeetCode 등 온라인 저지 문제 풀이'),
(97, '기술 면접을 준비하고 있습니다.', 'https://example.com/avatars/user_97.png', '주요 기술 질문에 대한 답변 및 라이브 코딩 연습'),
(98, '이직을 준비하며 포트폴리오를 만들고 있습니다.', 'https://example.com/avatars/user_98.png', '프로젝트 기획, 개발, 배포 전 과정 경험'),
(99, '체계적인 소프트웨어 공학 지식을 배우고 싶습니다.', 'https://example.com/avatars/user_99.png', '요구사항 분석, 설계, 테스트, 유지보수 등 전체 라이프사이클 이해'),
(100, '사람들에게 도움이 되는 서비스를 만들고 싶습니다.', 'https://example.com/avatars/user_100.png', '사용자 중심의 문제 해결 능력 함양'),
(101, '안녕하세요, 함께 배우며 성장해요.', 'https://example.com/avatars/user_101.png', '풀스택 개발자 역량 강화'),
(102, '새로운 지식 습득을 즐깁니다.', 'https://example.com/avatars/user_102.png', '데이터 분석 및 시각화 능력 향상'),
(103, '열정적인 학습자입니다.', 'https://example.com/avatars/user_103.png', '클라우드 컴퓨팅 전문가 되기'),
(104, '코딩으로 아이디어를 현실로 만듭니다.', 'https://example.com/avatars/user_104.png', '모바일 애플리케이션 개발'),
(105, '도전을 두려워하지 않는 개발자입니다.', 'https://example.com/avatars/user_105.png', '인공지능 및 머신러닝 실무 적용'),
(106, '지식을 나누는 것을 좋아합니다.', 'https://example.com/avatars/user_106.png', '기술 블로그 운영 및 스터디 그룹 리딩'),
(107, '꼼꼼하고 체계적인 학습을 선호합니다.', 'https://example.com/avatars/user_107.png', '소프트웨어 아키텍처 설계 능력 배양'),
(108, '사용자 경험을 중요하게 생각합니다.', 'https://example.com/avatars/user_108.png', 'UX/UI 디자인 원칙을 적용한 개발'),
(109, '효율적인 코드 작성을 추구합니다.', 'https://example.com/avatars/user_109.png', '알고리즘 및 자료구조 심화 학습'),
(110, '데이터 기반 의사결정에 관심이 많습니다.', 'https://example.com/avatars/user_110.png', '빅데이터 처리 기술(Spark, Hadoop) 습득'),
(111, '보안은 기본이라고 생각하는 개발자입니다.', 'https://example.com/avatars/user_111.png', '시큐어 코딩 및 웹 취약점 분석 능력 향상'),
(112, '항상 배우는 자세로 임합니다.', 'https://example.com/avatars/user_112.png', '최신 프론트엔드 기술 스택 마스터'),
(113, '안정적인 서비스 구축을 목표로 합니다.', 'https://example.com/avatars/user_113.png', 'DevOps 및 시스템 엔지니어링 역량 강화'),
(114, '게임 개발의 모든 과정을 경험하고 싶습니다.', 'https://example.com/avatars/user_114.png', '게임 기획, 그래픽, 프로그래밍 통합 학습'),
(115, '문제 해결 과정을 즐깁니다.', 'https://example.com/avatars/user_115.png', '복잡한 비즈니스 로직을 코드로 구현하는 능력'),
(116, '오픈소스 커뮤니티 활동에 관심이 있습니다.', 'https://example.com/avatars/user_116.png', '글로벌 개발자들과의 협업 및 기여'),
(117, '비전공자에서 개발자로 성장했습니다.', 'https://example.com/avatars/user_117.png', '컴퓨터 과학의 기초를 더욱 탄탄하게 다지기'),
(118, '기술을 통해 더 나은 세상을 만들고 싶습니다.', 'https://example.com/avatars/user_118.png', '공익을 위한 소프트웨어 개발'),
(119, '새로운 프로그래밍 언어 배우는 것을 좋아합니다.', 'https://example.com/avatars/user_119.png', '다양한 언어를 통해 프로그래밍 패러다임 이해'),
(120, '함께 성장하는 스터디를 찾고 있습니다.', 'https://example.com/avatars/user_120.png', '동료 학습을 통한 지식 확장 및 동기 부여');

-- user_roles 테이블 데이터
INSERT INTO `user_roles` (`user_id`, `role_id`) 
VALUES
-- 1~15번 사용자는 교육자(2)와 학습자(1) 역할을 모두 가짐
(1, 1), (1, 2),
(2, 1), (2, 2),
(3, 1), (3, 2),
(4, 1), (4, 2),
(5, 1), (5, 2),
(6, 1), (6, 2),
(7, 1), (7, 2),
(8, 1), (8, 2),
(9, 1), (9, 2),
(10, 1), (10, 2),
(11, 1), (11, 2),
(12, 1), (12, 2),
(13, 1), (13, 2),
(14, 1), (14, 2),
(15, 1), (15, 2),
-- 나머지 사용자는 학습자(1) 역할만 가짐
(16, 1), (17, 1), (18, 1), (19, 1), (20, 1),
(21, 1), (22, 1), (23, 1), (24, 1), (25, 1),
(26, 1), (27, 1), (28, 1), (29, 1), (30, 1),
(31, 1), (32, 1), (33, 1), (34, 1), (35, 1),
(36, 1), (37, 1), (38, 1), (39, 1), (40, 1),
(41, 1), (42, 1), (43, 1), (44, 1), (45, 1),
(46, 1), (47, 1), (48, 1), (49, 1), (50, 1),
(51, 1), (52, 1), (53, 1), (54, 1), (55, 1),
(56, 1), (57, 1), (58, 1), (59, 1), (60, 1),
(61, 1), (62, 1), (63, 1), (64, 1), (65, 1),
(66, 1), (67, 1), (68, 1), (69, 1), (70, 1),
(71, 1), (72, 1), (73, 1), (74, 1), (75, 1),
(76, 1), (77, 1), (78, 1), (79, 1), (80, 1),
(81, 1), (82, 1), (83, 1), (84, 1), (85, 1),
(86, 1), (87, 1), (88, 1), (89, 1), (90, 1),
(91, 1), (92, 1), (93, 1), (94, 1), (95, 1),
(96, 1), (97, 1), (98, 1), (99, 1), (100, 1),
(101, 1), (102, 1), (103, 1), (104, 1), (105, 1),
(106, 1), (107, 1), (108, 1), (109, 1), (110, 1),
(111, 1), (112, 1), (113, 1), (114, 1), (115, 1),
(116, 1), (117, 1), (118, 1), (119, 1), (120, 1);

-- user_auth_providers 테이블 데이터
INSERT INTO `user_auth_providers` (`user_id`, `provider`, `provider_user_id`) 
VALUES
(1, 'google', '101234567890123456789'),
(3, 'github', '9876543'),
(5, 'google', '109876543210987654321'),
(10, 'github', '1234567'),
(16, 'google', '112233445566778899001'),
(25, 'github', '7654321'),
(33, 'google', '102938475610293847561'),
(42, 'github', '8887776'),
(51, 'google', '103141592653589793238'),
(67, 'github', '9990001'),
(78, 'google', '108765432101234567890'),
(89, 'github', '1123581'),
(95, 'google', '107778889990001112223'),
(104, 'github', '2357111'),
(111, 'google', '104321987654321098765'),
(120, 'github', '1324354');

-- ------------------------------------------------------------------------------------
-- -- 도메인 2: 과정 및 콘텐츠 (Course & Content) 데이터
-- -- 의존성 순서: tags -> courses -> media_assets -> course_sections -> content_modules -> course_tags
-- ------------------------------------------------------------------------------------

-- tags 테이블 데이터
INSERT INTO `tags` (`tag_id`, `name`) VALUES
(1, 'Python'), (2, 'Java'), (3, 'JavaScript'), (4, 'SQL'), (5, 'Database'),
(6, 'Web Development'), (7, 'Frontend'), (8, 'Backend'), (9, 'React'), (10, 'Vue.js'),
(11, 'Spring'), (12, 'Node.js'), (13, 'DevOps'), (14, 'AWS'), (15, 'Docker'),
(16, 'Kubernetes'), (17, 'Data Science'), (18, 'Machine Learning'), (19, 'Deep Learning'),
(20, 'UI/UX'), (21, 'Algorithm'), (22, 'CS Fundamentals'), (23, 'Digital Marketing'), (24, 'Art History');

-- courses 테이블 데이터 (30개 과정)
INSERT INTO `courses` (`course_id`, `author_id`, `title`, `description`, `status`) 
VALUES
(1, 1, '왕초보를 위한 Python 기초', '프로그래밍이 처음이신 분들을 위한 파이썬 기초 문법 강의입니다. 변수부터 함수까지 차근차근 배워봅니다.', 'published'),
(2, 2, 'Java와 Spring Boot로 시작하는 웹 개발', 'Java와 Spring Boot를 사용하여 RESTful API 서버를 구축하는 방법을 배웁니다.', 'published'),
(3, 3, 'SQL 기본부터 활용까지', '데이터베이스의 기본 개념과 SQL 문법을 익히고, 실무에서 자주 사용하는 쿼리 작성법을 학습합니다.', 'published'),
(4, 4, 'React.js로 만드는 모던 웹 프론트엔드', 'React의 핵심 개념(Components, Hooks)을 이해하고, 실용적인 웹 애플리케이션을 만들어봅니다.', 'published'),
(5, 5, '데이터 과학 입문 with Python', 'Pandas, Matplotlib, Scikit-learn 라이브러리를 활용하여 데이터 분석 및 시각화, 머신러닝 모델링의 기초를 다집니다.', 'published'),
(6, 1, '파이썬 중급: 객체 지향 프로그래밍', '파이썬의 클래스, 상속 등 객체 지향 프로그래밍(OOP) 개념을 깊이 있게 학습합니다.', 'published'),
(7, 2, 'JPA와 QueryDSL을 활용한 데이터베이스 처리', 'Spring Data JPA의 동작 원리를 이해하고, QueryDSL을 이용해 동적 쿼리를 작성하는 방법을 배웁니다.', 'published'),
(8, 6, 'JavaScript ES6+ 핵심 정리', '모던 자바스크립트의 핵심 문법인 화살표 함수, 비구조화 할당, Promise, async/await 등을 학습합니다.', 'published'),
(9, 7, 'AWS 기초와 클라우드 컴퓨팅', '클라우드의 기본 개념을 이해하고 AWS의 핵심 서비스(EC2, S3, RDS)를 직접 사용해봅니다.', 'published'),
(10, 8, 'Docker & Kubernetes 마스터 클래스', '컨테이너 기술의 핵심인 도커와 쿠버네티스를 사용하여 애플리케이션을 배포하고 관리하는 방법을 배웁니다.', 'draft'),
(11, 9, '알고리즘과 자료구조 완전 정복', '코딩 테스트의 필수 역량인 주요 자료구조(배열, 스택, 큐, 트리 등)와 알고리즘(정렬, 탐색 등)을 학습합니다.', 'published'),
(12, 10, 'Node.js와 Express로 만드는 백엔드 서버', '비동기 이벤트 기반의 Node.js와 Express 프레임워크를 사용하여 빠르고 확장성 있는 백엔드 서버를 구축합니다.', 'published'),
(13, 11, 'UI/UX 디자인의 첫걸음', '사용자 중심 디자인의 기본 원칙과 프로세스를 이해하고, Figma를 활용한 프로토타이핑을 실습합니다.', 'published'),
(14, 5, '텐서플로우(TensorFlow)로 배우는 딥러닝', '딥러닝의 기본 개념부터 CNN, RNN 모델까지 텐서플로우를 사용하여 직접 구현해봅니다.', 'published'),
(15, 3, '데이터베이스 모델링과 정규화', '요구사항에 맞는 효율적인 데이터베이스를 설계하기 위한 관계형 모델링과 정규화 과정을 학습합니다.', 'published'),
(16, 4, 'Vue.js 3 시작하기', 'Vue.js의 최신 버전인 Vue 3의 Composition API를 중심으로 프론트엔드 개발을 시작합니다.', 'published'),
(17, 1, '파이썬 웹 스크래핑과 데이터 수집', 'BeautifulSoup, Selenium 등의 라이브러리를 활용하여 웹사이트의 데이터를 수집하고 정제하는 기술을 배웁니다.', 'published'),
(18, 7, 'Terraform으로 시작하는 IaC(Infrastructure as Code)', '코드를 통해 인프라를 관리하는 IaC의 개념을 배우고, Terraform을 사용하여 AWS 인프라를 자동화합니다.', 'draft'),
(19, 12, '디지털 마케팅 A to Z', '검색 엔진 최적화(SEO), 소셜 미디어 마케팅, 콘텐츠 마케팅 등 디지털 마케팅의 모든 것을 다룹니다.', 'published'),
(20, 13, '알기 쉬운 서양 미술사', '고대부터 현대까지 서양 미술의 주요 사조와 대표적인 예술가들의 작품을 통해 인문학적 소양을 넓힙니다.', 'published'),
(21, 2, '코틀린(Kotlin)과 함께하는 안드로이드 개발', '구글의 공식 안드로이드 개발 언어인 코틀린의 기초를 배우고, 간단한 앱을 만들어봅니다.', 'published'),
(22, 8, 'CI/CD 파이프라인 구축 with Jenkins', 'Jenkins를 사용하여 소스 코드의 빌드, 테스트, 배포를 자동화하는 CI/CD 파이프라인을 구축합니다.', 'published'),
(23, 14, '컴퓨터 구조와 운영체제', '개발자라면 반드시 알아야 할 컴퓨터의 동작 원리와 운영체제의 핵심 개념(프로세스, 메모리 관리 등)을 배웁니다.', 'published'),
(24, 15, '실전 SQL 튜닝', '느린 SQL 쿼리의 원인을 분석하고, 실행 계획과 인덱스를 활용하여 성능을 개선하는 실전 노하우를 전수합니다.', 'published'),
(25, 5, 'R을 활용한 데이터 분석 및 시각화', '통계 분석에 강점을 가진 R 언어의 기초를 익히고, ggplot2 등의 패키지를 활용해 데이터를 시각화합니다.', 'published'),
(26, 6, '타입스크립트(TypeScript) 제대로 배우기', '자바스크립트에 타입을 더한 타입스크립트의 장점을 이해하고, 실제 프로젝트에 적용하는 방법을 학습합니다.', 'published'),
(27, 9, '네트워크 기초와 TCP/IP', '인터넷 통신의 근간이 되는 네트워크의 기본 모델(OSI 7계층, TCP/IP)과 주요 프로토콜을 학습합니다.', 'published'),
(28, 1, 'Django로 만드는 나만의 블로그', '파이썬의 대표적인 웹 프레임워크인 Django를 사용하여 블로그 서비스를 직접 개발해봅니다.', 'published'),
(29, 4, 'GraphQL로 만드는 효율적인 API', 'REST API의 한계를 극복하기 위해 등장한 GraphQL의 개념을 배우고, Apollo 서버를 이용해 API를 구축합니다.', 'published'),
(30, 10, '마이크로서비스 아키텍처(MSA) 입문', 'MSA의 기본 개념과 장단점을 이해하고, 서비스 분리 및 통신 방법을 학습합니다.', 'published');

-- media_assets 테이블 데이터
INSERT INTO `media_assets` (`uploader_id`, `file_path`, `file_type`, `file_size`, `origin_file_name`, `converted_file_name`) 
VALUES
(1, 's3://lxp-bucket/videos/course1/sec1_intro.mp4', 'video/mp4', 15728640, '01_파이썬소개.mp4', 'a1b2c3d4-001.mp4'),
(1, 's3://lxp-bucket/videos/course1/sec1_install.mp4', 'video/mp4', 26214400, '02_개발환경설치.mp4', 'a1b2c3d4-002.mp4'),
(1, 's3://lxp-bucket/docs/course1/python_cheatsheet.pdf', 'application/pdf', 1048576, '파이썬_핵심문법.pdf', 'doc-a1b2c3d4.pdf'),
(2, 's3://lxp-bucket/videos/course2/sec1_intro.mp4', 'video/mp4', 18874368, '01_스프링부트란.mp4', 'e5f6g7h8-001.mp4'),
(2, 's3://lxp-bucket/videos/course2/sec1_project.mp4', 'video/mp4', 31457280, '02_프로젝트생성.mp4', 'e5f6g7h8-002.mp4'),
(3, 's3://lxp-bucket/videos/course3/sec1_db_intro.mp4', 'video/mp4', 12582912, '01_데이터베이스소개.mp4', 'i9j0k1l2-001.mp4'),
(3, 's3://lxp-bucket/videos/course3/sec2_select.mp4', 'video/mp4', 20971520, '02_SELECT문기초.mp4', 'i9j0k1l2-002.mp4'),
(4, 's3://lxp-bucket/videos/course4/sec1_react_intro.mp4', 'video/mp4', 23068672, '01_리액트소개.mp4', 'm3n4o5p6-001.mp4'),
(5, 's3://lxp-bucket/videos/course5/sec1_pandas.mp4', 'video/mp4', 41943040, '01_Pandas기초.mp4', 'q7r8s9t0-001.mp4'),
(1, 's3://lxp-bucket/videos/course6/sec1_oop.mp4', 'video/mp4', 36700160, '01_OOP개념.mp4', 'u1v2w3x4-001.mp4'),
(2, 's3://lxp-bucket/videos/course7/sec1_jpa_intro.mp4', 'video/mp4', 33554432, '01_JPA란.mp4', 'y5z6a7b8-001.mp4'),
(6, 's3://lxp-bucket/videos/course8/sec1_es6.mp4', 'video/mp4', 28311552, '01_ES6소개.mp4', 'c9d0e1f2-001.mp4'),
(7, 's3://lxp-bucket/videos/course9/sec1_cloud.mp4', 'video/mp4', 19922944, '01_클라우드개념.mp4', 'g3h4i5j6-001.mp4'),
(9, 's3://lxp-bucket/videos/course11/sec1_complexity.mp4', 'video/mp4', 30408704, '01_시간복잡도.mp4', 'k7l8m9n0-001.mp4'),
(10, 's3://lxp-bucket/videos/course12/sec1_nodejs.mp4', 'video/mp4', 27262976, '01_NodeJS소개.mp4', 'o1p2q3r4-001.mp4'),
(11, 's3://lxp-bucket/videos/course13/sec1_ux_intro.mp4', 'video/mp4', 24117248, '01_사용자경험이란.mp4', 's5t6u7v8-001.mp4'),
(5, 's3://lxp-bucket/videos/course14/sec1_dnn.mp4', 'video/mp4', 47185920, '01_DNN이론.mp4', 'w9x0y1z2-001.mp4'),
(3, 's3://lxp-bucket/videos/course15/sec1_modeling.mp4', 'video/mp4', 29360128, '01_데이터모델링.mp4', 'a3b4c5d6-001.mp4'),
(4, 's3://lxp-bucket/videos/course16/sec1_vue3.mp4', 'video/mp4', 25165824, '01_Vue3소개.mp4', 'e7f8g9h0-001.mp4'),
(1, 's3://lxp-bucket/videos/course17/sec1_scraping.mp4', 'video/mp4', 34603008, '01_웹스크래핑이란.mp4', 'i1j2k3l4-001.mp4'),
(12, 's3://lxp-bucket/docs/assignment/marketing_plan_template.docx', 'application/msword', 204800, '마케팅기획안_템플릿.docx', 'as-mkt-001.docx'),
(13, 's3://lxp-bucket/docs/assignment/art_report_guide.pdf', 'application/pdf', 512000, '미술사감상문_가이드.pdf', 'as-art-001.pdf'),
(1, 's3://lxp-bucket/videos/course1/sec2_variable.mp4', 'video/mp4', 31457280, '03_변수와자료형.mp4', 'a1b2c3d4-003.mp4'),
(1, 's3://lxp-bucket/videos/course1/sec3_function.mp4', 'video/mp4', 35651584, '04_함수.mp4', 'a1b2c3d4-004.mp4'),
(2, 's3://lxp-bucket/videos/course2/sec2_api.mp4', 'video/mp4', 40894464, '03_API개발.mp4', 'e5f6g7h8-003.mp4'),
(2, 's3://lxp-bucket/videos/course2/sec3_test.mp4', 'video/mp4', 38797312, '04_테스트코드작성.mp4', 'e5f6g7h8-004.mp4'),
(3, 's3://lxp-bucket/videos/course3/sec3_join.mp4', 'video/mp4', 33554432, '03_JOIN.mp4', 'i9j0k1l2-003.mp4'),
(3, 's3://lxp-bucket/videos/course3/sec4_subquery.mp4', 'video/mp4', 29360128, '04_서브쿼리.mp4', 'i9j0k1l2-004.mp4'),
(4, 's3://lxp-bucket/videos/course4/sec2_component.mp4', 'video/mp4', 39845888, '02_컴포넌트.mp4', 'm3n4o5p6-002.mp4'),
(4, 's3://lxp-bucket/videos/course4/sec3_hooks.mp4', 'video/mp4', 44040192, '03_Hooks.mp4', 'm3n4o5p6-003.mp4'),
(5, 's3://lxp-bucket/videos/course5/sec2_matplotlib.mp4', 'video/mp4', 37748736, '02_Matplotlib시각화.mp4', 'q7r8s9t0-002.mp4'),
(5, 's3://lxp-bucket/videos/course5/sec3_sklearn.mp4', 'video/mp4', 50331648, '03_Scikit-learn기초.mp4', 'q7r8s9t0-003.mp4'),
(6, 's3://lxp-bucket/videos/course6/sec2_inheritance.mp4', 'video/mp4', 32505856, '02_상속과다형성.mp4', 'u1v2w3x4-002.mp4'),
(7, 's3://lxp-bucket/videos/course7/sec2_querydsl.mp4', 'video/mp4', 42991616, '02_QueryDSL기초.mp4', 'y5z6a7b8-002.mp4'),
(8, 's3://lxp-bucket/videos/course8/sec2_async.mp4', 'video/mp4', 34603008, '02_비동기처리.mp4', 'c9d0e1f2-002.mp4'),
(9, 's3://lxp-bucket/videos/course9/sec2_ec2.mp4', 'video/mp4', 30408704, '02_EC2.mp4', 'g3h4i5j6-002.mp4'),
(11, 's3://lxp-bucket/videos/course11/sec2_stack_queue.mp4', 'video/mp4', 29360128, '02_스택과큐.mp4', 'k7l8m9n0-002.mp4'),
(12, 's3://lxp-bucket/videos/course12/sec2_express.mp4', 'video/mp4', 36700160, '02_Express.mp4', 'o1p2q3r4-002.mp4'),
(13, 's3://lxp-bucket/videos/course13/sec2_figma.mp4', 'video/mp4', 41943040, '02_Figma실습.mp4', 's5t6u7v8-002.mp4'),
(14, 's3://lxp-bucket/videos/course14/sec2_cnn.mp4', 'video/mp4', 52428800, '02_CNN.mp4', 'w9x0y1z2-002.mp4'),
(15, 's3://lxp-bucket/videos/course15/sec2_normalization.mp4', 'video/mp4', 35651584, '02_정규화.mp4', 'a3b4c5d6-002.mp4');

-- course_sections 테이블 데이터
INSERT INTO `course_sections` (`course_id`, `title`, `section_order`) 
VALUES
(1, '과정 소개 및 환경설정', 1), (1, '파이썬 기본 문법', 2), (1, '함수와 모듈', 3),
(2, 'Spring Boot 소개', 1), (2, 'API 개발 실습', 2), (2, '테스트 및 배포', 3),
(3, '데이터베이스와 SQL 소개', 1), (3, 'SELECT 마스터하기', 2), (3, '데이터 조작과 트랜잭션', 3), (3, '고급 SQL', 4),
(4, 'React 개발 시작하기', 1), (4, '핵심 개념: 컴포넌트와 Props', 2), (4, '상태 관리와 Hooks', 3), (4, '프로젝트 배포', 4),
(5, '데이터 분석 환경 구성', 1), (5, 'Pandas를 이용한 데이터 가공', 2), (5, 'Matplotlib과 Seaborn을 이용한 시각화', 3), (5, 'Scikit-learn으로 시작하는 머신러닝', 4),
(6, '객체 지향 프로그래밍(OOP)이란?', 1), (6, '클래스와 인스턴스', 2), (6, '상속과 다형성', 3),
(7, 'Spring Data JPA 깊이 알기', 1), (7, 'QueryDSL 시작하기', 2), (7, '실전 예제', 3),
(8, '모던 JavaScript의 진화', 1), (8, 'ES6+ 핵심 문법', 2), (8, '비동기 프로그래밍', 3),
(9, '클라우드 컴퓨팅과 AWS', 1), (9, '핵심 서비스: EC2, S3, RDS', 2), (9, 'VPC와 네트워크', 3),
(11, '알고리즘의 기초: 복잡도', 1), (11, '기본 자료구조: 스택, 큐, 리스트', 2), (11, '핵심 알고리즘: 정렬과 탐색', 3),
(12, 'Node.js와 비동기 I/O', 1), (12, 'Express 프레임워크', 2), (12, '미들웨어와 라우팅', 3),
(13, 'UX/UI의 중요성', 1), (13, '디자인 프로세스', 2), (13, 'Figma를 이용한 와이어프레이밍', 3),
(14, '딥러닝과 신경망의 이해', 1), (14, '텐서플로우 기초', 2), (14, 'CNN을 이용한 이미지 처리', 3), (14, 'RNN을 이용한 자연어 처리', 4),
(15, '관계형 데이터베이스 모델링', 1), (15, '정규화(Normalization)', 2), (15, '반정규화와 성능', 3),
(16, 'Vue.js 3 소개', 1), (16, 'Composition API', 2), (16, '컴포넌트 통신', 3),
(17, '웹 스크래핑 기초', 1), (17, 'BeautifulSoup 활용', 2), (17, '동적 웹사이트와 Selenium', 3),
(19, '디지털 마케팅이란?', 1), (19, 'SEO와 검색 엔진', 2), (19, '소셜 미디어 전략', 3), (19, '최종 프로젝트', 4),
(20, '고대 미술과 중세 미술', 1), (20, '르네상스와 바로크', 2), (20, '근대 미술의 흐름', 3), (20, '현대 미술과 동시대 미술', 4),
(24, 'SQL 실행 계획 분석', 1), (24, '인덱스 전략', 2), (24, '쿼리 재작성 기법', 3);

-- content_modules 테이블 데이터
INSERT INTO `content_modules` (`section_id`, `title`, `content_type`, `media_asset_id`, `content_body`, `module_order`) 
VALUES
(1, '강의 소개', 'video', 1, NULL, 1),
(1, '파이썬 개발 환경 설치하기', 'video', 2, NULL, 2),
(1, '첫 파이썬 코드 작성하기', 'text', NULL, 'print("Hello, World!")를 직접 입력하고 실행해봅시다.', 3),
(2, '변수와 자료형', 'video', 23, NULL, 1),
(2, '연산자', 'text', NULL, '산술, 비교, 논리 연산자에 대해 알아봅니다.', 2),
(2, '조건문 (if)', 'video', NULL, NULL, 3),
(2, '반복문 (for, while)', 'video', NULL, NULL, 4),
(3, '함수 정의와 호출', 'video', 24, NULL, 1),
(3, '모듈과 패키지', 'text', NULL, '코드를 재사용하기 위한 모듈과 패키지의 개념을 배웁니다.', 2),
(3, '과제: 간단한 계산기 함수 만들기', 'assignment', 3, '덧셈, 뺄셈, 곱셈, 나눗셈 함수를 만들어보세요.', 3),
(4, '왜 Spring Boot를 사용하는가?', 'video', 4, NULL, 1),
(4, '프로젝트 생성 및 구조 설명', 'video', 5, NULL, 2),
(5, 'Controller, Service, Repository', 'video', 25, NULL, 1),
(5, 'DTO와 Entity', 'text', NULL, '데이터 전송 객체(DTO)와 데이터베이스 엔티티의 차이점을 알아봅니다.', 2),
(5, '첫 API 만들기: GET 요청', 'video', NULL, NULL, 3),
(6, 'JUnit5를 이용한 단위 테스트', 'video', 26, NULL, 1),
(6, 'Spring Boot Actuator', 'text', NULL, '애플리케이션의 상태를 모니터링하는 Actuator에 대해 배웁니다.', 2),
(6, '과제: 게시판 API 서버 만들기', 'assignment', NULL, 'CRUD 기능이 포함된 간단한 게시판 API를 만들어보세요.', 3),
(7, '데이터베이스의 역사와 종류', 'video', 6, NULL, 1),
(7, '관계형 데이터베이스(RDBMS)란?', 'text', NULL, '테이블, 레코드, 컬럼 등 RDBMS의 기본 용어를 알아봅니다.', 2),
(8, 'SELECT와 FROM', 'video', 7, NULL, 1),
(8, 'WHERE로 데이터 필터링하기', 'video', NULL, NULL, 2),
(8, 'GROUP BY와 집계 함수', 'video', NULL, NULL, 3),
(8, 'ORDER BY로 정렬하기', 'video', NULL, NULL, 4),
(8, '퀴즈 1: SELECT 문법', 'quiz', NULL, NULL, 5),
(9, 'INSERT, UPDATE, DELETE', 'video', NULL, NULL, 1),
(9, '트랜잭션과 ACID', 'text', NULL, '데이터의 일관성을 보장하는 트랜잭션의 개념을 배웁니다.', 2),
(10, 'JOIN의 종류와 활용', 'video', 27, NULL, 1),
(10, '서브쿼리', 'video', 28, NULL, 2),
(10, '윈도우 함수', 'video', NULL, NULL, 3),
(10, '퀴즈 2: 고급 SQL', 'quiz', NULL, NULL, 4),
(11, 'React와 가상 DOM', 'video', 8, NULL, 1),
(11, 'CRA로 프로젝트 시작하기', 'video', NULL, NULL, 2),
(12, 'JSX 문법', 'video', NULL, NULL, 1),
(12, '컴포넌트 만들기', 'video', 29, NULL, 2),
(13, 'useState', 'video', 30, NULL, 1),
(13, 'useEffect', 'video', NULL, NULL, 2),
(13, '과제: 투두리스트 앱 만들기', 'assignment', NULL, 'React Hooks를 사용하여 간단한 투두리스트 애플리케이션을 만들어보세요.', 3),
(15, '데이터 과학이란?', 'text', NULL, '데이터 과학의 정의와 필요한 역량에 대해 알아봅니다.', 1),
(15, 'Jupyter Notebook 환경 구성', 'video', NULL, NULL, 2),
(16, 'Pandas DataFrame과 Series', 'video', 9, NULL, 1),
(16, '데이터 불러오기 및 정제', 'video', NULL, NULL, 2),
(17, 'Matplotlib 기본 그래프', 'video', 31, NULL, 1),
(18, '머신러닝의 종류', 'text', NULL, '지도학습, 비지도학습, 강화학습에 대해 알아봅니다.', 1),
(18, '회귀 모델 실습', 'video', 32, NULL, 2),
(54, '디지털 마케팅 기획안 작성', 'assignment', 21, '제공된 템플릿을 사용하여 가상의 제품에 대한 디지털 마케팅 기획안을 작성하세요.', 1),
(55, '르네상스 대표 작품 감상문', 'assignment', 22, '레오나르도 다 빈치, 미켈란젤로, 라파엘로 중 한 명을 선택하여 대표 작품에 대한 감상문을 제출하세요.', 1);

-- course_tags 테이블 데이터
INSERT INTO `course_tags` (`course_id`, `tag_id`) 
VALUES
(1, 1), (1, 22), (2, 2), (2, 8), (2, 11), (3, 4), (3, 5), (4, 3), (4, 6), (4, 7), (4, 9),
(5, 1), (5, 17), (6, 1), (7, 2), (7, 5), (7, 8), (7, 11), (8, 3), (8, 6), (9, 13), (9, 14),
(10, 13), (10, 15), (10, 16), (11, 21), (11, 22), (12, 3), (12, 8), (12, 12), (13, 20),
(14, 1), (14, 18), (14, 19), (15, 5), (16, 3), (16, 6), (16, 7), (16, 10), (17, 1),
(18, 13), (18, 14), (19, 23), (20, 24), (21, 2), (22, 13), (23, 22), (24, 4), (24, 5),
(25, 17), (26, 3), (26, 7), (27, 22), (28, 1), (28, 8), (29, 8), (30, 8);

-- ------------------------------------------------------------------------------------
-- -- 도메인 3: 학습 활동 및 LXP (Learning Activity & LXP) 데이터
-- -- 의존성 순서: enrollments -> certificates -> user_progress -> learning_roadmaps -> roadmap_modules
-- ------------------------------------------------------------------------------------

-- enrollments 테이블 데이터
INSERT INTO `enrollments` (`user_id`, `course_id`, `status`, `enrolled_at`, `completed_at`) 
VALUES
(16, 1, 'completed', '2025-01-10 10:00:00', '2025-02-15 18:30:00'),
(17, 1, 'completed', '2025-01-11 11:00:00', '2025-03-01 20:00:00'),
(18, 3, 'completed', '2025-01-12 13:00:00', '2025-02-20 22:45:00'),
(19, 4, 'completed', '2025-01-13 14:00:00', '2025-03-10 15:00:00'),
(20, 5, 'completed', '2025-01-14 15:00:00', '2025-03-25 11:30:00'),
(21, 2, 'completed', '2025-02-01 09:00:00', '2025-04-01 10:00:00'),
(22, 1, 'completed', '2025-02-03 18:00:00', '2025-03-15 19:00:00'),
(23, 3, 'completed', '2025-02-05 19:00:00', '2025-03-20 21:00:00'),
(24, 7, 'completed', '2025-02-10 20:00:00', '2025-04-15 14:00:00'),
(25, 9, 'completed', '2025-02-15 21:00:00', '2025-05-01 16:00:00'),
(30, 1, 'completed', '2025-03-01 10:00:00', '2025-04-05 11:00:00'),
(31, 2, 'completed', '2025-03-02 12:00:00', '2025-05-10 13:00:00'),
(32, 3, 'completed', '2025-03-03 14:00:00', '2025-04-18 15:00:00'),
(33, 4, 'completed', '2025-03-04 16:00:00', '2025-05-20 17:00:00'),
(34, 5, 'completed', '2025-03-05 18:00:00', '2025-05-25 19:00:00'),
(40, 1, 'completed', '2025-04-01 09:30:00', '2025-05-11 10:30:00'),
(41, 11, 'completed', '2025-04-02 11:30:00', '2025-06-15 12:30:00'),
(42, 12, 'completed', '2025-04-03 13:30:00', '2025-06-20 14:30:00'),
(43, 13, 'completed', '2025-04-04 15:30:00', '2025-05-30 16:30:00'),
(44, 14, 'completed', '2025-04-05 17:30:00', '2025-06-25 18:30:00'),
(50, 1, 'completed', '2025-05-01 10:00:00', '2025-06-10 11:00:00'),
(51, 2, 'completed', '2025-05-02 12:00:00', '2025-07-15 13:00:00'),
(52, 3, 'completed', '2025-05-03 14:00:00', '2025-06-28 15:00:00'),
(53, 4, 'completed', '2025-05-04 16:00:00', '2025-07-20 17:00:00'),
(55, 5, 'completed', '2025-05-05 18:00:00', '2025-07-25 19:00:00'),
(60, 1, 'completed', '2025-06-01 11:00:00', '2025-07-05 12:00:00'),
(61, 2, 'completed', '2025-06-02 13:00:00', '2025-08-10 14:00:00'),
(62, 3, 'completed', '2025-06-03 15:00:00', '2025-07-18 16:00:00'),
(63, 24, 'completed', '2025-06-04 17:00:00', '2025-08-20 18:00:00'),
(64, 1, 'completed', '2025-06-05 19:00:00', '2025-07-25 20:00:00'),
(70, 5, 'completed', '2025-07-01 10:00:00', '2025-08-25 11:00:00'),
(71, 6, 'completed', '2025-07-02 12:00:00', '2025-09-01 13:00:00'),
(72, 7, 'completed', '2025-07-03 14:00:00', '2025-09-05 15:00:00'),
(73, 8, 'completed', '2025-07-04 16:00:00', '2025-08-28 17:00:00'),
(74, 9, 'completed', '2025-07-05 18:00:00', '2025-09-08 19:00:00'),
(80, 1, 'completed', '2025-08-01 09:00:00', '2025-09-01 10:00:00'),
(81, 2, 'completed', '2025-08-02 10:00:00', '2025-09-02 11:00:00'),
(82, 3, 'completed', '2025-08-03 11:00:00', '2025-09-03 12:00:00'),
(83, 4, 'completed', '2025-08-04 12:00:00', '2025-09-04 13:00:00'),
(84, 5, 'completed', '2025-08-05 13:00:00', '2025-09-05 14:00:00'),
(16, 2, 'active', '2025-08-01 10:00:00', NULL),
(17, 3, 'active', '2025-08-02 11:00:00', NULL),
(18, 1, 'active', '2025-08-03 13:00:00', NULL),
(19, 5, 'active', '2025-08-04 14:00:00', NULL),
(20, 4, 'active', '2025-08-05 15:00:00', NULL),
(22, 2, 'active', '2025-08-10 09:00:00', NULL),
(23, 1, 'active', '2025-08-11 18:00:00', NULL),
(24, 3, 'active', '2025-08-12 19:00:00', NULL),
(25, 4, 'active', '2025-08-13 20:00:00', NULL),
(35, 1, 'active', '2025-08-14 21:00:00', NULL),
(36, 1, 'active', '2025-08-15 10:00:00', NULL),
(37, 2, 'active', '2025-08-16 12:00:00', NULL),
(38, 3, 'active', '2025-08-17 14:00:00', NULL),
(39, 4, 'active', '2025-08-18 16:00:00', NULL),
(45, 5, 'active', '2025-08-19 18:00:00', NULL),
(46, 1, 'active', '2025-08-20 09:30:00', NULL),
(47, 2, 'active', '2025-08-21 11:30:00', NULL),
(48, 11, 'active', '2025-08-22 13:30:00', NULL),
(49, 12, 'active', '2025-08-23 15:30:00', NULL),
(54, 13, 'active', '2025-08-24 17:30:00', NULL),
(56, 1, 'active', '2025-08-25 10:00:00', NULL),
(57, 2, 'active', '2025-08-26 12:00:00', NULL),
(58, 3, 'active', '2025-08-27 14:00:00', NULL),
(59, 4, 'active', '2025-08-28 16:00:00', NULL),
(65, 5, 'active', '2025-08-29 18:00:00', NULL),
(66, 1, 'active', '2025-08-30 11:00:00', NULL),
(67, 2, 'active', '2025-09-01 13:00:00', NULL),
(68, 3, 'active', '2025-09-02 15:00:00', NULL),
(69, 20, 'active', '2025-09-03 17:00:00', NULL),
(75, 19, 'active', '2025-09-04 19:00:00', NULL),
(76, 1, 'active', '2025-09-05 10:00:00', NULL),
(77, 2, 'active', '2025-09-06 12:00:00', NULL),
(78, 3, 'active', '2025-09-07 14:00:00', NULL),
(79, 4, 'active', '2025-09-08 16:00:00', NULL),
(85, 5, 'active', '2025-09-09 10:00:00', NULL);

-- certificates 테이블 데이터
INSERT INTO `certificates` (`enrollment_id`, `verification_code`, `issued_at`) 
VALUES
(1, 'CERT-PY001-A1B2C3D4E5', '2025-02-15 18:31:00'),
(2, 'CERT-PY001-F6G7H8I9J0', '2025-03-01 20:01:00'),
(3, 'CERT-SQL001-K1L2M3N4O5', '2025-02-20 22:46:00'),
(4, 'CERT-REACT-P6Q7R8S9T0', '2025-03-10 15:01:00'),
(5, 'CERT-DS001-U1V2W3X4Y5', '2025-03-25 11:31:00'),
(6, 'CERT-SP001-Z6A7B8C9D0', '2025-04-01 10:01:00'),
(7, 'CERT-PY001-E1F2G3H4I5', '2025-03-15 19:01:00'),
(8, 'CERT-SQL001-J6K7L8M9N0', '2025-03-20 21:01:00'),
(9, 'CERT-SPJPA-O1P2Q3R4S5', '2025-04-15 14:01:00'),
(10, 'CERT-AWS001-T6U7V8W9X0', '2025-05-01 16:01:00'),
(11, 'CERT-PY001-Y1Z2A3B4C5', '2025-04-05 11:01:00'),
(12, 'CERT-SP001-D6E7F8G9H0', '2025-05-10 13:01:00'),
(13, 'CERT-SQL001-I1J2K3L4M5', '2025-04-18 15:01:00'),
(14, 'CERT-REACT-N6O7P8Q9R0', '2025-05-20 17:01:00'),
(15, 'CERT-DS001-S1T2U3V4W5', '2025-05-25 19:01:00'),
(16, 'CERT-PY001-X6Y7Z8A9B0', '2025-05-11 10:31:00'),
(17, 'CERT-ALGO-C1D2E3F4G5', '2025-06-15 12:31:00'),
(18, 'CERT-NODE-H6I7J8K9L0', '2025-06-20 14:31:00'),
(19, 'CERT-UIUX-M1N2O3P4Q5', '2025-05-30 16:31:00'),
(20, 'CERT-DL001-R6S7T8U9V0', '2025-06-25 18:31:00');

-- user_progress 테이블 데이터
INSERT INTO `user_progress` (`user_id`, `module_id`, `status`, `completed_at`) 
VALUES
(16, 1, 'completed', '2025-01-12 10:00:00'), (16, 2, 'completed', '2025-01-13 11:00:00'), (16, 3, 'completed', '2025-01-14 12:00:00'),
(16, 4, 'completed', '2025-01-20 10:00:00'), (16, 5, 'completed', '2025-01-21 11:00:00'), (16, 6, 'completed', '2025-01-22 12:00:00'),
(16, 7, 'completed', '2025-01-23 13:00:00'), (16, 8, 'completed', '2025-02-01 10:00:00'), (16, 9, 'completed', '2025-02-02 11:00:00'),
(16, 10, 'completed', '2025-02-15 18:30:00'),
(18, 19, 'completed', '2025-01-15 14:00:00'), (18, 20, 'completed', '2025-01-16 15:00:00'), (18, 21, 'completed', '2025-01-25 10:00:00'),
(18, 22, 'completed', '2025-01-26 11:00:00'), (18, 23, 'completed', '2025-01-27 12:00:00'), (18, 24, 'completed', '2025-01-28 13:00:00'),
(18, 25, 'completed', '2025-02-01 14:00:00'), (18, 26, 'completed', '2025-02-10 10:00:00'), (18, 27, 'completed', '2025-02-11 11:00:00'),
(18, 28, 'completed', '2025-02-15 10:00:00'), (18, 29, 'completed', '2025-02-16 11:00:00'), (18, 30, 'completed', '2025-02-17 12:00:00'),
(18, 31, 'completed', '2025-02-20 22:45:00'),
(16, 11, 'completed', '2025-08-05 10:00:00'), (16, 12, 'completed', '2025-08-06 11:00:00'), (16, 13, 'started', NULL),
(18, 1, 'completed', '2025-08-05 14:00:00'), (18, 2, 'completed', '2025-08-06 15:00:00'), (18, 3, 'completed', '2025-08-07 16:00:00'),
(18, 4, 'started', NULL),
(35, 1, 'started', NULL),
(46, 1, 'completed', '2025-08-22 10:00:00'), (46, 2, 'completed', '2025-08-23 11:00:00'), (46, 3, 'completed', '2025-08-24 12:00:00'),
(46, 4, 'completed', '2025-08-28 10:00:00'), (46, 5, 'completed', '2025-08-29 11:00:00'), (46, 6, 'started', NULL),
(66, 1, 'completed', '2025-09-01 11:00:00'), (66, 2, 'started', NULL);

-- learning_roadmaps 테이블 데이터
INSERT INTO `learning_roadmaps` (`roadmap_id`, `user_id`, `title`) 
VALUES
(1, 17, '김철수의 풀스택 개발자 로드맵'),
(2, 19, '박민수의 데이터 사이언티스트 되기'),
(3, 21, '최수진의 클라우드 엔지니어 마스터 과정'),
(4, 28, '강은지의 프론트엔드 심화 학습'),
(5, 33, '한지혜의 백엔드 개발 완전 정복'),
(6, 42, '이승민의 코딩 테스트 준비 로드맵'),
(7, 50, '오지수의 UI/UX 전문가 과정'),
(8, 67, '유해준의 DevOps 입문'),
(9, 75, '조민혁의 게임 개발자 준비'),
(10, 88, '임보미의 마케터를 위한 데이터 분석'),
(11, 96, '신유정의 모바일 앱 개발(Android)'),
(12, 104, '조은혜의 인공지능 전문가 과정'),
(13, 111, '변알렉스의 웹 개발 기초 다지기'),
(14, 120, '이루시의 SQL 마스터 로드맵');

-- roadmap_modules 테이블 데이터
INSERT INTO `roadmap_modules` (`roadmap_id`, `module_id`, `step_order`) 
VALUES
(1, 19, 1), (1, 21, 2), (1, 11, 3), (1, 13, 4), (1, 32, 5), (1, 34, 6),
(2, 1, 1), (2, 4, 2), (2, 44, 3), (2, 46, 4), (2, 48, 5), (2, 50, 6),
(3, 1, 1), (3, 2, 2), (3, 11, 3), (3, 12, 4),
(14, 19, 1), (14, 21, 2), (14, 22, 3), (14, 23, 4), (14, 28, 5), (14, 29, 6), (14, 30, 7);

-- ------------------------------------------------------------------------------------
-- -- 도메인 4: 평가 및 커뮤니티 (Assessment & Community) 데이터
-- -- 의존성 순서: forums -> assignments -> quizzes -> assignment_submissions -> quiz_questions -> quiz_attempts -> user_quiz_answers -> grades -> forum_threads -> forum_posts
-- ------------------------------------------------------------------------------------

-- forums 테이블 데이터
INSERT INTO `forums` (`course_id`, `title`) SELECT `course_id`, CONCAT(title, ' 포럼') FROM `courses`;

-- assignments 테이블 데이터
INSERT INTO `assignments` (`assignment_id`, `module_id`, `title`, `instructions`, `due_date`) 
VALUES
(1, 10, '간단한 계산기 함수 만들기', '덧셈, 뺄셈, 곱셈, 나눗셈 기능을 하는 4개의 함수를 포함하는 `calculator.py` 파일을 만들어 제출하세요.', '2025-02-28 23:59:59'),
(2, 18, '게시판 API 서버 만들기', 'GET, POST, PUT, DELETE 메소드를 사용하여 게시글의 CRUD(생성, 읽기, 수정, 삭제)가 가능한 RESTful API를 Spring Boot로 구현하여 소스 코드를 제출하세요.', '2025-04-10 23:59:59'),
(3, 13, 'React Hooks 투두리스트 앱', 'useState와 useEffect를 사용하여 할 일을 추가, 삭제, 완료 처리할 수 있는 간단한 투두리스트 애플리케이션을 만드세요.', '2025-03-20 23:59:59'),
(4, 54, '디지털 마케팅 기획안', '가상의 B2C 서비스를 선정하여, 1개월간의 소셜 미디어 마케팅 실행 계획을 A4 3장 이내로 작성하여 제출하세요.', '2025-09-15 23:59:59'),
(5, 55, '르네상스 대표 작품 감상문', '르네상스 시대의 대표 화가 1명과 그의 작품 1개를 선정하여, 작품의 특징과 미술사적 의의를 A4 2장 이내로 분석하고 감상을 서술하세요.', '2025-09-20 23:59:59');

-- quizzes 테이블 데이터
INSERT INTO `quizzes` (`quiz_id`, `module_id`, `title`)
VALUES
(1, 25, 'SELECT 문법 퀴즈'),
(2, 31, '고급 SQL 퀴즈');

-- assignment_submissions 테이블 데이터
INSERT INTO `assignment_submissions` (`assignment_id`, `user_id`, `submission_content`, `media_asset_id`, `submitted_at`) 
VALUES
(1, 16, 'calculator.py 파일 제출합니다.', NULL, '2025-02-25 18:00:00'),
(1, 17, '과제 제출합니다. 확인 부탁드립니다.', NULL, '2025-02-28 23:50:00'),
(1, 22, '함수 4개를 구현했습니다.', NULL, '2025-03-01 09:00:00'),
(2, 21, '게시판 API 소스코드 제출합니다.', NULL, '2025-04-08 15:00:00'),
(2, 31, '과제 완료했습니다.', NULL, '2025-04-10 18:30:00'),
(3, 19, '투두리스트 앱 코드입니다.', NULL, '2025-03-18 20:00:00'),
(3, 33, 'React 과제 제출합니다.', NULL, '2025-03-19 21:00:00');

-- quiz_questions 테이블 데이터
INSERT INTO `quiz_questions` (`quiz_id`, `question_text`, `question_type`, `options`, `correct_answer`) 
VALUES
(1, '다음 중 테이블의 모든 컬럼을 조회하는 SQL 문법으로 올바른 것은?', 'multiple_choice', '["SELECT all FROM table_name;", "SELECT * FROM table_name;", "GET * FROM table_name;", "SELECT & FROM table_name;"]', 'SELECT * FROM table_name;'),
(1, '데이터를 특정 조건으로 필터링하기 위해 사용하는 SQL 키워드는?', 'multiple_choice', '["FILTER BY", "CONDITION", "WHERE", "SELECT IF"]', 'WHERE'),
(1, '결과를 오름차순으로 정렬할 때 사용하는 키워드는?', 'multiple_choice', '["ORDER BY ... ASC", "SORT BY ... ASC", "GROUP BY ... ASC", "ARRANGE BY ... ASC"]', 'ORDER BY ... ASC'),
(2, '서로 다른 테이블을 연결하여 데이터를 조회할 때 사용하는 명령어는?', 'multiple_choice', '["CONNECT", "UNION", "MERGE", "JOIN"]', 'JOIN'),
(2, '다음 중 그룹화된 데이터에 조건을 적용하기 위해 사용하는 키워드는?', 'multiple_choice', '["WHERE", "HAVING", "CONDITION", "GROUP IF"]', 'HAVING');

-- quiz_attempts 테이블 데이터
INSERT INTO `quiz_attempts` (`quiz_id`, `user_id`, `score`, `completed_at`) 
VALUES
(1, 18, 100.00, '2025-01-26 12:00:00'),
(1, 23, 66.67, '2025-02-08 10:00:00'),
(1, 32, 100.00, '2025-03-10 11:00:00'),
(2, 18, 50.00, '2025-02-18 14:00:00'),
(2, 18, 100.00, '2025-02-19 16:00:00'),
(2, 23, 50.00, '2025-02-25 18:00:00');

-- user_quiz_answers 테이블 데이터
INSERT INTO `user_quiz_answers` (`attempt_id`, `question_id`, `user_answer`, `is_correct`) 
VALUES
(1, 1, 'SELECT * FROM table_name;', 1), (1, 2, 'WHERE', 1), (1, 3, 'ORDER BY ... ASC', 1),
(2, 1, 'SELECT * FROM table_name;', 1), (2, 2, 'WHERE', 1), (2, 3, 'SORT BY ... ASC', 0),
(4, 4, 'JOIN', 1), (4, 5, 'WHERE', 0),
(5, 4, 'JOIN', 1), (5, 5, 'HAVING', 1);

-- grades 테이블 데이터
INSERT INTO `grades` (`user_id`, `grader_id`, `gradable_item_type`, `gradable_item_id`, `score`, `feedback`) 
VALUES
(16, 1, 'assignment', 1, 95.00, '요구사항에 맞게 함수를 잘 구현했습니다. 예외 처리를 추가하면 더 좋은 코드가 될 것 같습니다.'),
(17, 1, 'assignment', 1, 100.00, '완벽합니다.'),
(22, 1, 'assignment', 1, 70.00, '제출 기한이 지난 점이 아쉽지만 기능 구현은 잘 되었습니다. (감점 -30)'),
(21, 2, 'assignment', 2, 90.00, '전체적인 구조는 좋으나, 서비스 로직 분리가 좀 더 명확하면 좋겠습니다.'),
(31, 2, 'assignment', 2, 100.00, '훌륭한 과제입니다.'),
(18, 3, 'quiz', 1, 100.00, '자동 채점 결과입니다.'),
(23, 3, 'quiz', 1, 66.67, '자동 채점 결과입니다.'),
(18, 3, 'quiz', 2, 100.00, '재응시를 통해 좋은 성적을 받으셨네요. 훌륭합니다.'); -- [수정] gradable_item_id를 5에서 2로 변경 (존재하는 quiz_id 참조)

-- forum_threads 테이블 데이터
INSERT INTO `forum_threads` (`forum_id`, `author_id`, `title`, `content`) 
VALUES
(1, 16, '2주차 조건문 질문입니다!', 'if-elif-else 구문에서 elif는 여러 번 사용할 수 있는 것이 맞나요?'),
(1, 17, '과제 제출 파일 형식 문의', '계산기 과제 제출 시 .py 파일만 제출하면 되나요? 아니면 실행 결과도 캡쳐해서 보내야 하나요?'),
(3, 18, 'JOIN과 서브쿼리의 차이점', '두 가지 모두 여러 테이블의 데이터를 활용하는 것으로 아는데, 어떤 경우에 각각 사용하는 것이 더 효율적인가요?'),
(4, 19, 'useEffect 무한 루프 문제', 'useEffect의 두 번째 인자인 의존성 배열을 잘못 설정했더니 무한으로 API를 호출하는 문제가 발생했습니다. 혹시 저같은 경험 있으신 분 계신가요?'),
(20, 69, '가장 인상 깊었던 르네상스 화가는 누구인가요?', '저는 레오나르도 다빈치의 인체 비례에 대한 탐구가 가장 인상 깊었습니다. 여러분의 생각은 어떠신가요?');

-- forum_posts 테이블 데이터
INSERT INTO `forum_posts` (`thread_id`, `author_id`, `parent_post_id`, `content`) 
VALUES
(1, 1, NULL, '네, 맞습니다. elif는 조건이 만족할 때까지 여러 개를 이어서 사용할 수 있습니다. 좋은 질문이네요!'),
(1, 22, 1, '아하, 감사합니다! 명쾌한 설명이네요.'),
(2, 1, NULL, '안녕하세요. .py 소스 코드 파일만 제출해 주시면 됩니다.'),
(3, 3, NULL, '좋은 질문입니다. 일반적으로 JOIN은 두 테이블의 관계가 명확할 때 사용하며, 서브쿼리는 주로 다른 쿼리의 결과를 조건으로 사용하거나 인라인 뷰로 활용할 때 유용합니다. 성능 측면에서는 상황에 따라 다르지만, 대부분의 경우 JOIN이 서브쿼리보다 옵티마이저가 최적화하기 용이하여 더 나은 성능을 보입니다.'),
(3, 18, 4, '자세한 설명 정말 감사합니다! 많은 도움이 되었습니다.'),
(4, 33, NULL, '저도 똑같은 실수 한 적 있어요! 의존성 배열에 객체나 함수를 그대로 넣으면 매 렌더링마다 새로운 참조로 인식해서 무한 루프가 돌더라고요. useCallback이나 useMemo를 활용해보시는 건 어떨까요?'),
(4, 19, 6, '오.. useCallback! 한번 공부해봐야겠네요. 조언 감사합니다!'),
(5, 75, NULL, '저는 미켈란젤로의 천지창조에 담긴 스케일과 역동성에 압도당했습니다.');


-- ------------------------------------------------------------------------------------
-- -- 외래 키 제약 조건 재활성화
-- ------------------------------------------------------------------------------------
SET FOREIGN_KEY_CHECKS = 1;