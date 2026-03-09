-- 테이블의 구성요소
-- 1. 데이터 타입(Data Type)
-- 2. 제약조건(Contraints)



use wanted_lms;

-- ------------------------------------------------------------------------------------
-- -- 외래 키 제약 조건 비활성화
-- ------------------------------------------------------------------------------------
SET FOREIGN_KEY_CHECKS = 0;

-- ------------------------------------------------------------------------------------
-- -- 기존 테이블 삭제 (순서에 무관하게 삭제)
-- ------------------------------------------------------------------------------------
DROP TABLE IF EXISTS `forum_posts`;
DROP TABLE IF EXISTS `forum_threads`;
DROP TABLE IF EXISTS `forums`;
DROP TABLE IF EXISTS `grades`;
DROP TABLE IF EXISTS `user_quiz_answers`;
DROP TABLE IF EXISTS `quiz_attempts`;
DROP TABLE IF EXISTS `quiz_questions`;
DROP TABLE IF EXISTS `quizzes`;
DROP TABLE IF EXISTS `assignment_submissions`;
DROP TABLE IF EXISTS `assignments`;
DROP TABLE IF EXISTS `roadmap_modules`;
DROP TABLE IF EXISTS `learning_roadmaps`;
DROP TABLE IF EXISTS `certificates`;
DROP TABLE IF EXISTS `user_progress`;
DROP TABLE IF EXISTS `enrollments`;
DROP TABLE IF EXISTS `course_tags`;
DROP TABLE IF EXISTS `tags`;
DROP TABLE IF EXISTS `content_modules`;
DROP TABLE IF EXISTS `course_sections`;
DROP TABLE IF EXISTS `media_assets`;
DROP TABLE IF EXISTS `courses`;
DROP TABLE IF EXISTS `user_auth_providers`;
DROP TABLE IF EXISTS `user_roles`;
DROP TABLE IF EXISTS `roles`;
DROP TABLE IF EXISTS `user_profiles`;
DROP TABLE IF EXISTS `users`;

-- ------------------------------------------------------------------------------------
-- -- 외래 키 제약 조건 재활성화
-- ------------------------------------------------------------------------------------
SET FOREIGN_KEY_CHECKS = 1;

-- ------------------------------------------------------------------------------------
-- -- LXP 데이터베이스 최종 스키마 (DDL Only)
-- -- 총 26개 테이블
-- ------------------------------------------------------------------------------------

-- ------------------------------------------------------------------------------------
-- -- 도메인 1: 사용자 및 인증 (User & Authentication) - 5개 테이블
-- ------------------------------------------------------------------------------------

CREATE TABLE `users` (
    `user_id`       bigint          NOT NULL AUTO_INCREMENT COMMENT '고유 식별자',
    `email`         varchar(255)    NOT NULL UNIQUE COMMENT '이메일 주소 (로그인 ID)',
    `password_hash` varchar(255)    NULL COMMENT '비밀번호 (해시됨)',
    `name`          varchar(100)    NOT NULL COMMENT '사용자 이름',
    `status`        varchar(20)     NOT NULL DEFAULT 'active' COMMENT '계정 상태 (active, suspended, deleted)',
    `last_login_at` timestamp       NULL COMMENT '마지막 로그인 일시',
    `created_at`    timestamp       NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '생성 일시',
    PRIMARY KEY (`user_id`),
    CHECK (`status` IN ('active', 'suspended', 'deleted'))
) COMMENT '서비스의 모든 사용자에 대한 핵심 정보';

