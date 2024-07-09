# 실습 5-1 인덱스 조회
show index from user1;
show index from user2;
show index from user3;
# 실습 5-2 인덱스 생성 및 적용
# 인덱스 생성
create index `idx_user1_uid` on `user1`(`uid`);

# 인덱스 삭제
analyze table `user1`;
select * from user5;

insert into user5 (`name`,`gender`,`age`,`addr`) select `name`,`gender`,`age`,`addr` from user5;
update user5 set name = '홍길동' where seq = 3;
update user5 set name = '정약용' where seq = 2000000;

select count(*) from user5

select * from user5;

select * 
  from user5
 where `name` = '홍길동';

select * 
  from user5
 where `name` = '정약용';

select * 
  from user5
 where `seq` = 10000;

select * from user5

delete from user5
where seq = 5


# 실습 5-3 인덱스 삭제
drop index `idx_user1_uid` on `user1`







# 실습5-4 뷰 생성

select * from vw_user1

CREATE VIEW `vw_user1` AS (SELECT name, hp, age FROM User1);

CREATE VIEW `vw_user4_age_under30` AS (SELECT * FROM `User4` WHERE age < 30);

CREATE VIEW `vw_member_with_sales` AS (
SELECT
	   a.`uid` 	AS `직원아이디`,
	   b.`name` AS `직원이름`,
	   b.`pos` 	AS `직급`,
	   c.`name` AS `부서명`,
	   a.`year` AS `매출년도`,
	   a.`month`AS `월`,
	   a.`sale` AS `매출액`
  FROM `Sales` AS a
  JOIN `Member` AS b ON a.uid = b.uid
  JOIN `Department` AS c ON b.dep = c.depNo);


# 실습 5-5 뷰 조회
select * from vw_user1;
select * from vw_user4_age_under30;
select * from vw_member_with_sales;


# 실습 5-6 뷰 삭제
drop view vw_user1
drop view vw_user4_age_under30






# 실습 5-7 프로시저 생성 및 실행 기본
delmiter $$
	create procedure proc_test1()
	begin
		select * from `member` ;
		select * from `department` ;
	end $$
delmiter;



# 실습5-8. 매개변수를 갖는 프로시저 생성 및 실행
DELIMITER $$
CREATE PROCEDURE proc_test2(IN _userName VARCHAR(10))
BEGIN
SELECT * FROM `Member` WHERE `name`=_userName;
END $$
DELIMITER ;

call proc_test2('김유신');

DELIMITER $$
CREATE PROCEDURE proc_test3(IN _pos VARCHAR(10), IN _dep TINYINT)
BEGIN
SELECT * FROM `Member` WHERE `pos`=_pos AND `dep`=_dep;
END $$
DELIMITER ;

CALL proc_test3(‘차장’,101);


DELIMITER $$
CREATE PROCEDURE proc_test4(IN _pos VARCHAR(10), OUT _count INT)
BEGIN
SELECT COUNT(*) INTO _count FROM `Member` WHERE `pos`=_pos ;
END $$
DELIMITER ;

CALL proc_test4('과장', @_count);
SELECT CONCAT('_count : ', @_count)

show procedure status;

select * from `member`;
	


#실습5-9.프로시저 프로그래밍

DELIMITER $$
CREATE PROCEDURE proc_test5(IN _name VARCHAR(10))
 BEGIN
	DECLARE userId VARCHAR(10);
	select `uid` into userId from `Member` where `name` = _name;
	select * from `Sales` where `uid`=userId;
END $$
DELIMITER ;

CALL proc_test5('김유신');

DELIMITER $$
CREATE PROCEDURE proc_test6()
 BEGIN
		DECLARE num1 INT;
		DECLARE num2 INT;
		SET num1 = 1;
		SET num2 = 2;
		IF (NUM1 > NUM2) THEN
			SELECT 'NUM1이 NUM2보다 크다.' as `결과2`;
		ELSE
			SELECT 'NUM1이 NUM2보다 작다.' as `결과2`;
	END IF;
  END $$
DELIMITER ;

CALL proc_test6();


DELIMITER $$
CREATE PROCEDURE proc_test7()
 BEGIN
	DECLARE sum INT;
	DECLARE num INT;
	SET sum = 0;
	SET num = 1;
		WHILE (num <= 10) DO
			SET sum = sum + num;
			SET num = num + 1;
		END WHILE;
	SELECT sum AS '1부터 10까지 합계';
	END $$
DELIMITER ;


CALL proc_test7();


# 실습 5-10 커서를 활용한 프로시저
DELIMITER $$
CREATE PROCEDURE proc_test8()
 BEGIN
# 변수 선언
	DECLARE total INT DEFAULT 0;
	DECLARE price INT;
	DECLARE endOfRow BOOLEAN DEFAULT false;
# 커서 선언
	DECLARE salesCursor CURSOR FOR
		SELECT `sale` FROM `Sales`;
# 반복 조건
	DECLARE CONTINUE HANDLER
 		FOR NOT FOUND SET endOfRow = TRUE;
# 커서 열기
	OPEN salesCursor;
	cursor_loop: LOOP
		FETCH salesCursor INTO price;
		IF endOfRow THEN
			LEAVE cursor_loop;
		END IF;
		SET total = total + price;
	END LOOP;
	SELECT total AS '전체 합계';
	CLOSE salesCursor;
END $$
DELIMITER ;

CALL proc_test8();


# 실습 5-11 저장 함수 생성 및 호출
# 셋팅값 변경 필요 Function 함수 생성하기 위함(root 권한으로 접근이 필요하므로 Dbeaver로 root/ user 권한 변경하여 설정 필요함)
SET GLOBAL  log_bin_trust_function_creators=ON;


DELIMITER $$
	CREATE FUNCTION func_test1(_userid VARCHAR(10)) RETURNS INT
	BEGIN
		DECLARE total INT;
		SELECT SUM(`sale`) INTO total FROM `sales` WHERE `uid`=_userid;
		RETURN total;
	END $$
DELIMITER ;

SELECT func_test1('a101');

DELIMITER $$
	CREATE FUNCTION func_test2(_sale INT) RETURNS DOUBLE
	BEGIN
		DECLARE bonus DOUBLE;
	
		IF (_sale >= 100000) THEN
			SET bonus = _sale * 0.1;
		ELSE
			SET bonus = _sale * 0.05;
		END IF;
		RETURN bonus;
	END $$
DELIMITER ;


SELECT
`uid`,
`year`,
`month`,
`sale`,
func_test2(`sale`) as `bonus`
FROM Sale;
