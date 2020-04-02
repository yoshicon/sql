insert into t_reg(text) values('ABC123');
insert into t_reg(text) values('ABC 123');
insert into t_reg(text) values('ABC  123');
insert into t_reg(text) values('abc123');
insert into t_reg(text) values('abc 123');
insert into t_reg(text) values('abc  123');
insert into t_reg(text) values('a1b2c3');
insert into t_reg(text) values('aabbccdd');
insert into t_reg(text) values('?!%#$&');
insert into t_reg(text) values('123123');
insert into t_reg(text) values('123abc');
insert into t_reg(text) values('abc');

delete FROM T_REG
where text is not null;

select * from t_reg
WHERE REGEXP_LIKE (text, '[a-z]');

select * from t_reg
WHERE REGEXP_LIKE (text, '^[a-z]');

select * from t_reg
WHERE REGEXP_LIKE (text, '[a-zA-Z°¡-ÆR]b');

select text, REGEXP_REPLACE (text, '[[:digit:]]', '*') as txtcng from t_reg;

select text, REGEXP_REPLACE (text, '[0-9]', '\1~*')as cngnb  from t_reg;

alter table t_reg modify text varchar2(300);
DESC t_reg;

-- ÀÔ·Â µ¥ÀÌÅÍ
insert into t_reg(text) values('don');
insert into t_reg(text) values('tokyo ni wa natto ga motte iru');
insert into t_reg(text) values('seoul ni wa kimchi ga motte iru');
insert into t_reg(text) values('dewa yoku kikinasai');
insert into t_reg(text) values('wakarimashita');
insert into t_reg(text) values('   a soda');
insert into t_reg(text) values('sonanda   ');


-- Á¶°Ç : °ø¹éÀ» *·Î + °¢ °ø¹é ÀÌÈÄ Ã¹±ÛÀÚ´Â ´ë¹®ÀÚ·Î
-- 1. ¾ç ³¡ °ø¹é Á¦°Å
select trim(text) from t_reg;
-- 2. Ã¹±ÛÀÚ ´ë¹®ÀÚ·Î
select initcap(text) from t_reg;
-- 3. °ø¹é -> *
select REGEXP_REPLACE (text, '\s', '*') as txtcng from t_reg;

-- 4. ¾îÄÉ Àß ÇÕÄ¡±â
select trim(text) from t_reg;
select initcap(text) from t_reg;
select REGEXP_REPLACE (text, '\s', '*') as txtcng from t_reg;

select REGEXP_REPLACE 
    (trim
        (initcap(TEXT), '\S', '*')
    ) from t_reg;
    
    
SELECT REGEXP_REPLACE(
    INITCAP(
        UPPER(
            REGEXP_REPLACE('$==**addA zDEFG\\**', '[a-zA-Z]', ' ')
        )
    )
, '\s+', '*') as rst
from t_reg;
    

select trim(text) as ¹Ùº¸ from t_reg;

CREATE TABLE DEPARTMENTS(	
    DEPARTMENT_ID NUMBER(4,0) PRIMARY KEY, 
	DEPARTNAME VARCHAR2(30 BYTE) NOT NULL, 
	MANAID NUMBER(6,0), 
	LOCID NUMBER(4,0)
);

ALTER TABLE DEPARTMENTS RENAME COLUMN DEPARTMENT_ID TO DEPARTMENTID;


desc DEPARTMENTS;
select * from departments;
insert into departments values(127, 'babo', 123, 120);

SELECT * FROM USER_USERS;
SELECT USER FROM DUAL;


CREATE TABLE employees 
   (	employeeId NUMBER(6,0), 
	irum 		VARCHAR2(25 BYTE) 	CONSTRAINT EMP_LAST_NAME_NN NOT NULL ENABLE, 
	email 		VARCHAR2(25 BYTE) 	CONSTRAINT EMP_EMAIL_NN NOT NULL ENABLE, 
	phoneName 	VARCHAR2(20 BYTE), 
	hireDate 	date 			CONSTRAINT EMP_HIRE_DATE_NN NOT NULL ENABLE, 
	jobId 		VARCHAR2(10 BYTE) 	CONSTRAINT EMP_JOB_NN NOT NULL ENABLE, 
	salary 		NUMBER(8,2), 
	commissionPct 	NUMBER(2,2), 
	managerId 	NUMBER(6,0), 
	departmentId 	NUMBER(4,0), 
		CONSTRAINT EMP_SALARY_MIN CHECK (salary > 0) , 
		CONSTRAINT EMP_EMAIL_UK UNIQUE (email),
  		CONSTRAINT EMP_EMP_ID_PK PRIMARY KEY (employeeId) 
   );
