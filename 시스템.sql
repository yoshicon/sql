create user test identified by t123
default tablespace testimsi
quota 0m on system
quota 0m on sysaux
quota 1024m on testImsi;
grant resource, connect to test;

connect test t123;

select * from dba_tablespaces ;

-----------------------

purge recyclebin;           -- drop 후 쓰레기값 제거
select user from dual;      -- 유저 확인
SELECT * FROM tab;          -- 모든 테이블 확인
rollback;
COMMIT;