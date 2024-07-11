#실습 4-1
create database Theater;
create user 'Theater'@'%' identified by '1234';
grant all privileges on Theater.* to 'Theater'@'%';
flush privileges;


#실습 4-2
create table movies(
`movie_id`		int primary key auto_increment,
`title`			VARCHAR(30) not null,
`genre`			VARCHAR(10) not null,
`release_date`	DATE not NULL
);


create table customers(
`customer_id`	int primary key auto_increment,
`name`			VARCHAR(20) not null,
`email`			VARCHAR(50) not null,
`phone`			char(13) 	not NULL
);

create table bookings(
`booking_id`		int primary key auto_increment,
`customer_id`		int not null,
`movie_id`			int not null,
`num_tickets`		int not null,
`booking_date` 		datetime not null
);

#실습 4-3
select * from movies;
insert into movies (`title`, `genre`, `release_date`) values
('쇼생크의 탈출','드라마','1994-10-14'),
('타이타닉','로맨스','1997-03-24'),
('탑건','액션','1987-07-16'),
('쥬라기공원','액션','1994-02-11'),
('글래디에이터','액션','2000-05-03'),
('시네마천국','드라마','1995-04-12'),
('미션임파서블','액션','1995-11-11'),
('노트북','로맨스','2003-08-23'),
('인터스텔라','SF','2011-05-26'),
('아바타','SF','2010-02-10');



insert into customers(name, email, phone) values
('김유신', 'kys@example.com', '010-1234-1001'),
('김춘추', 'kcc@example.com', '010-1234-1002'),
('장보고', 'jbg@example.com', '010-1234-1003'),
('강감찬', 'kgc@example.com', '010-1234-1004'),
('이순신', 'lss@example.com', '010-1234-1005');

insert into bookings(
`booking_id`,	
`customer_id`,	
`movie_id`	,
`num_tickets`,	
`booking_date`) values
(101, 1, 1, 2, '2023-01-10 00:00:00'),
(102, 2, 2, 3, '2023-01-11 00:00:00'),
(103, 3, 2, 2, '2023-01-13 00:00:00'),
(104, 4, 3, 1, '2023-01-17 00:00:00'),
(105, 5, 5, 2, '2023-01-21 00:00:00'),
(106, 3, 8, 2, '2023-01-21 00:00:00'),
(107, 1, 10, 4,'2023-01-21 00:00:00'),
(108, 2, 9, 1, '2023-01-22 00:00:00'),
(109, 5, 7, 2, '2023-01-23 00:00:00'),
(110, 3, 4, 2, '2023-01-23 00:00:00'),
(111, 1, 6, 1, '2023-01-24 00:00:00'),
(112, 3, 5, 3, '2023-01-25 00:00:00');


#실습 4-4
select title from movies;

#실습 4-5
select * from movies 
 where genre = '로맨스';

#실습 4-6
select title, release_date
  from Movies 
 where left(release_date,4) >= '2010';


#실습 4-7
select booking_id, booking_date
  FROM Bookings 
 where num_tickets >= 3;  

#실습 4-8
select * from bookings
where booking_date <='2023-01-20'; 


#실습 4-9
select * from movies 
 where release_date between '1990-01-01' and '1999-12-31';


#실습 4-10
select * from bookings
order by booking_date desc
limit 3;

#실습 4-11
select title, release_date
  from movies
 order by release_date asc
 limit 1;
 

#실습 4-12
select concat(title, '-', release_date) as movie_info
  from movies
 where genre = '액션'
   and title like '%공원%'
 order by release_date asc 
 limit 1;

#실습 4-13
select booking_date, title
  from bookings a
  join movies b
    on a.movie_id = b.movie_id
 where customer_id = 2;


#실습 4-14
select b.name, b.phone, a.booking_date, c.title
  from bookings a
  join customers b
    on a.customer_id = b.customer_id
  join movies c
    on a.movie_id = c.movie_id;

#실습 4-15
select b.genre, avg(a.num_tickets) as `avg_tickets`
  from bookings a
  join movies b
    on a.movie_id = b.movie_id
 group by b.genre;
   
