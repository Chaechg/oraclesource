create table temp1(
    col1 varchar2(10),
    col2 varchar2(10));
  
-- 테이블스페이스 'USERS'에 대한 권한이 없습니다.
insert into temp1 values('user1','1234');
    