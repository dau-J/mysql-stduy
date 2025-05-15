create database naver_db;
use naver_db;
create table member(select * from market_db.member);
create or replace view v_member
as
select mem_id, mem_name, addr from member;
check table v_member;
drop table member;

show create table member;


select * from tables where table_schema='market_db';

show tables from naver_db;

show full tables;