insert into student (stdNO,depNo,proNo,stdName,stdJumin,stdHp,stdEmail,stdAddr) values
('20101001', 10, 'P10101', '정우성', '760121-1234567', '010-1101-7601', null, '서울'),
('20100102', 10, 'P10101', '이정재', '750611-1234567', '010-1102-7506', null, '서울'),
('20111011', 11, 'P11103', '전지현', '890530-1234567', '010-1103-8905', 'jjh@naver.com', '대전'),
('20111013', 11, 'P11103', '이나영', '790413-1234567', '010-2101-7904', 'lee@naver.com', '대전'),
('20111014', 11, 'P11104', '원빈',  '660912-1234567', '010-2104-6609', 'one@daum.net', '대전'),
('21221010', 22, 'P22110', '장동건', '790728-1234567', '010-3101-7907', 'jang@naver.com', '대구'),
('20120121', 23, 'P23102', '고소영', '840615-1234567', '010-4101-8406', 'goso@daum.net', '대구'),
('22311011', 31, 'p31104', '김연아', '651021-1234567', '010-5101-6510', 'yuna@daum.net', '대구'),
('22311014', 31, 'p31104', '유재석', '721128-1234567', '010-6101-7211', null, '부산'),
('22401001', 40, 'p40101', '강호동', '920907-1234567', '010-7103-9209', null, '부산'),
('22401002', 40, 'p40101', '조인성', '891209-1234567', '010-7104-8912', 'join@gmail.com', '광주'),
('22421003', 42, 'p42103', '강동원', '770314-1234567', '010-8101-7703', 'dong@naver.com', '광주');

insert into professors (proNo, depno, proname, projumin, proHp, proEmail, proAddr) values
('P10101', 10,'김유신',	'750120-1234567','010-1101-1976','kimys@hg.ac.kr','서울'),
('P10102', 10,'계백',		'740610-1234567','010-1102-1975','gaeback@hg.ac.kr','서울'),
('P11101', 11,'김관창',	'880529-1234567','010-1103-1989','kwanch@hg.ac.kr','대전'),
('P11103', 11,'김춘추',	'780412-1234567','010-2101-1979','kimcc@hg.ac.kr','대전'),
('P11104', 11,'이사부',	'650911-1234567','010-2104-1966','leesabu@hg.ac.kr','대전'),
('P22110', 22,'장보고',	'780727-1234567','010-3101-1979','jangbg@hg.ac.kr','대구'),
('P23102', 23,'선덕여왕',	'830614-1234567','010-4101-1984','gueen@hg.ac.kr','대구'),
('P31101', 31,'강감찬',	'641020-1234567','010-5101-1965','kang@hg.ac.kr','대구'),
('P31104', 31,'신사임당',	'711127-1234567','010-6101-1972','sinsa@hg.ac.kr','부산'),
('P40101', 40,'이이',		'910906-1234567','010-7103-1992','leelee@hg.ac.kr','부산'),
('P40102', 40,'이황',		'881208-1234567','010-7104-1989','hwang@hg.ac.kr','광주'),
('P42103', 42,'송상현',	'760313-1234567','010-8101-1977','ssh@hg.ac.kr','광주');

insert into departments (depNo, depname, deptel) values
(10,'국어국문학과','051-510-1010'),
(11,'영어영문학과','051-510-1011'),
(20,'경영학과','051-510-1020'),
(21,'경제학과','051-510-1021'),
(22,'정치외교학과','051-510-1022'),
(23,'사회복지학과','051-510-1023'),
(30,'수학과','051-510-1030'),
(31,'통계과','051-510-1031'),
(32,'생명과학과','051-510-1032'),
(40,'기계공학과','051-510-1040'),
(41,'전자공학과','051-510-1041'),
(42,'컴퓨터공학과','051-510-1042');

insert into lectures (lecNo, proNo, lecName, lecCredit, lecTime, lecClass) values
('101001','P10101','대학 글쓰기',2 ,10 ,'본102'),
('101002','P10102','한국어음운론',3 ,30 ,'본102'),
('101003','P10102','한국현대문학사',3 ,30 ,'본103'),
('111011','P11103','중세영문학',3 ,25 ,'본201'),
('111012','P11104','영미시',3 ,25 ,'본201'),
('231110','P23102','사회복지학개론',1 ,8 ,'별관103'),
('311002','P31101','통계학의 이해',2 ,16 ,'별관303'),
('311003','P31104','기초 통계학',3 ,26 ,'별관303'),
('401019','P40101','기계역학',3 ,36 ,'공학관 102'),
('421012','P42103','데이터베이스',3 ,32 ,'공학관 103');

insert into register (stdNo, lecNo, proNo, regAttenScore, regMidScore, regFinalScore, regEtcScore, regTotal, regGrade) values
('20101001','101001','P10101',null,null,null,null,null,null),
('20101001','101002','P10102',null,null,null,null,null,null),
('20111013','111011','P11103',null,null,null,null,null,null),
('21231002','231110','P23102',null,null,null,null,null,null),
('22401001','401019','P40101',null,null,null,null,null,null),
('22401001','421012','P42103',null,null,null,null,null,null),
('20101001','101003','P10102',null,null,null,null,null,null),
('22421003','311003','P31104',null,null,null,null,null,null),
('22421003','421012','P42103',null,null,null,null,null,null),
('20111013','111012','P11104',null,null,null,null,null,null);