CREATE TABLE `user_profiles` (
    `user_id`       bigint          NOT NULL COMMENT '사용자 ID',
    `bio`           text            NULL COMMENT '자기소개',
    `avatar_url`    varchar(512)    NULL COMMENT '프로필 이미지 URL',
    `learning_goal` text            NULL COMMENT 'LXP가 참고할 주요 학습 목표',
    PRIMARY KEY (`user_id`),
    FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`)
) COMMENT '사용자의 부가적인 프로필 정보';

CREATE TABLE `roles` (
    `role_id`   int             NOT NULL AUTO_INCREMENT COMMENT '역할 ID',
    `name`      varchar(50)     NOT NULL UNIQUE COMMENT '역할 이름 (ROLE_LEARNER, ROLE_EDUCATOR)',
    PRIMARY KEY (`role_id`)
) COMMENT '시스템의 역할(권한 그룹) 정의';

CREATE TABLE `user_roles` (
    `user_id`   bigint  NOT NULL COMMENT '사용자 ID',
    `role_id`   int     NOT NULL COMMENT '역할 ID',
    PRIMARY KEY (`user_id`, `role_id`),
    FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
    FOREIGN KEY (`role_id`) REFERENCES `roles` (`role_id`)
) COMMENT '사용자와 역할의 다대다 관계 연결';

CREATE TABLE `user_auth_providers` (
    `provider_id`       bigint          NOT NULL AUTO_INCREMENT COMMENT '고유 식별자',
    `user_id`           bigint          NOT NULL COMMENT '사용자 ID',
    `provider`          varchar(50)     NOT NULL COMMENT '소셜 미디어 종류 (github, google)',
    `provider_user_id`  varchar(255)    NOT NULL COMMENT '소셜 미디어 내 사용자 고유 ID',
    PRIMARY KEY (`provider_id`),
    FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`)
) COMMENT '소셜 로그인 정보';


-- ------------------------------------------------------------------------------------
-- -- 도메인 2: 과정 및 콘텐츠 (Course & Content) - 6개 테이블
-- ------------------------------------------------------------------------------------

CREATE TABLE `courses` (
    `course_id`     bigint          NOT NULL AUTO_INCREMENT COMMENT '과정 고유 ID',
    `author_id`     bigint          NOT NULL COMMENT '과정 개설자(교육자) ID',
    `title`         varchar(255)    NOT NULL COMMENT '과정 제목',
    `description`   text            NULL COMMENT '과정 상세 설명',
    `status`        varchar(20)     NOT NULL DEFAULT 'draft' COMMENT '과정 상태 (draft, published)',
    PRIMARY KEY (`course_id`),
    FOREIGN KEY (`author_id`) REFERENCES `users` (`user_id`),
    CHECK (`status` IN ('draft', 'published'))
) COMMENT '최상위 학습 단위인 과정';

CREATE TABLE `media_assets` (
    `media_asset_id`      bigint          NOT NULL AUTO_INCREMENT COMMENT '자산 ID',
    `uploader_id`         bigint          NOT NULL COMMENT '업로더 ID',
    `file_path`           varchar(512)    NOT NULL COMMENT '저장 경로 (S3 등)',
    `file_type`           varchar(50)     NOT NULL COMMENT '파일 MIME 타입',
    `file_size`           bigint          NOT NULL COMMENT '파일 크기 (bytes)',
    `origin_file_name`    varchar(255)    NOT NULL COMMENT '원본 파일명',
    `converted_file_name` varchar(255)    NOT NULL COMMENT '변경 파일명',
    PRIMARY KEY (`media_asset_id`),
    FOREIGN KEY (`uploader_id`) REFERENCES `users` (`user_id`)
) COMMENT '미디어 파일의 메타데이터';

CREATE TABLE `course_sections` (
    `section_id`    bigint          NOT NULL AUTO_INCREMENT COMMENT '섹션 ID',
    `course_id`     bigint          NOT NULL COMMENT '소속된 과정 ID',
    `title`         varchar(255)    NOT NULL COMMENT '섹션 제목',
    `section_order` int             NOT NULL COMMENT '섹션 순서',
    PRIMARY KEY (`section_id`),
    FOREIGN KEY (`course_id`) REFERENCES `courses` (`course_id`)
) COMMENT '과정 내의 커리큘럼 구조';

