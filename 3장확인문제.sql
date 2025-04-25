-- 3장확인문제
#1
use world;
#2
select count(*) from country;
#3
select * from country where name like '%ko%';
select * from city where countrycode = (select code from country where name = 'Italy');
select name from country where code in (select countrycode from countrylanguage where language = 'korean');
select language from countrylanguage where countrycode = 'usa';
select language 언어 , count(*) 사용국가수 from countrylanguage group by language order by 사용국가수 desc limit 5;
-- city테이블에서 이탈리아의 도시들을출력하고자하는데국가코드를
-- 모릅니다. (국가코드는 country 테이블에서는 code컬럼, city 테이블
--  에서는countrycode컬럼)
select * from city where countrycode = 'ITA';
-- 다만, 이탈리아가 country 테이블에 국가명 'Italy'로 들어있다는 건
-- 알고있습니다. (country 테이블의 name컬럼
select * from country where name = 'italy';

-- SQL문 1개만 사용해서city 테이블에서 이탈리아의도시들을출력해
-- 보세요. (SQL문 안에 'ITA' 가 포함되지 않음)
select * from city where countrycode = (select code from country where name ='Italy');

select code from country where name = 'Italy';

select * from city where countrycode = (select code from country where name = 'Italy');
select name from country where code in (select countrycode from countrylanguage where language = 'korean');
# countrylanguage 테이블에서
# (1) 한국어(Korean)를 사용하는 나라를 출력하세요. (국가명은country 테이블에 있음. 우측 결과는order by 안 한 경우)
SELECT * FROM country WHERE code in (SELECT countrycode FROM countrylanguage  WHERE language = 'Korean');
# (2) 미국(countrycode는 USA)에서 사용하는언어들을출력하세요. (우측결과는order by 안 한 경우)
select language from countrylanguage where countrycode = 'USA';
# (3) 가장 많은나라에서사용되는상위5개언어를출력하세요. (우측결과는group by 및 order by를 사용한 경우이며, 별칭도사용했음)
SELECT language as 언어, COUNT(*) AS 사용국가수 
FROM countrylanguage
Group BY language ORDER BY 사용국가수 DESC LIMIT 5;