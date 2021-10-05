-- 권한이 불충분합니다 --insufficient privileges
-- system에서 권한 부여 후에 성공
create table table_default(
    login_id varchar2(20) constraint tbldf_lgnid_pk primary key,
    login_pwd varchar2(20) default '1234',
    tel varchar2(20));
    
insert into table_default(login_id,login_pwd)
values ('TEST_ID','TEST_ID');
-- 테이블스페이스 'USERS'에 대한 권한이 없습니다.
    
    