CREATE TABLE `content_modules` (
    `module_id`         bigint          NOT NULL AUTO_INCREMENT COMMENT '모듈 ID',
    `section_id`        bigint          NOT NULL COMMENT '소속된 섹션 ID',
    `title`             varchar(255)    NOT NULL COMMENT '모듈 제목',
    `content_type`      varchar(20)     NOT NULL COMMENT '콘텐츠 유형 (video, text, quiz, assignment)',
    `media_asset_id`    bigint          NULL COMMENT '참조 미디어 자산 ID',
    `content_body`      text            NULL COMMENT '텍스트 본문',
    `module_order`      int             NOT NULL COMMENT '섹션 내 순서',
    PRIMARY KEY (`module_id`),
    FOREIGN KEY (`section_id`) REFERENCES `course_sections` (`section_id`),
    FOREIGN KEY (`media_asset_id`) REFERENCES `media_assets` (`media_asset_id`),
    CHECK (`content_type` IN ('video', 'text', 'quiz', 'assignment'))
) COMMENT '모든 학습 콘텐츠의 가장 기본 단위';

CREATE TABLE `tags` (
    `tag_id`    bigint          NOT NULL AUTO_INCREMENT COMMENT '태그 ID',
    `name`      varchar(100)    NOT NULL UNIQUE COMMENT '태그 이름',
    PRIMARY KEY (`tag_id`)
) COMMENT '콘텐츠 분류 및 검색용 태그 마스터';

CREATE TABLE `course_tags` (
    `course_id` bigint  NOT NULL COMMENT '과정 ID',
    `tag_id`    bigint  NOT NULL COMMENT '태그 ID',
    PRIMARY KEY (`course_id`, `tag_id`),
    FOREIGN KEY (`course_id`) REFERENCES `courses` (`course_id`),
    FOREIGN KEY (`tag_id`) REFERENCES `tags` (`tag_id`)
) COMMENT '과정과 태그의 다대다 관계 연결';


-- ------------------------------------------------------------------------------------
-- -- 도메인 3: 학습 활동 및 LXP (Learning Activity & LXP) - 5개 테이블
-- ------------------------------------------------------------------------------------

CREATE TABLE `enrollments` (
    `enrollment_id` bigint      NOT NULL AUTO_INCREMENT COMMENT '등록 ID',
    `user_id`       bigint      NOT NULL COMMENT '수강생 ID',
    `course_id`     bigint      NOT NULL COMMENT '수강 과정 ID',
    `status`        varchar(20) NOT NULL DEFAULT 'active' COMMENT '수강 상태 (active, completed)',
    `enrolled_at`   timestamp   NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '등록일',
    `completed_at`  timestamp   NULL COMMENT '수료일',
    PRIMARY KEY (`enrollment_id`),
    FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
    FOREIGN KEY (`course_id`) REFERENCES `courses` (`course_id`),
    CHECK (`status` IN ('active', 'completed'))
) COMMENT '수강 신청 정보';

CREATE TABLE `user_progress` (
    `progress_id`   bigint      NOT NULL AUTO_INCREMENT COMMENT '진행 기록 ID',
    `user_id`       bigint      NOT NULL COMMENT '사용자 ID',
    `module_id`     bigint      NOT NULL COMMENT '모듈 ID',
    `status`        varchar(20) NOT NULL DEFAULT 'started' COMMENT '진행 상태 (started, completed)',
    `completed_at`  timestamp   NULL COMMENT '완료 일시',
    PRIMARY KEY (`progress_id`),
    FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
    FOREIGN KEY (`module_id`) REFERENCES `content_modules` (`module_id`),
    CHECK (`status` IN ('started', 'completed'))
) COMMENT '사용자의 학습 모듈 완료 상세 추적';

CREATE TABLE `certificates` (
    `certificate_id`    bigint          NOT NULL AUTO_INCREMENT COMMENT '수료증 ID',
    `enrollment_id`     bigint          NOT NULL UNIQUE COMMENT '수료한 수강 등록 ID',
    `verification_code` varchar(100)    NOT NULL UNIQUE COMMENT '검증 코드',
    `issued_at`         timestamp       NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '발급일',
    PRIMARY KEY (`certificate_id`),
    FOREIGN KEY (`enrollment_id`) REFERENCES `enrollments` (`enrollment_id`)
) COMMENT '과정 수료 시 발급되는 수료증 정보';

