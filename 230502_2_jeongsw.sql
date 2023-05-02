--④날짜함수---------------------
select sysdate from dual;
select months_between(sysdate, '2025/12/20') from dual;
select months_between('2025/12/20', sysdate) from dual;
select months_between(sysdate, '2018/12/20') from dual;

select next_day(sysdate, '화') as "NEXT_DAY" from dual;
select next_day(sysdate, '일') as "NEXT_DAY" from dual;
select next_day(sysdate, 1) as "NEXT_DAY" from dual;-- 일요일:1, 월:2....
select next_day(sysdate, 6) as "NEXT_DAY" from dual;-- 일요일:1, 월:2....

select add_months(date '2023-05-01', 1) from dual;
select add_months(date '2023-05-01', 10) from dual;

select last_day(date '2023-03-01') from dual; 
-- '년/월/일' 또는 '년-월-일'

SELECT TO_CHAR(NEXT_DAY(SYSDATE,'일'), 'yyyymmdd hh24:mi:ss') AS "NEXT_DAY" FROM DUAL;
SELECT TO_CHAR(NEXT_DAY(SYSDATE,'월'), 'yyyymmdd hh24:mi:ss') FROM DUAL;
SELECT TO_CHAR(NEXT_DAY(SYSDATE,'화'), 'yyyymmdd hh24:mi:ss') FROM DUAL;
SELECT TO_CHAR(NEXT_DAY(SYSDATE,'수'), 'yyyymmdd hh24:mi:ss') FROM DUAL;
SELECT TO_CHAR(NEXT_DAY(SYSDATE,'목'), 'yyyymmdd hh24:mi:ss') FROM DUAL;
SELECT TO_CHAR(NEXT_DAY(SYSDATE,'금'), 'yyyymmdd hh24:mi:ss') FROM DUAL;
SELECT TO_CHAR(NEXT_DAY(SYSDATE,'토'), 'yyyymmdd hh24:mi:ss') FROM DUAL;

select hiredate, next_day(hiredate, 1) from professor;
select hiredate, to_char(hiredate, 'YYYY-MM-DD') from professor;
select hiredate, to_char(hiredate, 'YYYY-MM-DD HH:MI:SS') from professor;
select hiredate, to_char(hiredate, 'YYYY-MM-DD HH24:MI:SS') from professor;

select to_char(2000, '999,999') from dual;-- => 2,000
select to_char(200049585590000, '999,999') from dual;
select to_char(2000, 'L999,999') from dual;-- => \2,000 => 지역에따른화페표시
select to_char(2000, '$999,999') from dual; --=> $2,000

select to_date('20000501','yyyymmdd') from dual;
select to_date('abcd','yyyymmdd') from dual; -- error, 숫자 문자여야됨
select to_date('20050102123456','yyyymmdd hh24miss') from dual; -- error, 숫자 문자여야됨

SELECT VALUE FROM NLS_SESSION_PARAMETERS WHERE PARAMETER = 'NLS_DATE_FORMAT';  -- 지정한 형식만 확인
select * from NLS_SESSION_PARAMETERS;  -- 현재 시스템에서의 셋팅 상태 확인

-- ALTER SESSION SET NLS_DATE_FORMAT = [변경할 포맷]
ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD HH24:MI:SS';  -- 날짜 형식 변경
--메뉴 : 도구 > 환경설정 > 데이터베이스 > NLS > 날짜형식

select *
    from NLS_SESSION_PARAMETERS
    where parameter = 'NLS_DATE_FORMAT';
    
select '1234' + 100, to_number('1234'), to_number('1234') + 100 from dual;

select * from emp2;
desc emp2;
select name, pay, to_char(pay, '999,999,999,999') from emp2;
select name, pay, to_char(pay, '999,999,999,999') from emp2;


select * from emp;
select * from dept;