insert into departments (dep_no,dep_name,dep_manager,dep_tel) values
('101','소아과','김유신',	'051-123-0101'),
('102','내과','김춘추',	'051-123-0102'),
('103','외과','장보고',	'051-123-0103'),
('104','피부과','선덕여왕',	'051-123-0104'),
('105','이비인후과','강감찬','051-123-0105'),
('106','산부인과','신사임당','051-123-0106'),
('107','흉부외과','류성룡',	'051-123-0107'),
('108','정형외과','송상현',	'051-123-0108'),
('109','신경외과','이순신',	'051-123-0109'),
('110','비뇨기과','정약용',	'051-123-0110'),
('111','안과','박지원',	'051-123-0111'),
('112','치과','전봉준',	'051-123-0112');

insert ignore into doctors (doc_id, doc_name, doc_birth, doc_gen, dep_no, doc_pos, doc_phone, doc_email) values
('D101101','김유신',	'1976-01-21','M','101','과장',	'010-1101-1976','kimys@bw.com'),
('D101102','계백',	'1975-06-11','M','101','전문의',	'010-1102-1975','gaeback@bw.com'),
('D101103','김관장',	'1989-05-30','M','101','전문의',	'010-1103-1989','kwanch@bw.com'),
('D102101','김춘추',	'1979-04-13','M','102','과장',	'010-2101-1979','kimcc@bw.com'),
('D102104','이사부',	'1966-09-12','M','102','전문의',	'010-2104-1966','leesabu@bw.com'),
('D103101','장보고',	'1979-07-28','M','103','과장',	'010-3101-1979','jangbg@bw.com'),
('D104101','선덕여왕',	'1984-06-15','F','104','과장',	'010-4101-1984','gueen@bw.com'),
('D105101','강감찬',	'1965-10-21','M','105','과장',	'010-5101-1965','kang@bw.com'),
('D106101','신사임당',	'1972-11-28','F','106','과장',	'010-6101-1972','sinsa@bw.com'),
('D107103','이이',	'1992-09-07','M','107','전문의',	'010-7103-1992','leelee@bw.com'),
('D107104','이황',	'1989-12-09','M','107','전문의',	'010-7104-1989','hwang@bw.com'),
('D108101','송상현',	'1977-03-14','M','108','과장',	'010-8101-1977','ssh@bw.com');


insert into `Nurses` (nur_id, dep_no, nur_name, nur_birth, nur_gender, nur_pos, nur_phone, nur_email) values
('N101101', 101, '송승헌', '1976-02-21', 'M', '수간호사', '010-1101-7602', 'ssh@bw.com'),
('N102101', 102, '이영애', '1975-07-11', 'F', '수간호사', '010-1102-7507', 'yung@bw.com'),
('N102102', 102, '엄정화', '1989-06-30', 'F', '주임', '010-1103-8906', 'um@bw.com'),
('N102103', 102, '박명수', '1979-05-13', 'M', '주임', '010-2101-7905', 'park@bw.com'),
('N103101', 103, '정준하', '1966-10-12', 'M', '주임', '010-2104-6610', 'jung@bw.com'),
('N104101', 104, '김태희', '1979-08-28', 'F', '주임', '010-3101-7908', 'taeh@bw.com'),
('N105101', 105, '송혜교', '1984-07-15', 'F', '주임', '010-4101-8407', 'song@bw.com'),
('N106101', 106, '공유', '1965-11-21', 'M', '간호사', '010-5101-6511', 'gong@bw.com'),
('N107101', 107, '이병헌', '1972-12-28', 'M', '간호사', '010-6101-7212', 'byung@bw.com'),
('N108101', 108, '송중기', '1992-10-07', 'M', '간호사', '010-7103-9210', 'jungi@bw.com');


