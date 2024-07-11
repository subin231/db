#실습3-1
create database college;
create user 'college'@'%' identified by '1234';
grant all privileges on bank.* to 'college'@'%';
flush privileges;


#실습 3-2
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
`reglecno`		int not null,
`regmidscore`	int default null,
`regfinalscore`	int default null,
`regtotalscore`	int default null,
`reggrade`		char(1) default null
);
 

#실습 3-3
 INSERT INTO `Student` (`stdno`, `stdname`, `stdhp`, `stdyear`, `stdaddress`) VALUES
('20201016', '김유신', '010-1234-1001', 3, null),
('20201126', '김춘추', '010-1234-1002', 3, '경상남도 경주시'),
('20210216', '장보고', '010-1234-1003', 2, '전라남도 완도군'),
('20210326', '강감찬', '010-1234-1004', 2, '서울시 영등포구'),
('20220416', '이순신', '010-1234-1005', 1, '부산시 부산진구'),
('20220521', '송상현', '010-1234-1006', 1, '부산시 동래구');

insert into `lecture` (`lecno`,`lecname`,`leccredit`,`lectime`,`lecclass`) values
('159','인지행동심리학'	,3 ,40 	,'본304' ),
('167','운영체제론'	,3 ,25 	,'본B05' ),
('234','중급 영문법'	,3 ,20 	,'본201' ),
('239','세법개론'		,3 ,40 	,'본204' ),
('248','빅데이터 개론'	,3 ,20 	,'본B01' ),
('253','컴퓨팅사고와 코딩',2 ,10 ,'본B02' ),
('349','사회복지 마케팅',2 ,50 	,'본301' );

 insert into `register` (`regstdno`,`reglecno`,`regmidscore`,`regfinalscore`,`regtotalscore`,`reggrade`) values 
 ('20201126','234',null,null,null,null),
 ('20201016','248',null,null,null,null),
 ('20201016','253',null,null,null,null),
 ('20201126','239',null,null,null,null),
 ('20210216','349',null,null,null,null),
 ('20210326','349',null,null,null,null),
 ('20201016','167',null,null,null,null),
 ('20220416','349',null,null,null,null);
 




#실습 3-4
select * from lecture ;

#실습 3-5
select * from student;

#실습 3-6
select * from register; 

#실습 3-7
select * from student
 where stdyear = 3;

#실습 3-8
select * from lecture 
 where leccredit = 2;

#실습 3-9
UPDATE `Register` SET `regMidScore` = 36, `regFinalScore`= 42 WHERE
`regStdNo`='20201126' AND `regLecNo`=234;
UPDATE `Register` SET `regMidScore` = 24, `regFinalScore`= 62 WHERE
`regStdNo`='20201016' AND `regLecNo`=248;
UPDATE `Register` SET `regMidScore` = 28, `regFinalScore`= 40 WHERE
`regStdNo`='20201016' AND `regLecNo`=253;
UPDATE `Register` SET `regMidScore` = 37, `regFinalScore`= 57 WHERE
`regStdNo`='20201126' AND `regLecNo`=239;
UPDATE `Register` SET `regMidScore` = 28, `regFinalScore`= 68 WHERE
`regStdNo`='20210216' AND `regLecNo`=349;
UPDATE `Register` SET `regMidScore` = 16, `regFinalScore`= 65 WHERE
`regStdNo`='20210326' AND `regLecNo`=349;
UPDATE `Register` SET `regMidScore` = 18, `regFinalScore`= 38 WHERE
`regStdNo`='20201016' AND `regLecNo`=167;
UPDATE `Register` SET `regMidScore` = 25, `regFinalScore`= 58 WHERE
`regStdNo`='20220416' AND `regLecNo`=349;

#실습 3-10
UPDATE `Register` set `regTotalScore`= `regMidScore` + `regFinalScore`,
`regGrade` = if(`regTotalScore` >= 90, 'A',
if(`regTotalScore` >= 80, 'B',
if(`regTotalScore` >= 70, 'C',
if(`regTotalScore` >= 60, 'D', 'F'))));

select * from register; 

#실습 3-11
select * from register 
 order  by reggrade;

#실습 3-12
select * from register
 where reglecno = '349'
 order by regtotalscore desc;

#실습 3-13
select * from lecture
where lectime >= 30;

#실습 3-14
select lecname, lecclass 
  from lecture;

#실습 3-15
 select stdno, stdname
   from student;
   
#실습 3-16
 select * from student
 where stdaddress is null;
  
#실습 3-17
select * from student 
where stdaddress like '부산%';

#실습 3-18
select * 
  from student a
  left join register b
    on a.stdno = b.regstdno;

#실습 3-19
select a.stdno, a.stdname, b.reglecno, b.regmidscore, b.regfinalscore, b.regtotalscore, b.reggrade
  from student a, register b
 where a.stdno = b.regstdno;

#실습 3-20
select a.stdname, a.stdno, b.reglecno
  from student a
   join register b
     on a.stdno = b.regstdno
 where b.reglecno = '349';

#실습 3-21
select stdno, stdname, count(stdno) as `수강신청 건수` , sum(regtotalscore) as `종합점수`, sum(regtotalscore) / count(stdno) as `평균`
  from student a
  join register b
    on a.stdno = b.regstdno
 group by stdno;


#실습 3-22
select * 
  from register a
  left join lecture b
    on a.reglecno = b.lecno;



#실습 3-23
select regstdno,reglecno,lecname,regmidscore,regfinalscore,regtotalscore,reggrade
  from register a
  left join lecture b
    on a.reglecno = b.lecno;

#실습 3-24
select 
	count(*) as `사회복지 마케팅`,
	avg(regtotalscore) as `사회복지 마케칭 평균`
  from register a
  join lecture b
    on a.reglecno = b.lecno
 where b.lecname = '사회복지 마케팅';
 
#실습 3-25
select regstdno, lecname
  from register a
  join lecture b
    on a.reglecno = b.lecno
 where a.reggrade = 'A';

#실습 3-26
select * 
  from student a
  join register b
    on a.stdno = b.regstdno
  join lecture c
    on b.reglecno = c.lecno;
   

#실습 3-27
select stdno, stdname, lecno, lecname, regmidscore, regfinalscore, regtotalscore, reggrade
  from student a
  join register b
    on a.stdno = b.regstdno
  join lecture c
    on b.reglecno = c.lecno
 order by reggrade;
    
#실습 3-28
select stdno, stdname, lecname, regtotalscore, reggrade
  from student a
  join register b
    on a.stdno = b.regstdno
  join lecture c
    on b.reglecno = c.lecno
 where reggrade = 'F';  
    
#실습 3-29
select stdno, stdname, sum(leccredit) as `이수학점`
  from student a
  join register b
    on a.stdno = b.regstdno
  join lecture c
    on b.reglecno = c.lecno
 where regtotalscore >60
 group by stdno  ;
 
#실습 3-30
select stdno, stdname, group_concat(lecname) as `신청과목`, group_concat(if(regtotalscore >=60, lecname, null)) as `이수과목`
  from student a
  join register b
    on a.stdno = b.regstdno
  join lecture c
    on b.reglecno = c.lecno
 group by stdno;

 
select * from lecture;