#실습 4-16
select b.name, avg(a.num_tickets) as `avg_tickets`
  from bookings a
  join customers b
    on a.customer_id = b.customer_id
 group by b.name;


#실습 4-17
select b.name, sum(a.num_tickets) as `전체 예매 티켓 수`
  from bookings a
  join customers b
    on a.customer_id = b.customer_id
 group by b.name
 order by `전체 예매 티켓 수` desc;

#실습 4-18
select a.booking_id, a.movie_id, b.name, a.booking_date 
  from bookings a
  join customers b
    on a.customer_id = b.customer_id
 order by a.booking_date asc
 limit 1;

#실습 4-19
select genre, title, release_date
from Movies
where (genre, release_date) IN (
		select genre, MAX(release_date)
		  FROM Movies
		 group by genre);
		
		
#실습 4-20
SELECT * FROM Movies
WHERE movie_id IN (
SELECT movie_id FROM Bookings
WHERE customer_id = (SELECT customer_id from customers where name = '김유신')
);
		
#실습 4-21
select name, email 
  from Customers
 where customer_id = (
		SELECT customer_id
		  FROM Bookings
		 GROUP BY customer_id
		 ORDER BY SUM(num_tickets) desc
		 limit 1);

#실습 4-22
select * from bookings
where num_tickets > (
		select avg(num_tickets) from bookings
        ); 

#실습 4-23
SELECT
b.title, SUM(a.num_tickets) AS total_tickets
FROM Bookings a
JOIN Movies b ON a.movie_id = b.movie_id
group by b.title;

#실습 4-24
select
b.name,
sum(a.num_tickets) AS total_tickets,
AVG(a.num_tickets) AS avg_tickets
FROM Bookings a
JOIN Customers b ON a.customer_id = b.customer_id
group by b.name;

#실습 4-25
select 
b.customer_id,
b.name,
b.email,
SUM(a.num_tickets) AS `예매 티켓수`
  from Bookings a
  join Customers b 
    ON a.customer_id = b.customer_id
 group by b.customer_id
 order by `예매 티켓수` DESC;

#실습 4-26
select b.name, c.title, a.num_tickets, a.booking_date
  from bookings a
  join customers b
    on a.customer_id = b.customer_id
  join movies c
    on a.movie_id = c.movie_id
 order by num_tickets desc;

#실습 4-27
select b.title, b.genre, sum(a.num_tickets) as `예매 티켓 수`, avg(a.num_tickets) as `평균 티켓 수` 
  from bookings a
  join movies b
    on a.movie_id = b.movie_id
 where b.genre = '액션'
 group by b.title
 order by `평균 티켓 수` desc;
 
#실습 4-28
select a.customer_id, b.name, SUM(`num_tickets`) AS `ticket_total`
FROM bookings a
JOIN Customers b ON a.customer_id = b.customer_id
GROUP BY a.customer_id
ORDER BY ticket_total DESC;

#실습 4-29
select a.booking_id, a.customer_id, a.movie_id, MaxTickets.max_tickets
  from Bookings a
  join (
		select movie_id, MAX(num_tickets) AS max_tickets
		from Bookings
		group by movie_id
		) MaxTickets
    on a.movie_id = MaxTickets.movie_id 
   and a.num_tickets = MaxTickets.max_tickets;


#실습 4-30
select a.booking_id, a.customer_id, c.name, b.title, b.genre, sum(a.num_tickets) AS `예매 티켓 수`
  from bookings a
  join movies b 
    on a.movie_id = b.movie_id
  join customers c 
    on a.customer_id = c.customer_id
 group by b.title
having `예매 티켓 수` = 
		(select max(total_tickets)
		   from (
		 		select sum(a2.num_tickets) as `total_tickets`
				  from Bookings a2
		  		  join Movies b2 
		    		on a2.movie_id = b2.movie_id
		 		 where b2.genre = b.genre
		 		 group by b2.title) AS SelectMAX)
order by `예매 티켓 수` desc;

SET SESSION sql_mode = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';