#문제1. 모든 학생의 학생번호, 이름, 휴대폰, 학과번호, 학과명을 조회하시오.
select a.stdNO, a.stdName, a.stdHp, b.depNo, b.depName from student a
  left join departments b
    on a.depNo = b.depNo ;

#문제2. 모든 교수의 교수번호, 이름, 휴대폰, 학과번호, 학과명을 조회하시오. 
select a.proNO, a.proName, a.proHp, b.depNo, b.depName 
  from professors a
  left join departments b
    on a.depNo = b.depNo ;   
   
#문제3. 모든 강좌의 강좌번호, 강좌명, 담당교수명, 휴대폰을 조회하시오.
select a.lecNo, a.lecName, b.proName, b.proHp 
  from lectures a
  left join professors b
    on a.proNo = b.proNo; 
   
#문제4. 모든 강좌의 강좌번호, 강좌명, 담당교수 번호, 담당교수명, 휴대폰, 학과번호, 학과명을 조회하시오.
select a.lecNo, a.lecName, b.proNo, b.proName, b.proHp 
  from lectures a
  left join professors b
    on a.proNo = b.proNo 
  left join `lectures` c
    on b.proNo = c.proNo;
      
   
#문제5. 모든 수강 내역에서 학생번호, 학생명, 강좌번호, 강좌명, 교수번호, 교수명을 조회하시오. 
select b.stdNO, b.stdName, c.lecNo , c.lecName, d.proNo, d.proName 
  from register a
  left join student b
    on a.stdNo = b.stdNO 
  left join lectures c
    on a.lecNo = c.lecNo 
  left join professors d
    on a.proNo = d.proNo ;
   
    
  
   
#문제6. 수강 테이블에 출석점수, 중간고사점수, 기말고사 점수를 임의로 입력하시오.(1~100 사이)
UPDATE register
SET 
regAttenScore = ceil(rand()*100 ), 
regmidscore = ceil(rand()*100 ), 
regfinalscore = ceil(rand()*100 ); 

select * from register

update register set regAttenScore = 10, regMidScore = 90 ,regFinalScore = 80 where stdno ='22421003'; 

UPDATE register
SET 
    regAttenScore = CASE stdNo
        WHEN '20101001' THEN 45
        WHEN '20101001' THEN 92
        WHEN '20101001' THEN 78
        WHEN '20111013' THEN 56
        WHEN '20111013' THEN 33
        WHEN '21231002' THEN 49
        WHEN '22401001' THEN 84
        WHEN '22401001' THEN 65
        WHEN '22421003' THEN 54
        WHEN '22421003' THEN 23
    END,
    regMidScore = CASE stdNo
        WHEN '20101001' THEN 83
        WHEN '20101001' THEN 12
        WHEN '20101001' THEN 37
        WHEN '20111013' THEN 67
        WHEN '20111013' THEN 72
        WHEN '21231002' THEN 25
        WHEN '22401001' THEN 91
        WHEN '22401001' THEN 77
        WHEN '22421003' THEN 47
        WHEN '22421003' THEN 68
    END,
    regFinalScore = CASE stdNo
        WHEN '20101001' THEN 29
        WHEN '20101001' THEN 54
        WHEN '20101001' THEN 89
        WHEN '20111013' THEN 45
        WHEN '20111013' THEN 64
        WHEN '21231002' THEN 88
        WHEN '22401001' THEN 23
        WHEN '22401001' THEN 15
        WHEN '22421003' THEN 95
        WHEN '22421003' THEN 49
    END
WHERE stdNo IN (
'20101001',
'20101001',
'20101001',
'20111013',
'20111013',
'21231002',
'22401001',
'22401001',
'22421003',
'22421003');


 
#문제7. 수강 테이블에 출석점수, 중간고사점수, 기말고사 점수를 모두 더한 평균을 구해 총점에 입력하시오
 select  
 	regAttenScore, 
    `regMidScore`,
    `regFinalScore`,
 	(regAttenScore +regmidscore + regfinalscore)/3 as '총합'
   from register;

  
 #문제8. 수강 테이블에 총점을 기준으로 A~F 등급을 입력하시오
  select  
    `regMidScore`,
    `regFinalScore`,
 	(regAttenScore +regmidscore + regfinalscore)/3 as '총합' , 
   case when (regAttenScore +regmidscore + regfinalscore)/3 >= 60 then 'A'
        when (regAttenScore +regmidscore + regfinalscore)/3 >= 55 then 'B'
        when (regAttenScore +regmidscore + regfinalscore)/3 >= 50 then 'C'
        when (regAttenScore +regmidscore + regfinalscore)/3 >= 45 then 'D'
        else 'F'
 	end as `등급`
   from register;
 
#문제9 총점이 가장 큰 점수를 조회하시오
    select  
 	(regAttenScore +regmidscore + regfinalscore) as `총합`
   from register
   order by `총합` desc 
   limit 1;

#문제 10 수강테이블에서 정우성 학생의 총점의 평균을 구하시오
select b.stdName, c.lecNo , c.lecName, a.regAttenScore , a.regMidScore , a.regFinalScore , (regAttenScore +regmidscore + regfinalscore)/3 as `평균`  
  from register a
  left join student b
    on a.stdNo = b.stdNO 
  left join lectures c
    on a.lecNo = c.lecNo 
 where b.stdName = '정우성' ;
