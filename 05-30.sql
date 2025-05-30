# 현재 테이블에 클러스터 인덱스 1순위 PK,2순위 낫널유니크alter
show index from member;
analyze table member;
show table status like 'member';
# pk제거하려면 FK 제약이 또 걸리므로, 이번에는 어제와 달리 그냥 table drop
drop table buy;
# 이제 pk 제거
alter table member drop primary key;
# 1순위 없어졌기때문에 2순위 보조인덱스로 있던 mem_name 인덱스가 클러스터 인덱스로 승격
select * from member;

drop index mem_name on member;