CREATE TABLE `learning_roadmaps` (
    `roadmap_id`    bigint          NOT NULL AUTO_INCREMENT COMMENT '로드맵 ID',
    `user_id`       bigint          NOT NULL COMMENT '소유자 ID',
    `title`         varchar(255)    NOT NULL COMMENT '로드맵 제목',
    PRIMARY KEY (`roadmap_id`),
    FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`)
) COMMENT '사용자 생성 개인화 학습 경로 정보';

CREATE TABLE `roadmap_modules` (
    `roadmap_id`    bigint  NOT NULL COMMENT '로드맵 ID',
    `module_id`     bigint  NOT NULL COMMENT '모듈 ID',
    `step_order`    int     NOT NULL COMMENT '학습 순서',
    PRIMARY KEY (`roadmap_id`, `module_id`),
    FOREIGN KEY (`roadmap_id`) REFERENCES `learning_roadmaps` (`roadmap_id`),
    FOREIGN KEY (`module_id`) REFERENCES `content_modules` (`module_id`)
) COMMENT '학습 로드맵과 모듈의 순서 관계 정의';


-- ------------------------------------------------------------------------------------
-- -- 도메인 4: 평가 및 커뮤니티 (Assessment & Community) - 10개 테이블
-- ------------------------------------------------------------------------------------

CREATE TABLE `assignments` (
    `assignment_id`     bigint          NOT NULL AUTO_INCREMENT COMMENT '과제 ID',
    `module_id`         bigint          NOT NULL COMMENT '연관된 모듈 ID',
    `title`             varchar(255)    NOT NULL COMMENT '과제 제목',
    `instructions`      text            NULL COMMENT '과제 설명 및 안내',
    `due_date`          timestamp       NULL COMMENT '제출 마감일',
    PRIMARY KEY (`assignment_id`),
    FOREIGN KEY (`module_id`) REFERENCES `content_modules` (`module_id`)
) COMMENT '과제 정보';

CREATE TABLE `assignment_submissions` (
    `submission_id`      bigint      NOT NULL AUTO_INCREMENT COMMENT '제출 ID',
    `assignment_id`      bigint      NOT NULL COMMENT '해당 과제 ID',
    `user_id`            bigint      NOT NULL COMMENT '제출자 ID',
    `submission_content` text        NULL COMMENT '제출 내용 (텍스트)',
    `media_asset_id`     bigint      NULL COMMENT '제출 파일 (미디어 자산 ID)',
    `submitted_at`       timestamp   NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '제출 시간',
    PRIMARY KEY (`submission_id`),
    FOREIGN KEY (`assignment_id`) REFERENCES `assignments` (`assignment_id`),
    FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
    FOREIGN KEY (`media_asset_id`) REFERENCES `media_assets` (`media_asset_id`)
) COMMENT '사용자의 과제 제출물';

CREATE TABLE `quizzes` (
    `quiz_id`   bigint          NOT NULL AUTO_INCREMENT COMMENT '퀴즈 ID',
    `module_id` bigint          NOT NULL COMMENT '연관된 모듈 ID',
    `title`     varchar(255)    NOT NULL COMMENT '퀴즈 제목',
    PRIMARY KEY (`quiz_id`),
    FOREIGN KEY (`module_id`) REFERENCES `content_modules` (`module_id`)
) COMMENT '퀴즈 정보';

CREATE TABLE `quiz_questions` (
    `question_id`   bigint          NOT NULL AUTO_INCREMENT COMMENT '문항 ID',
    `quiz_id`       bigint          NOT NULL COMMENT '소속된 퀴즈 ID',
    `question_text` text            NOT NULL COMMENT '문항 내용',
    `question_type` varchar(20)     NOT NULL COMMENT '문항 유형 (multiple_choice)',
    `options`       json            NULL COMMENT '보기 (객관식)',
    `correct_answer` text           NULL COMMENT '정답',
    PRIMARY KEY (`question_id`),
    FOREIGN KEY (`quiz_id`) REFERENCES `quizzes` (`quiz_id`)
) COMMENT '퀴즈를 구성하는 개별 문항';

CREATE TABLE `quiz_attempts` (
    `attempt_id`    bigint          NOT NULL AUTO_INCREMENT COMMENT '응시 기록 ID',
    `quiz_id`       bigint          NOT NULL COMMENT '응시한 퀴즈 ID',
    `user_id`       bigint          NOT NULL COMMENT '응시자 ID',
    `score`         decimal(5,2)    NULL COMMENT '최종 점수',
    `completed_at`  timestamp       NULL COMMENT '응시 완료 시간',
    PRIMARY KEY (`attempt_id`),
    FOREIGN KEY (`quiz_id`) REFERENCES `quizzes` (`quiz_id`),
    FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`)
) COMMENT '사용자의 퀴즈 응시 기록';

