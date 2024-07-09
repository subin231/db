#실습 1-1
create database shop;
create user 'shop'@'%' identified by '1234';
grant all privileges on shop.* to 'shop'@'%';
flush privileges;

#실습 1-2

create table Customer(
	`custid` 	varchar(10) primary key not null,
	`name` 		varchar(10) not null,
	`hp` 		varchar(13) default null,
	`addr`		varchar(100) default null,
	`rdate`		date not null
);

create table Product(
	`prodNo`	int primary key not null,
	`prodName`	varchar(10) not null,
	`stock`		int not null default 0,
	`price`		int default null,
	`company`	varchar(20) not null
);


create table `Order`(
	`orderno`		int primary key auto_increment, 
	`orderId`		varchar(10) not null,
	`orderProduct`	int not null,
	`orderCount`	int not null default 1,
	`orderDate`  	datetime not null
);



#실습 1-3
# customer

INSERT INTO Customer (custId, name, hp, addr, rdate) VALUES 
('c101', '김유신', '010-1234-1001', '경주시 봉황동', '2022-01-01'),
('c102', '김춘추', '010-1234-1002', '경주시 보문동', '2022-01-02'),
('c103', '장보고', '010-1234-1003', '완도군 정산면', '2022-01-03'),
('c104', '강감찬', '010-1234-1004', '서울시 마포구', '2022-01-04'),
('c105', '이성계', NULL, null, '2022-01-05'),
('c106', '정철', '010-1234-1006', '경기도 용인시', '2022-01-06'),
('c107', '허준', NULL, null, '2022-01-07'),
('c108', '이순신', '010-1234-1008', '서울시 영등포구', '2022-01-08'),
('c109', '송상현', '010-1234-1009', '부산시 동래구', '2022-01-09'),
('c110', '정약용', '010-1234-1010', '경기도 광주시', '2022-01-10');


# product
INSERT INTO Product (prodNo, prodName, stock, price, company) VALUES 
(1, '새우깡', 5000, 1500, '농심'),
(2, '초코파이', 2500, 2500, '오리온'),
(3, '포카칩', 3600, 1700, '오리온'),
(4, '양파링', 1250, 1800, '농심'),
(5, '죠리퐁', 2200, NULL, '크라운'),
(6, '마카렛트', 3500, 3500, '롯데'),
(7, '뿌셔뿌셔', 1650, 1200, '오뚜기');


INSERT INTO `Order` (orderNo, orderId, orderProduct, orderCount, orderDate) VALUES 
(1, 'c102', 3, 2, '2022-07-01 13:15:10'),
(2, 'c101', 4, 1, '2022-07-01 14:16:11'),
(3, 'c108', 1, 1, '2022-07-01 17:23:18'),
(4, 'c109', 6, 5, '2022-07-02 10:46:36'),
(5, 'c102', 2, 1, '2022-07-03 09:15:37'),
(6, 'c101', 7, 3, '2022-07-03 12:35:12'),
(7, 'c110', 1, 2, '2022-07-03 16:55:36'),
(8, 'c104', 2, 4, '2022-07-04 14:23:23'),
(9, 'c102', 1, 3, '2022-07-04 21:54:34'),
(10, 'c107', 6, 1, '2022-07-05 14:21:03');


#실습 1-4
select * from customer;


#실습 1-5
select custId, name, hp from customer;

#실습 1-6
select * from product;

#실습 1-7
select company from product;

#실습 1-8
select distinct(company) from product;

#실습 1-9
select prodname, price from product;

#실습 1-10
select prodname, price + 500 as 조정단가 from product ;

#실습 1-11
select prodname, stock, price from product where company = '오리온';

#실습 1-12
select orderproduct, ordercount, orderdate from `order` 
where orderid = 'c102';

#실습 1-13
 select orderproduct, ordercount, orderdate from `order` 
where orderid = 'c102'
  and ordercount >= 2;

#실습 1-14
select * from `product`
where price between 1000 and 2000;


#실습 1-15
select custid, name, hp, addr from customer where name like '김%';

#실습 1-16
select custid, name, hp, addr from customer where name like '__';

#실습 1-17
select * from `customer` where hp is null;

#실습 1-18
select * from customer where addr is null;

#실습 1-19
select * from customer order by rdate desc;

#실습 1-20
select * from `order` where ordercount >=3
order by ordercount desc, orderproduct;

#실습 1-21
select avg(price) from product;

#실습 1-22
select sum(stock) from product where company = '농심' ;

#실습 1-23
select count(custid) from customer;

#실습 1-24
select count(distinct(company))as '제조업체 수' from product;

#실습 1-25
select  `orderproduct`, sum(`ordercount`)as '총 주문수량' 
  from `order`
 group by orderproduct
 order by orderproduct;

#실습 1-26
select company as '제조업체', count(*) as '제품수', max(price) as '최고가' from product
group by company
order by company;

#실습 1-27
select company as '제조업체', count(*) as '제품수', max(price) as '최고가' from product
group by company
having `제품수`>=2
order by company;


#실습 1-28
select orderproduct, orderid, sum(`orderCount`) as '총 주문수량'  
  from `order`
 group by orderproduct, orderid
 order by orderproduct ;

#실습 1-29
 select a.orderid, b.prodname
   from `order` a
   join product b
     on a.orderproduct = b.prodno
  where orderid = 'c102';
 
#실습 1-30
  
SELECT `orderid`, `name`, `prodName`, `orderDate` 
  FROM `Order` AS a
  JOIN `Customer` AS b
    ON a.orderId = b.custId
  JOIN `Product` AS c
    ON a.orderProduct = c.prodNo
 WHERE left(`orderDate`, 10) = '2022-07-03'; 
  
  
 