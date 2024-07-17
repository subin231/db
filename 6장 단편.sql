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
 select 
	`regStdNo`, 
    `regLecNo`, 
    `regMidScore`,
    `regFinalScore`,
 	regmidscore + regfinalscore as '총합' , 
   case when (regmidscore + regfinalscore) >= 90 then 'A'
        when (regmidscore + regfinalscore) >= 80 then 'B'
        when (regmidscore + regfinalscore) >= 70 then 'C'
        when (regmidscore + regfinalscore) >= 60 then 'D'
        else 'F'
 	end as `등급`
   from register
  
    
#6-9-3 : 2학년 학생의 학번, 이름, 학년, 수강 강좌명, 중간점수, 기말점수, 총합, 등급을 조회하시오.
select a.stdno, a.stdname, a.stdyear, c.lecname, b.regmidscore, b.regfinalscore, b.regmidscore + b.regfinalscore as `총합` , 
  case when (b.regmidscore + b.regfinalscore) >=90 then 'A'
       when (b.regmidscore + b.regfinalscore) >=80 then 'B'
       when (b.regmidscore + b.regfinalscore) >=70 then 'C'
       when (b.regmidscore + b.regfinalscore) >=60 then 'D'
  else 'F'
   end as '등급'  
  from student a
  join register b
    on a.stdno = b.regstdno
  join lecture c
    on b.regLecNo = c.lecNo
 where a.stdyear = 2