--비밀번호 변경
alter user hr IDENTIFIED by hr;
--hr이라는 유저의 비밀번호를 hr로 바꿀것이다. 

--새로운 사용자 생성
--common_user_prefix parameter.
create user c##scott IDENTIFIED BY tiger
default tablespace users
TEMPORARY TABLESPACE temp;

--새로운 사용자에게 권한 부여
grant connect, RESOURCE, dba to c##scott;