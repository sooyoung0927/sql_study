	create database chundb;
	-- 권한 부여
	grant all privileges on chundb.* to wanted@'%';
	-- 권한 부여 확인
	show grants for wanted@'%';