insert into `Patients` (pat_id, doc_id, nur_id, pat_name, pat_jumin, pat_gen, pat_addr, pat_phone, pat_email, pat_job) values 
('P102101', 'D102101', 'N102101', '정우성', '760121-1234567', 'M', '서울', '010-1101-7601', '-', '배우'),
('P103101', 'D103101', 'N103101', '이정재', '750611-1234567', 'M', '서울', '010-1102-7506', '-', '배우'),
('P102102', 'D102104', 'N102103', '전지현', '890530-1234567', 'F', '대전', '010-1103-8905', 'jjh@naver.com', '자영업'),
('P104101', 'D104101', 'N104101', '이나영', '790413-1234567', 'F', '대전', '010-2101-7904', 'lee@naver.com', '회사원'),
('P105101', 'D105101', 'N105101', '원빈', '660912-1234567', 'M', '대전', '010-2104-6609', 'one@daum.net', '배우'),
('P103102', 'D103101', 'N103101', '장동건', '790728-1234567', 'M', '대구', '010-3101-7907', 'jang@naver.com', '배우'),
('P104102', 'D104101', 'N104101', '고소영', '840615-1234567', 'F', '대구', '010-4101-8406', 'goso@daum.net', '회사원'),
('P108101', 'D108101', 'N108101', '김연아', '651021-1234567', 'F', '대구', '010-5101-6510', 'yuna@daum.net', '운동선수'),
('P102103', 'D102104', 'N102102', '유재석', '721128-1234567', 'M', '부산', '010-6101-7211', '-', '개그맨'),
('P107101', 'D107104', 'N107101', '강호동', '920907-1234567', 'M', '부산', '010-7103-9209', '-', '개그맨'),
('P105102', 'D105101', 'N105101', '조인성', '891209-1234567', 'M', '광주', '010-7104-8912', 'join@gmail.com', '배우'),
('P104103', 'D104101', 'N104101', '강동원', '770314-1234567', 'M', '광주', '010-8101-7703', 'dong@naver.com', '배우');


insert into `Treatments` (treat_no, doc_id, pat_id, treat_contents, treat_datetime) values 
(1021001, 'D102101','P102101','감기, 몸살', '2022-01-10 10:50:12'),
(1031002, 'D103101','P103101','교통사고 외상', '2022-01-10 10:50:12'),
(1021003, 'D102104','P102102','위염, 장염', '2022-01-10 10:50:12'),
(1041004, 'D104101','P104101','피부 트러블', '2022-01-10 10:50:12'),
(1051005, 'D105101','P105101','코막힘 및 비염', '2022-01-10 10:50:12'),
(1031006, 'D103101','P103102','목 디스크', '2022-01-10 10:50:12'),
(1041007, 'D104101','P104102','여드름', '2022-01-10 10:50:12'),
(1081008, 'D108101','P108101','오른쪽 발목 뼈 골절', '2022-01-10 10:50:12'),
(1021009, 'D102104','P102103','소화불량', '2022-01-10 10:50:12'),
(1071010, 'D107104','P107101','가슴통증', '2022-01-10 10:50:12'),
(1051011, 'D105101','P105102','귀 이명', '2022-01-10 10:50:12'),
(1041012, 'D104101','P104103','팔목 화상', '2022-01-10 10:50:12');


insert into `Charts` values ('C1021001',1021001,'D102101','P102101','감기 주사 및 약 처방');
insert into `Charts` values ('C1031002',1031002,'D103101','P103101','입원 치료');
insert into `Charts` values ('C1021003',1021003,'D102104','P102102','위내시경');
insert into `Charts` values ('C1041004',1041004,'D104101','P104101','피부 감염 방지 주사');
insert into `Charts` values ('C1051005',1051005,'D105101','P105101','비염 치료');
insert into `Charts` values ('C1031006',1031006,'D103101','P103102','목 견인치료');
insert into `Charts` values ('C1041007',1041007,'D104101','P104102','여드름 치료약 처방');
insert into `Charts` values ('C1081008',1081008,'D108101','P108101','발목 깁스');
insert into `Charts` values ('C1021009',1021009,'D102104','P102103','주사 처방');
insert into `Charts` values ('C1071010',1071010,'D107104','P107101','MRI 검사');
insert into `Charts` values ('C1051011',1051011,'D105101','P105102','귀 청소 및 약 처방');
insert into `Charts` values ('C1041012',1041012,'D104101','P104103','화상 크림약 처방');


# 문제1. 모든 의사의 의사ID, 이름, 생년월일, 전공의과 번호, 전공의과 이름을 조회하시오. 
select a.doc_id, a.doc_name, a.doc_birth, b.dep_name 
  from doctors a
  join departments b
    on a.dep_no = b.dep_no ;
    
