DROP PROCEDURE IF EXISTS ifProc1;
 DELIMITER $$
 CREATE PROCEDURE ifProc1()
 BEGIN
 IF ((SELECT COUNT(*) FROM member) >= 10) THEN
 SELECT '회원수는 10 이상입니다.' as '답변';
 ELSE
 SELECT '회원수는 10 미만입니다.' as '답변';
 END IF;
 END $$
 DELIMITER  ;
 CALL ifProc1();
 
 drop procedure if exists ifProc1;
 delimiter $$
 create procedure ifproc1()
 begin
 if ((select count(*) from member) >=10)then
 select '회원수는 10 이상입니다.' as '답변';
 else
 select '회원수는 10 미만입니다.' as '답변';
 end if;
 end $$
 delimiter ;
 call ifProc1();
 
 
SELECT * FROM information_schema.views
WHERE table_schema = 'market_db';

show tables from world;

use market_db;
show full tables;


alter table buy drop foreign key buy_ibfk_1;

ALTER TABLE buy
ADD FOREIGN KEY (mem_id) REFERENCES member(mem_id)
ON UPDATE CASCADE;

update member set mem_id = 'PINK'
where mem_id = 'BLK';

select mem_id from member where mem_id = 'PINK';

select * from information_schema.tables
 where table_schema='naver_db';
 
show table status from naver_db;

 show index from member;
 
 SHOW INDEX FROM member FROM market_db;


DROP PROCEDURE IF EXISTS whileProc1;
 DELIMITER $$
 CREATE PROCEDURE whileProc1(IN startNum INT, IN endNum INT)
 BEGIN
 DECLARE i INT;
 DECLARE hap INT;
 SET i = startNum;
 SET hap = 0;
 WHILE (i<=endNum) DO
 SET hap = hap+i;
 SET i = i+1;
 END WHILE;
 SELECT concat(startNum,'부터 ',endNum,'까지의 합 ==> ') 범위, 
hap;
 END $$
 DELIMITER  ;
 call whileProc1(1, 100);
 
  DROP PROCEDURE IF EXISTS whileProc2;
 DELIMITER $$
 CREATE PROCEDURE whileProc2(IN startNum INT, IN endNum INT)
 BEGIN
 DECLARE i INT;
 DECLARE hap INT;
 SET i = startNum;
 SET hap = 0;
 mywhile: WHILE (i<=endNum) DO
 IF (i%4=0) THEN 
SET i = i + 1;  
ITERATE mywhile;   # continue 느낌
END IF;
 SET hap = hap + i;
 IF (hap>1000) THEN 
LEAVE mywhile;     
end if;
 SET i = i + 1;  
END WHILE;
 # break 느낌
SELECT CONCAT(startNum,'부터 ',endNum,'까지의 합 (4의 배수 제외), 1000 넘으면 종료 ==> ') 범위, hap;
 END $$
 DELIMITER  ;
 cAll whilEProc2(1, 100);
 
 DROP PROCEDURE IF EXISTS ifProc1;
 DELIMITER $$
 
 CREATE PROCEDURE ifProc1()
 BEGIN
 IF ((SELECT COUNT(*) FROM member) >= 10) THEN
 SELECT '회원수는 10 이상입니다.' as 답변;
 ELSE
 SELECT '회원수는 10 미만입니다.' as 답변;
 END IF;
 END $$
 DELIMITER  ;
 CALL ifProc1();
 
 
 USE world;
DROP PROCEDURE IF EXISTS myProc;
DELIMITER $$

CREATE PROCEDURE myProc(IN in_country VARCHAR(10), IN in_district VARCHAR(30))
BEGIN
    SELECT ID, Name, CountryCode, District, Population
    FROM city
    WHERE CountryCode = UPPER(in_country)
      AND District = in_district;
END $$

DELIMITER ;

call myProc('usa', 'california');