-- 3장 연습문제
select * from member;
select mem_name,debut_date from member order by debut_date limit 5;
select mem_name,height from member where height between 163 and 165;
select mem_name,addr from member where addr in ('경기','경남','전남');
select avg(height) from member;
select mem_name,height from member where height = 164;
select mem_name,height from member where height > (select avg(height) from member);
select * from member order by height desc;
select distinct addr from member;
select mem_id 회원아이디 ,sum(amount) 총구매개수 from buy group by mem_id;
select mem_id 회원아이디 , sum(amount) 구매개수 , sum(price*amount) 구매금액 from buy group by mem_id order by sum(amount) desc;
select addr 주소 , count(*) 거주인원 from member group by addr having 거주인원 > 0 limit 0,5;
select mem_id 회원아이디, sum(price*amount) 구매금액 from buy group by mem_id having 구매금액 between 100 and 1500;