# 문제2. 모든 간호사의 간호사ID, 이름, 생년월일, 전공의과 번호, 전공의과 이름을 조회하시오. 
select a.nur_id, a.nur_name, a.nur_birth, b.dep_no ,b.dep_name 
  from nurses a
  join departments b
    on a.dep_no = b.dep_no;

# 문제3. 모든 환자의 환자ID, 이름, 주민번호, 휴대폰, 담당의사 이름, 담당 간호사 이름을 조회하시오.
select a.pat_id, a.pat_name, a.pat_jumin, a.pat_phone, b.doc_name ,c.nur_name 
  from patients a
  join doctors b
    on a.doc_id = b.doc_id 
  join nurses c
    on a.nur_id = c.nur_id;
    
# 문제4. 모든 진료내역에서 환자 이름, 담당의사 이름, 진료내용, 처방내용, 진료날짜를 조회하시오.
select b.pat_name , c.doc_name ,a.treat_contents, d.chart_contents ,a.treat_datetime 
  from treatments a
  left join patients b
    on a.pat_id = b.pat_id 
  left join doctors c
    on a.doc_id  =  c.doc_id 
  left join charts d
    on a.treat_no = d.treat_no ;
  
#문제5. 모든 진료내역에서 '외과'에서 진료한 내역 가운데 진료번호, 환자이름, 담당의사명, 진료내용,처방내용, 진료날짜를 조회하시오. 
select b.pat_name , c.doc_name ,a.treat_contents, d.chart_contents ,a.treat_datetime 
  from treatments a
  left join patients b
    on a.pat_id = b.pat_id 
  left join doctors c
    on a.doc_id  =  c.doc_id 
  left join charts d
    on a.treat_no = d.treat_no 
  join departments e
    on c.dep_no = e.dep_no 
 where e.dep_name = '외과' ;
   

#문제6. 모든 진료내역에서 '화상'으로 진료한 내역 가운데 진료번호, 환자이름, 담당의사명, 진료내용,처방내용, 진료날짜를 조회하시오.
select b.pat_name , c.doc_name ,a.treat_contents, d.chart_contents ,a.treat_datetime 
  from treatments a
  left join patients b
    on a.pat_id = b.pat_id 
  left join doctors c
    on a.doc_id  =  c.doc_id 
  left join charts d
    on a.treat_no = d.treat_no 
  join departments e
    on c.dep_no = e.dep_no 
 where a.treat_contents like '%화상%' ;


#문제7. 현재 날짜를 기준으로 30세 이상 ~ 40세 미만 환자를 조회하시오. 
select *, left(now(),4)-concat("1900"+left(pat_jumin,2)) as `age`
  from patients
  where left(now(),4)-concat("1900"+left(pat_jumin,2)) between '30' and '40';
  
  
#문제8. 모든 전공부서에서 아직 의사ID가 부여되지 않은 의사의 이름과 부서명을 조회하시오. 
 select a.dep_manager ,a.dep_name
   from departments a
   left join doctors b
     on a.dep_no = b.dep_no 
  where b.doc_id is null;
 
 
#문제9. 김태희 간호사가 맡고 있는 모든 환자의 이름을 구분자 ^으로 해서 '강동원^고소영^이나영'과 같이조회하시오. 
select group_concat( b.pat_name separator '^')  as '환자이름'
  from treatments a
  left join patients b
    on a.pat_id = b.pat_id 
  left join doctors c
    on a.doc_id  =  c.doc_id 
  left join charts d
    on a.treat_no = d.treat_no 
  join departments e
    on c.dep_no = e.dep_no 
  join nurses f
    on b.nur_id = f.nur_id 
 where f.nur_name = '김태희';


#문제10. 가장 많은 환자 수를 담당하는 간호사ID, 간호사 이름, 담당환자수를 조회 하시오.
select a.nur_id, a.nur_name, count(a.nur_id) as `담당환자수` from nurses a
  join patients b
    on a.nur_id = b.nur_id 
 group by b.nur_id 
 order by `담당환자수` desc
 limit 1;

  
  
 
