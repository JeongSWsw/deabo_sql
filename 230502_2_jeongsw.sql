--�곯¥�Լ�---------------------
select sysdate from dual;
select months_between(sysdate, '2025/12/20') from dual;
select months_between('2025/12/20', sysdate) from dual;
select months_between(sysdate, '2018/12/20') from dual;

select next_day(sysdate, 'ȭ') as "NEXT_DAY" from dual;
select next_day(sysdate, '��') as "NEXT_DAY" from dual;
select next_day(sysdate, 1) as "NEXT_DAY" from dual;-- �Ͽ���:1, ��:2....
select next_day(sysdate, 6) as "NEXT_DAY" from dual;-- �Ͽ���:1, ��:2....

select add_months(date '2023-05-01', 1) from dual;
select add_months(date '2023-05-01', 10) from dual;

select last_day(date '2023-03-01') from dual; 
-- '��/��/��' �Ǵ� '��-��-��'

SELECT TO_CHAR(NEXT_DAY(SYSDATE,'��'), 'yyyymmdd hh24:mi:ss') AS "NEXT_DAY" FROM DUAL;
SELECT TO_CHAR(NEXT_DAY(SYSDATE,'��'), 'yyyymmdd hh24:mi:ss') FROM DUAL;
SELECT TO_CHAR(NEXT_DAY(SYSDATE,'ȭ'), 'yyyymmdd hh24:mi:ss') FROM DUAL;
SELECT TO_CHAR(NEXT_DAY(SYSDATE,'��'), 'yyyymmdd hh24:mi:ss') FROM DUAL;
SELECT TO_CHAR(NEXT_DAY(SYSDATE,'��'), 'yyyymmdd hh24:mi:ss') FROM DUAL;
SELECT TO_CHAR(NEXT_DAY(SYSDATE,'��'), 'yyyymmdd hh24:mi:ss') FROM DUAL;
SELECT TO_CHAR(NEXT_DAY(SYSDATE,'��'), 'yyyymmdd hh24:mi:ss') FROM DUAL;

select hiredate, next_day(hiredate, 1) from professor;
select hiredate, to_char(hiredate, 'YYYY-MM-DD') from professor;
select hiredate, to_char(hiredate, 'YYYY-MM-DD HH:MI:SS') from professor;
select hiredate, to_char(hiredate, 'YYYY-MM-DD HH24:MI:SS') from professor;