desc employees;

------------------------------------

Å×ÀÌºí »ý¼º
CREATE TABLE babo (
    cunt number (20),
    nick varchar2(60 BYTE),
    pass varchar2(60 BYTE),
    geul varchar2(3000 BYTE)
);

½ÃÄö½º »ý¼º
CREATE SEQUENCE namba INCREMENT BY 1 START WITH 1;

¸ðµç ½ÃÄö½º Á¶È¸
SELECT * FROM USER_SEQUENCES;

INSERT INTO tes VALUES( namba.NEXTVAL, 'È«±æµ¿');

±âÅ¸ ¸í·É
desc babo;
select * from babo;
drop table babo;


------------------------------------------------------
1. ±Û¹øÈ£¸¦ ÀÚµ¿À¸·Î Áõ°¡½ÃÅ°°í ½ÍÀº °Ô½ÃÆÇÀ» »ý¼ºÇÑ´Ù.
CREATE TABLE tes(
cnt NUMBER,
bab varchar(30)
);

2. CREATE SEQUENCE »ç¿ëÇÏ¿© SEQ_NUM¶ó´Â ÀÌ¸§ÀÇ ½ÃÄö½º¸¦ ¸¸µç´Ù.
CREATE SEQUENCE SEQ_ID INCREMENT BY 1 START WITH 1;
      >> INCREMENT BY 1 : Áõ°¡°ªÀº 1
      >> START WITH 1:  1ºÎÅÍ Áõ°¡

3.  Å×ÀÌºí¿¡ µ¥ÀÌÅÍ ÀÔ·Â½Ã¿¡´Â NEXTVALÀ» ÀÌ¿ëÇÏ¿© ½ÃÄý½º¸¦ »ç¿ëÇÑ´Ù.
INSERT INTO tes VALUES( SEQ_NUM.NEXTVAL, 'È«±æµ¿');

       >> CURRVAL : ÇöÀç °ªÀ» ¹ÝÈ¯ ÇÕ´Ï´Ù. . 
      >> NEXTVAL : ÇöÀç ½ÃÄö½º°ªÀÇ ´ÙÀ½ °ªÀ» ¹ÝÈ¯ ÇÕ´Ï´Ù. 
--------------------------------------------
drop table tes;
select * from tes;
desc tes;

SELECT * FROM USER_SEQUENCES;
DROP SEQUENCE SEQ_ID;

create table dept2(
    dcode number(4,0),
    dname varchar2(20),
    pdept number(4,0),
    area varchar2(20)
);

insert into dept2 values (dcode) values('9005');

alter table dept2 add ddate date;
insert into dept2 select * from dept2;
select * from dept2;

update dept2 set dcode = 127, ddate = sysdate, pdept = null where dcode =123;
update dept2 set ddate = sysdate;
-- select insert deletem update // marge

create table tbtot(
    udate varchar2(6),
    custno number(30),
    utitle number(30),
    carge number(30)
);

insert into tb1 values(410011, 100, 2, 1000);
insert into tb1 values(410012, 101, 2, 1000);
insert into tb1 values(410013, 102, 1, 500);
insert into tb2 values(410014, 100, 3, 1500);
insert into tb2 values(410015, 101, 4, 2000);
insert into tb2 values(410011, 102, 1, 1500);
insert into tb2 values(410011, 103, 2, 1000);

select * from tb2;

merge into tbtot
using tb1 sub
on (tbtot.udate = tb1.udate)
when matched then
update set tbtot.udate = tb1.udate, tbtot.custno = tb1.custno,
           tbtot.carge = tb1.carge, tbtot.utitle = tb1.utime
when not matched then
insert values(tb1.udate, tb1.custno, tb1.carge, tb1.utime );

create table dept2(
    dno number(4),
    dname varchar2(20),
    topdep number(4),
    deploc varchar2(30)
);

create UNIQUE INDEX dep2_no ON dept2(dno);
insert into dept2 values(1111, 'aaa', 22, null);

create table t_0401(
    tno1 number(6) primary key,
    tname varchar2(30)
);

set SERVEROUTPUT ON;

-----------------------

purge recyclebin;           -- drop ÈÄ ¾²·¹±â°ª Á¦°Å
select user from dual;      -- À¯Àú È®ÀÎ
SELECT * FROM tab;          -- ¸ðµç Å×ÀÌºí È®ÀÎ
rollback;
COMMIT;