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

