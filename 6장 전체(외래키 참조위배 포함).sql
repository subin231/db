#실습 6-2

CREATE TABLE Customer (
    custId 	VARCHAR(10) PRIMARY KEY,
    name 	VARCHAR(50),
    hp 		VARCHAR(15),
    addr 	VARCHAR(100),
    rdate 	DATE
);

CREATE TABLE Product (
    prodNo 		INT PRIMARY KEY,
    prodName 	VARCHAR(50),
    stock 		INT,
    price 		INT,
    company 	VARCHAR(50)
);

CREATE TABLE `Order` (
    orderNo 		INT PRIMARY KEY,
    orderId 		VARCHAR(10),
    orderProduct 	INT,
    orderCount 		INT,
    orderDate 		DATETIME,
    FOREIGN KEY (orderId) REFERENCES Customer(custId),
    FOREIGN KEY (orderProduct) REFERENCES Product(prodNo)
);

INSERT INTO Customer (custId, name, hp, addr, rdate) VALUES
('c101', '김유신', '010-1234-1001', '경남 김해시', '2023-01-01'),
('c102', '김춘추', '010-1234-1002', '경남 강주시', '2023-01-02'),
('c103', '장보고', '010-1234-1003', '전남 완도군', '2023-01-03'),
('c104', '강감찬', '010-1234-1004', '서울시 관악구', '2023-01-04'),
('c105', '이순신', '010-1234-1005', '부산시 금정구', '2023-01-05');

INSERT INTO Product (prodNo, prodName, stock, price, company) VALUES
(1, '새우깡', 5000, 1500, '농심'),
(2, '초코파이', 2500, 2500, '오리온'),
(3, '포카칩', 3600, 1700, '오리온'),
(4, '양파링', 1250, 1800, '농심'),
(5, '죠리퐁', 2000, NULL, '크라운');

INSERT INTO `Order` (orderNo, orderId, orderProduct, orderCount, orderDate) VALUES
(1, 'c102', 3, 2, '2023-01-01 13:15:10'),
(2, 'c101', 4, 1, '2023-01-01 13:15:12'),
(3, 'c103', 2, 3, '2023-01-01 13:15:14'),
(4, 'c105', 1, 5, '2023-01-01 13:15:16'),
(5, 'c105', 3, 2, '2023-01-01 13:15:18');

# 실습 6-3
# 모든 주문의 주문번호, 주문한 고객명, 주문한 상품명, 주문 수량, 주문일을 조회하시오
select a.orderNo, b.name, c.prodname, a.orderCount, a.orderDate 
  from `order` a
  left join customer b
    on a.orderid = b.custid
  left join product c
    on a.orderproduct = c.prodno
    
 # 김유신이 주문한 상품의 주문번호d, 상품번호d, 상품명, 가격, 주문수량, 주문일을 조회하시오.
 select a.orderno, a.orderproduct, c.prodname, c.price, a.ordercount, a.orderdate  
   from `order` a
   left join customer b
     on a.orderid = b.custid
   left join product c
     on a.orderproduct = c.prodno
  where b.name = "김유신"
  
# 주문한 상품의 총 주문 금액을 조회하시오
select sum(a.ordercount * b.price) as '주문한 상품의 총 주문 금액'
  from `order` a
  left join product b
  on a.orderproduct = b.prodno
  
  
#실습 6-4
  
  
  
#실습 6-5
drop table bank_customer ;
drop table bank_account ;
drop table bank_transaction ;

  
  
CREATE TABLE bank_customer (
    c_no VARCHAR(20) PRIMARY KEY,
    c_name VARCHAR(50),
    c_dist INT,
    c_phone VARCHAR(20),
    c_addr VARCHAR(100)
);

CREATE TABLE bank_account (
    a_no VARCHAR(20) PRIMARY KEY,
    a_item_dist VARCHAR(2),
    a_item_name VARCHAR(50),
    a_c_no VARCHAR(20),
    a_balance INT,
    a_open_date DATE,
    FOREIGN KEY (a_c_no) REFERENCES bank_customer(c_no)
);

CREATE TABLE bank_transaction (
    t_no INT PRIMARY KEY,
    t_a_no VARCHAR(20),
    t_dist INT,
    t_amount INT,
    t_datetime DATETIME,
    FOREIGN KEY (t_a_no) REFERENCES bank_account(a_no)
);

INSERT INTO bank_customer (c_no, c_name, c_dist, c_phone, c_addr) VALUES
('730423-1000001', '김유신', 1, '010-1234-1001', '경남 김해시'),
('730423-1000002', '김춘추', 1, '010-1234-1002', '경남 경주시'),
('750423-1000003', '장보고', 1, '010-1234-1003', '전남 완도군'),
('102-12-51094', '(주)정보산업', 2, '051-500-1004', '부산시 부산진구'),
('930423-1000005', '이순신', 1, '010-1234-1005', '서울 종로구');

select * from bank_account
INSERT INTO bank_account (a_no, a_item_dist, a_item_name, a_c_no, a_balance, a_open_date) VALUES
('101-11-1001', 'S1', '자유저축예금', '730423-1000001', 1550000, '2011-04-11'),
('101-11-1002', 'S1', '자유저축예금', '930423-1000005', 260000, '2011-05-12'),
('101-11-1003', 'S1', '자유저축예금', '750423-1000003', 75000, '2011-06-13'),
('101-12-1001', 'S2', '기업전용예금', '102-12-51094', 15000000, '2011-07-14'),
('101-13-1001', 'S3', '정기저축예금', '730423-1000002', 1200000, '2011-08-15');



