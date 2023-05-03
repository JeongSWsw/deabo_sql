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

select to_char(2000, '999,999') from dual;-- => 2,000
select to_char(200049585590000, '999,999') from dual;
select to_char(2000, 'L999,999') from dual;-- => \2,000 => ����������ȭ��ǥ��
select to_char(2000, '$999,999') from dual; --=> $2,000

select to_date('20000501','yyyymmdd') from dual;
select to_date('abcd','yyyymmdd') from dual; -- error, ���� ���ڿ��ߵ�
select to_date('20050102123456','yyyymmdd hh24miss') from dual; -- error, ���� ���ڿ��ߵ�

SELECT VALUE FROM NLS_SESSION_PARAMETERS WHERE PARAMETER = 'NLS_DATE_FORMAT';  -- ������ ���ĸ� Ȯ��
select * from NLS_SESSION_PARAMETERS;  -- ���� �ý��ۿ����� ���� ���� Ȯ��

-- ALTER SESSION SET NLS_DATE_FORMAT = [������ ����]
ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD HH24:MI:SS';  -- ��¥ ���� ����
--�޴� : ���� > ȯ�漳�� > �����ͺ��̽� > NLS > ��¥����

select *
    from NLS_SESSION_PARAMETERS
    where parameter = 'NLS_DATE_FORMAT';
    
select '1234' + 100, to_number('1234'), to_number('1234') + 100 from dual;

select * from emp2;
desc emp2;
select name, pay, to_char(pay, '999,999,999,999') from emp2;
select name, pay, to_char(pay, '999,999,999,999') from emp2;


select * from emp; -- 14
select * from dept;-- 4

-- �μ���ȣ�� 10�̸� ACCOUNTING, 20�̸� RESEARCH, 30�̸� SALES
-- �������� OPERATIONS�� ����ϴ� ����
SELECT deptno, DECODE(deptno, 10 , 'ACCOUNTING' ,
                              20 , 'RESEARCH' ,
                              30 , 'SALES', 'OPERATIONS') name
  FROM dept;

-- 10�μ��� �޿��հ踦, 20�μ��� �ִ밪��, 30�μ��� �ּҰ��� ����ϴ� ����
SELECT deptno, DECODE(deptno, 10 , SUM(sal),
                              20 , MAX(sal),
                              30 , MIN(sal),
                              40, avg(sal)) sal
  FROM emp
 GROUP BY deptno;
 
select deptno, dname, decode(deptno,
                        10, '�Ǳ���',
                        20, '������',
                        30, '��ž��',
                        40, '���ﺻ��') name
                        from dept;
 
select * from department;
select * from professor;

SELECT deptno, 
               NVL(SUM(DECODE(deptno, 101, pay)),0) deptno101, 
               NVL(SUM(DECODE(deptno, 102, pay)),0) deptno102,
               NVL(SUM(DECODE(deptno, 103, pay)),0) deptno103,
               NVL(SUM(DECODE(deptno, 201, pay)),0) deptno201,
               NVL(SUM(DECODE(deptno, 202, pay)),0) deptno202,
               NVL(SUM(DECODE(deptno, 203, pay)),0) deptno203,
               NVL(SUM(DECODE(deptno, 301, pay)),0) deptno301
  FROM professor
  GROUP BY deptno
  order by deptno; 
  
SELECT deptno, 
       CASE deptno
         WHEN 10 THEN 'ACCOUNTING'
         WHEN 20 THEN 'RESEARCH'
         WHEN 30 THEN 'SALES'
         ELSE 'OPERATIONS'
       END as "Dept Name"
  FROM dept;
  
  SELECT ename ,
       CASE
          WHEN sal < 1000  THEN sal+(sal*0.8)
          WHEN sal BETWEEN 1000 AND 2000 THEN sal+(sal*0.5)
          WHEN sal BETWEEN 2001 AND 3000 THEN sal+(sal*0.3)
          ELSE sal+(sal*0.1)
       END sal
  FROM emp; 
  
  -- pdept�� ���� ������� ����ϼ��� (dcode, case �̿�)
  select * from dept2;
  SELECT pdept, 
       CASE pdept
         WHEN '0001' THEN area
         WHEN '1000' THEN area
         WHEN '1003' THEN area
         WHEN '1006' THEN area
         WHEN '1007' THEN area
         end
  FROM dept2;