CREATE TABLE `user_quiz_answers` (
    `answer_id`     bigint      NOT NULL AUTO_INCREMENT COMMENT '답변 ID',
    `attempt_id`    bigint      NOT NULL COMMENT '퀴즈 응시 기록 ID',
    `question_id`   bigint      NOT NULL COMMENT '문항 ID',
    `user_answer`   text        NULL COMMENT '사용자가 제출한 답',
    `is_correct`    boolean     NULL COMMENT '정답 여부',
    PRIMARY KEY (`answer_id`),
    FOREIGN KEY (`attempt_id`) REFERENCES `quiz_attempts` (`attempt_id`),
    FOREIGN KEY (`question_id`) REFERENCES `quiz_questions` (`question_id`)
) COMMENT '사용자가 각 문항에 제출한 답변';

CREATE TABLE `grades` (
    `grade_id`              bigint          NOT NULL AUTO_INCREMENT COMMENT '성적 ID',
    `user_id`               bigint          NOT NULL COMMENT '학생 ID',
    `grader_id`             bigint          NOT NULL COMMENT '평가자 ID',
    `gradable_item_type`    varchar(50)     NOT NULL COMMENT '평가 항목 타입 (assignment, quiz)',
    `gradable_item_id`      bigint          NOT NULL COMMENT '평가 항목 ID',
    `score`                 decimal(5,2)    NOT NULL COMMENT '점수',
    `feedback`              text            NULL COMMENT '피드백',
    PRIMARY KEY (`grade_id`),
    FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
    FOREIGN KEY (`grader_id`) REFERENCES `users` (`user_id`)
) COMMENT '과제, 퀴즈 등 평가 항목에 대한 성적 통합';

CREATE TABLE `forums` (
    `forum_id`  bigint          NOT NULL AUTO_INCREMENT COMMENT '포럼 ID',
    `course_id` bigint          NOT NULL COMMENT '소속 과정 ID',
    `title`     varchar(255)    NOT NULL COMMENT '포럼 제목',
    PRIMARY KEY (`forum_id`),
    FOREIGN KEY (`course_id`) REFERENCES `courses` (`course_id`)
) COMMENT '각 과정에 종속된 커뮤니티 포럼';

CREATE TABLE `forum_threads` (
    `thread_id` bigint          NOT NULL AUTO_INCREMENT COMMENT '스레드 ID',
    `forum_id`  bigint          NOT NULL COMMENT '소속 포럼 ID',
    `author_id` bigint          NOT NULL COMMENT '작성자 ID',
    `title`     varchar(255)    NOT NULL COMMENT '글 제목',
    `content`   text            NOT NULL COMMENT '글 내용',
    PRIMARY KEY (`thread_id`),
    FOREIGN KEY (`forum_id`) REFERENCES `forums` (`forum_id`),
    FOREIGN KEY (`author_id`) REFERENCES `users` (`user_id`)
) COMMENT '포럼 내 개별 게시물(스레드)';

CREATE TABLE `forum_posts` (
    `post_id`        bigint  NOT NULL AUTO_INCREMENT COMMENT '댓글 ID',
    `thread_id`      bigint  NOT NULL COMMENT '원본 스레드 ID',
    `author_id`      bigint  NOT NULL COMMENT '댓글 작성자 ID',
    `parent_post_id` bigint  NULL COMMENT '부모 댓글 ID (대댓글용)',
    `content`        text    NOT NULL COMMENT '댓글 내용',
    PRIMARY KEY (`post_id`),
    FOREIGN KEY (`thread_id`) REFERENCES `forum_threads` (`thread_id`),
    FOREIGN KEY (`author_id`) REFERENCES `users` (`user_id`),
    FOREIGN KEY (`parent_post_id`) REFERENCES `forum_posts` (`post_id`)
) COMMENT '스레드에 달리는 댓글(답글)';