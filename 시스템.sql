create user test identified by t123
default tablespace testimsi
quota 0m on system
quota 0m on sysaux
quota 1024m on testImsi;
grant resource, connect to test;

connect test t123;

select * from dba_tablespaces ;

-----------------------

purge recyclebin;           -- drop �� �����Ⱚ ����
select user from dual;      -- ���� Ȯ��
SELECT * FROM tab;          -- ��� ���̺� Ȯ��
rollback;
COMMIT;