# 참조 무결성 위배됨 
# ★중요 SET foreign_key_checks = 0; 으로 데이터 넣은 후 SET foreign_key_checks = 1;로 닫아놔야함
INSERT INTO `bank_transaction` (t_a_no, t_dist, t_amount, t_datetime) VALUES
( '101-11-1001', 1, 50000, 		'2023-01-01 13:15:10'),
( '101-12-1001', 2, 1000000,	'2023-01-02 13:15:12'),
( '101-11-1002', 3, 260000,   	'2023-01-03 13:15:14'),
( '101-11-1002', 2, 100000,   	'2023-01-04 13:15:16'),
( '101-11-1003', 3, 75000,    	'2023-01-05 13:15:18'),
( '101-11-1001', 1, 150000,   	'2023-01-05 13:15:28');


#실습 6-6 
#6-6-1 모든 고객의 고객번호, 이름, 연락처, 계좌번호, 계좌상품명, 현재잔액을 조회하시오

# 해결방법 : balance => 현재잔액으로 풀어야함.

select a.c_no, a.c_name, a.c_phone, b.a_no, b.a_item_name, b.a_balance 
  from bank_customer a
  left join bank_account b
    on a.c_no = b.a_c_no 
 order by b.a_no ;

#6-6-2 이순신 고객명으로 모든 거래내역 중 거래구분, 거래금액, 거래날짜를 조회하시오
#c.t_dist, c.t_amount, c.t_datetime 
select *
  from bank_account a
  join bank_customer b
    on a.a_c_no =b.c_no 
  join bank_transaction c
    on a.a_no =c.t_a_no 
 where b.c_name = '이순신';



 #6-6-3 개인고객 중 현재잔액이 가장 큰 고객의 주민번호, 고객명, 계좌번호, 현재잔액, 계좌개설일을 조회하시오.
 select a.c_no, a.c_name, b.a_no, b.a_balance, b.a_open_date 
   from bank_customer a
   left join bank_account b
     on a.c_no = b.a_c_no 
  where b.a_item_dist in ('s1','s3')
  limit 1;
 
 
 
 # 실습 6-7 
create table Student(
`stdno` 		char(8) primary key,
`stdname`		varchar(20) not null,
`stdhp`			char(13) not null,
`stdyear`		tinyint not null,
`stdaddress`	varchar(100) default null
);

create table lecture(
`lecno`		int primary key,
`lecname`	varchar(20) not null,
`lecCredit` tinyint not null,
`lectime` 	tinyint not null,
`lecClass`	varchar(10) default null
);

 
create table register(
`regstdno`		char(8) not null,
`reglecno`		int,
`regmidscore`	int default null,
`regfinalscore`	int default null,
`regtotalscore`	int default null,
`reggrade`		char(1) default null,
PRIMARY KEY (regStdNo, regLecNo),
FOREIGN KEY (regStdNo) REFERENCES Student(stdNo),
FOREIGN KEY (regLecNo) REFERENCES Lecture(lecNo)
)
 
 # 실습 6-8
 INSERT INTO `Student` (`stdno`, `stdname`, `stdhp`, `stdyear`, `stdaddress`) VALUES
('20201011', '김유신', '010-1234-1001', 3, '경남 김해시'),
('20201122', '김춘추', '010-1234-1002', 3, '경남 경주시'),
('20210213', '장보고', '010-1234-1003', 2, '전남 완도군'),
('20210324', '강감찬', '010-1234-1004', 2, '서울 관악구'),
('20220415', '이순신', '010-1234-1005', 1, '서울 종로구');

insert into `lecture` (`lecno`,`lecname`,`leccredit`,`lectime`,`lecclass`) values
('101','컴퓨터과학 개론',2 ,40 ,'본301' ),
('102','프로그래밍 언어',3 ,52 ,'본302' ),
('103','데이터베이스'	,3 ,56 ,'본303' ),
('104','자료구조'		,3 ,60 ,'본304' ),
('105','운영체제'		,3 ,52 ,'본305' );

 insert into `register` (`regstdno`,`reglecno`,`regmidscore`,`regfinalscore`,`regtotalscore`,`reggrade`) values 
 ('20220415','101',60,30,null,null),
 ('20210324','103',54,36,null,null),
 ('20201011','105',52,28,null,null),
 ('20220415','102',38,40,null,null),
 ('20210324','104',56,32,null,null),
 ('20210213','103',48,40,null,null);
 
 
 #실습 6-9
#6-9-1 : 이번 학기에 수강신청 하지 않은 학생의 학번, 이름, 연락처, 학년을 조회하시오.
select a.stdno, a.stdname, stdhp, stdyear  
  from student a
  left join register b
    on a.stdno = b.regstdno
 where regstdno is null
 
#6-9-2 : 중간고사 점수와 기말고사 점수의 총합을 구하고 등급을 구하시오
# 등급 어떠한 방향으로 조건을 주는지 확인해야함!
 select sum(regmidscore + regfinalscore) as '총합' , reggrade
  from register
 group by reggrade
  

#6-9-3 : 2학년 학생의 학번, 이름, 학년, 수강 강좌명, 중간점수, 기말점수, 총합, 등급을 조회하시오.
select a.stdno, a.stdname, a.stdyear, b.reglecno, b.regmidscore, b.regfinalscore, sum(b.regmidscore + b.regfinalscore) as `총합` , 
  case when sum(b.regmidscore + b.regfinalscore) >=90 then b.reggrade = 'A'
       when sum(b.regmidscore + b.regfinalscore) >=80 then b.reggrade = 'B'
  else b.reggrade = 'C'
   end as 'grade'  
  from student a
  left join register b
    on a.stdno = b.regstdno
 where a.stdyear = 2
 group by a.stdno, a.stdname, a.stdyear, b.reglecno, b.regmidscore, b.regfinalscore, b.reggrade
