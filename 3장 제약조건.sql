#날짜 : 2024/07/02
#이름 : 조수빈
#내용 : 3장 제약조건


#실습 3-1기본키
CREATE TABLE `User2` (
`uid` 	VARCHAR(10) PRIMARY KEY,
`name` 	VARCHAR(10),
`birth` CHAR(10),
`addr` 	VARCHAR(50)
);

#실습 3-2.User2 데이터 추가하기
insert into `User2` values ('A101', '김유신', '1968-05-09', '010-1234-1001', '경남 김해시');
insert into `User2` values ('A102', '김춘수', '1972-11-23', '010-1234-1002', '경남 진주시');
insert into `User2` values ('A103', '장보고', '1978-03-01', '010-1234-1003', '전남 완도군');
insert into `User2` values ('A104', '강감찬', '1979-08-16', '010-1234-1004', '서울시 관악구');
insert into `User2` values ('A105', '이순신', '1981-05-23', '010-1234-1005', '부산시 진구');
select * from user2;


#실습 3-3 고유키
CREATE TABLE `User3` (
`uid` VARCHAR(10) PRIMARY KEY,
`name` VARCHAR(10),
`birth` CHAR(10),
`hp` CHAR(13) UNIQUE,
`addr` VARCHAR(50)
);

#실습 3-4 User3 데이터 추가하기
insert into `User3` values ('A101', '김유신', '1968-05-09', '010-1234-1001', '경남 김해시');
insert into `User3` values ('A102', '김춘수', '1972-11-23', '010-1234-1002', '경남 진주시');
insert into `User3` values ('A103', '장보고', '1978-03-01', '010-1234-1003', '전남 완도군');
insert into `User3` values ('A104', '강감찬', '1979-08-16', '010-1234-1004', '서울시 관악구');
insert into `User3` values ('A105', '이순신', '1981-05-23', '010-1234-1005', '부산시 진구');
insert into `User3` values ('A106', '홍길동', '1999-09-09', null, '부산시 남구');

select * from user3 ;

#실습 3-5
CREATE TABLE `Parent` (
	`pid` 	VARCHAR(10) PRIMARY KEY,
	`name` 	VARCHAR(10),
	`birth` CHAR(10),
	`addr` 	VARCHAR(100));


CREATE TABLE `Child` (
	`cid` 		VARCHAR(10) PRIMARY KEY,
	`name`	 	VARCHAR(10),
	`hp` 		CHAR(13) UNIQUE,
	`parent` 	VARCHAR(10),
	FOREIGN KEY (`parent`) REFERENCES `Parent` (`pid`));
    
    select a.cid, a.name, a.hp, a.parent, b.name from child a
    left join parent b
    on a.parent = b.pid;
    


#실습 3-6 부모 자식 테이블 데이터 추가하기
insert into `Parent` values ('p101', '김유신', '1968-05-09', '경남 김해시');
insert into `Parent` values ('p102', '김춘수', '1972-11-23', '경남 진주시');
insert into `Parent` values ('p103', '장보고', '1978-03-01', '전남 완도군');
insert into `Parent` values ('p104', '강감찬', '1979-08-16', '서울시 관악구');
insert into `Parent` values ('p105', '이순신', '1981-05-23', '부산시 진구');

insert into `Child` values ('c101','김철수','010-1234-1001','p101');
insert into `Child` values ('c102','김영희','010-1234-1002','p101');
insert into `Child` values ('c103','강철수','010-1234-1003','p103');
insert into `Child` values ('c104','이철수','010-1234-1004','p105');
insert into `Child` values ('c105','이철수','010-1234-1005','p107');


#실습 3-7 Default 와 NOT NULL
create table `user4`(
	`uid` 	varchar(10) primary key,
	`name`	varchar(10) not null,
	`gender`char(1),
	`age`	int default 1,
	`hp`	char(13) unique,
	`addr`	varchar(20)
);

#실습 3-8 user4 데이터 추가하기

insert into `user4` values ('a101','김유신','M','25','010-1234-1111','경남 김해시');
insert into `user4` values ('a102','김춘추','M','23','010-1234-2222','경남 경주시');
insert into `user4` values ('a103','장보고','M','35','010-1234-3333','전남 완도시');
insert into `user4` values ('a104','강감찬','M','42','010-1234-4444','서울시 관악구');
insert into `user4` values ('a105', NULL,'M', NULL,'010-1234-5555','부산시 진구0');
insert into `user4` values ('a106','신사임당','F','32',NULL,'강릉시');
insert into `user4` values ('a107','허난설현','F','27',NULL,'경기도 광주시');

#실습 3-9 check 와 Auto_Increment
create table `user5`(
	`seq`		int primary key auto_increment,
	`name`		varchar(10) not null,
	`gender`	char(1) check (`gender` in ('M','F')),
	`age`		int default 1 check (`age` > 0 and `age` < 100),
	`addr`		varchar(20)
);
#실습 3-10 user5 데이터 추가하기

insert into `user5` values ('a101','김유신','M','25','경남 김해시');
insert into `user5` values ('a102','김춘추','M','23','경남 경주시');
insert into `user5` values ('a103','장보고','M','35','전남 완도시');
insert into `user5` values ('a104','강감찬','M','42','서울시 관악구');
insert into `user5` values ('a105','이순신','A','51','부산시 진구0');
insert into `user5` values ('a106','신사임당','F','-1','강릉시');