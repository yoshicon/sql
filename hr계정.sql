select distinct department_id from employees;

select * from all_tables;

select * from employees;

-- 사원번호, 아름(성, + 이름), 급여액, 보너스(급여의 50%), 지급액(급여+보너스)
select first_name ||' '|| last_name as name,
    salary, salary*0.5 as bonus, salary*1.5 as wor
    from employees;
    
between 앵간하면 쓰지 안기 권장 속도가 조금 느리대
111p

USER_TABLES;

select * from employees;

desc employees;

select department_id, job_id, sum(salary) as 합, max(salary) as 최대, min(salary) as 최소,
round(avg(salary), 3) as 평균, round(stddev(salary), 3) as 편차
from employees group by department_id, job_id having 
order by department_id desc, job_id;

select * from department_id, avg(NVL(salary,0)) from employees
where department_id > 70
group by department_id
having avg(nlv(salary, 0)) > 2000
;

select * from employees
where department_id not in (90);

create table empcp2 as
select * from empcp
where 1>2;

select * from empcp2;

drop table empcp2, empcp2;

create or replace synonym premp for hr.employees;
grant select on employees to test;
select * from premp;
drop synonym premp;

set SERVEROUTPUT ON;
DECLARE
    vno number(4);
    vname VARCHAR2(10);
BEGIN
    select employee_id, first_name into vno, vname
    from employees
    where employee_id = &id;
    
    DBMS_OUTPUT.PUT_LINE(vno||' '||vname);  -- print
END;
/

create table pl_test(
    nm number,
    nam varchar2(20)
);

create SEQUENCE pl_seq;

begin
    insert into pl_test
        values( PL_SEQ.nextval, 'babo');
end;
/

select * from pl_test;

DECLARE
    el employees.email%type;
    fn employees.first_name%type;
    ln employees.last_name%type;
    wl employees.salary%type;
BEGIN
    select email, first_name, last_name, salary
    into el, fn, ln, wl
    from employees
    where employee_id = 100;
    
    DBMS_OUTPUT.PUT_LINE(el ||' '|| fn ||' '|| ln ||' '|| wl);
END;
/

DECLARE
    rowval employees%rowtype;
BEGIN
    select * into rowval
    from employees
    where employee_id = 200;
    
    DBMS_OUTPUT.PUT_LINE(rowval.employee_id ||' '|| rowval.email ||' '|| rowval.job_id ||' '|| rowval.salary);
END;
/

create type tpa as varray(26) of varchar(2);

DECLARE
    test_alp tpa;
BEGIN
    test_alp := tpa('a', 'w', 'e', 'r', 't', 's', 'd', 'f', 'g', 'r');

    DBMS_OUTPUT.PUT_LINE(test_alp(3));
END;
/
/*
커서 선언
curser 이름 is select 문장;
커서 열기
open 커서명;
사용
fetch 커서명 into 변수..;
닫기
close 커서명
*/

select first_name from EMPLOYEES where department_id = 100;

DECLARE
    cursor empcur is select first_name from EMPLOYEES where department_id = 100;
    fir_name employees.first_name%type;
BEGIN
    open empcur;
    loop
        fetch empcur into fir_name;
        exit when empcur%notfound;
        DBMS_OUTPUT.PUT_LINE(test_alp(3));
    end loop
    close empcur;
END;

DECLARE
    counter integer;
begin
    counter := 10;
    counter := counter / 0;
    DBMS_OUTPUT.PUT_LINE(counter);
    exception when others then DBMS_OUTPUT.PUT_LINE('예외발생됨');
end;

/* 급여(salary) 범위를 입력하면 그 범위에 맞는 사원(first_name) 명단 출력
 bqboya||(@@, @@);
create PROCEDURE
is
begin
    if (n1 > n2)
        tepm := n1;
        n1 := n2;
        n2 := tepm;
    end if;
    
    select * from EMPLOYEES
    where salary between n1 and n2;
END;
*/
CREATE or replace PROCEDURE baboya (n1 integer, n2 integer)
IS
BEGIN
    into select * from EMPLOYEES
    where salary between n1 and n2;
END;

CREATE or replace PROCEDURE ts
IS
BEGIN
    into select * from EMPLOYEES;
END;

exec baboya(10000, 20000);


    
-----------------------

purge recyclebin;           -- drop 후 쓰레기값 제거
select user from dual;      -- 유저 확인
SELECT * FROM tab;          -- 모든 테이블 확인
rollback;
COMMIT;