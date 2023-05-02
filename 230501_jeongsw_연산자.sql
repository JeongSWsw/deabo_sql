--���ڵ� �˻�
/*select distinct | * | �÷��� as ��Ī, �÷��� ��Ī,....
from ���̺��̸�
[where ���ǽ� ]
[order by �÷��� desc | asc , .. ]
*/
-- ORACLE������ NULL �� �켱������ ����
ORDER BY NAME ASC;   --�������� ���� ����
ORDER BY NAME DESC;  --�������� ���� �Ұ���

SELECT * FROM EMP2
ORDER BY NAME, DEPTNO DESC, POSITION;

SELECT * FROM EMP2
ORDER BY 2,4 DESC, 9;  -- �ʵ� ��ȣ�� ���� ����

__________________________________
select * from emp2;
select name, empno, deptno, emp_type from emp2; --���ϴ� �ʵ忡 ���ڵ常 �˻�
select name, empno, deptno --, emp_type 
    from emp2
    where emp_type='������';
    
select name, empno, deptno --, emp_type 
    from emp2
    where emp_type='������'
    order by name desc;  -- asc : ��������
    
select name, empno, deptno, emp_type 
    from emp2
    --where emp_type='������'
    order by name desc, deptno asc; 
    
select DISTINCT emp_type 
    from emp2;
  --  where emp_type='������';    
    
select DISTINCT deptno 
    from emp2;
    
select name, empno, deptno, emp_type, position
    from emp2
    where position='����';
    
select name as "��   ��", empno �����ȣ, deptno "��    ��", emp_type as �ٹ�Ÿ��, position "��    ��"
    from emp2
    where position='����';
    

-- ������ �����̸鼭 �̸��� ������ --   
select name as "��   ��", empno �����ȣ, deptno "��    ��", emp_type as �ٹ�Ÿ��, position "��    ��"
    from emp2
    where position='����' or name='������';
 
 desc emp2;
 
select *
    from emp2
    where  deptno = 1000;

    
-- ������ -----------------------------------
SELECT MOD(7,3) FROM EMP2;
SELECT MOD(7,3) "���� ���" FROM DUAL;
_________________________________________
-- NVL �Լ�
SELECT * FROM PROFESSOR;

SELECT NAME, BONUS, POSITION
FROM PROFESSOR;

SELECT NAME, BONUS, POSITION
FROM PROFESSOR
WHERE BONUS IS NOT NULL;
--> NULL�� �ƴ� ����� ���

SELECT NAME, BONUS, BONUS+100,POSITION
FROM PROFESSOR;
-- NULL ������ ������ NULL���� ����

SELECT NAME, BONUS, NVL(BONUS,0)+100, POSITION
FROM PROFESSOR;
-- NULL�� 0���� ��ġ�� �� ����Ѵ�.
_________________________________________________

SELECT * 
FROM PROFESSOR
WHERE POSITION='������' OR POSITION='������';

SELECT * 
FROM PROFESSOR
WHERE POSITION IN ('������', '������');


SELECT * 
FROM STUDENT
WHERE GRADE IN (3,4);
-- STUDENT ���̺��� 3,4�г⸸ ����ϱ�

SELECT * 
FROM STUDENT
WHERE GRADE NOT IN (3,4);
-- STUDENT ���̺��� 3,4�г� �����ϰ� ����ϱ�
__________________________________________________
--BETWEEN ������

SELECT * 
FROM PROFESSOR
WHERE DEPTNO BETWEEN 103 AND 201;
-- WHERE DEPTNO BETWEEN 201 AND 103; �� ��µ��� ������ �����Ѵ�.
-- BETWEEN ������  AND  ū ��
__________________________________________________
--% / _
SELECT *
FROM EMP2
WHERE NAME LIKE '��%';
--��% : ��____(0�� �̻�)
--��__ : ��xx (2�� ����)

SELECT *
FROM EMP2
WHERE NAME LIKE '%��%';

--XXX��XXX �̸��� '��'�� �ִ� ��� ��� ��µ�

SELECT *
FROM PROFESSOR
WHERE NAME LIKE '__';
-- �̸��� �� ������ ��� (��������)

WHERE NAME LIKE '%��_';
--���X ���ÿ�X  ����

__________________________________________________

SELECT * 
FROM PROFESSOR
WHERE PAY > 500;

SELECT * 
FROM PROFESSOR
WHERE PAY <= 300;
-- 300 ����

SELECT * 
FROM PROFESSOR
WHERE PAY >= 250 AND PAY < 500;
-- 250 <= PAY > 500


--����--
--1 �޿��� 500�̻��̰�, ���ʽ��� 60�̻� �޴� ������? (professor table)
SELECT * 
FROM PROFESSOR
WHERE PAY >= 500 AND BONUS >= 60;

--2 �̸��� '���Ѷ�'�� '���Ѷ�'���� ���� (emp2)
UPDATE EMP2
SET NAME = '���Ѷ�'
WHERE NAME = '���Ѷ�';
SELECT * FROM EMP2;

--3 ��̰� ����� ����鸸 ã�Ƽ� '����'���� ����
UPDATE EMP2
SET HOBBY = '����'
WHERE HOBBY = '���';

--4 ����� ���� ã�Ƽ� �����ϱ�
DELETE FROM EMP2
WHERE EMP_TYPE = '�����'

--5 pay(or bonus)�� 50�̻��� ����� ��� (professor )
SELECT * FROM  PROFESSOR
WHERE PAY >= 50 OR BONUS >= 50;

--6 ~��Ʈ�� �ƴ� ��ǰ�鸸 ��� ( gift table)
SELECT * FROM GIFT
WHERE GNAME NOT LIKE '%��Ʈ';

--7 gno�� 10�� ��ǰ�� �̸��� ��ó��(null) �ϼ���.
UPDATE GIFT
SET GNAME = NULL
WHERE GNO = 10;
SELECT * FROM GIFT;

--8  gname �̸��� ����, g_start�� 999�� ���� ���� ������ �Է��ϼ���.
INSERT INTO GIFT(GNO, G_START, G_END) VALUES (11,999, 1000000);
 
--9 gname�� null�̰ų� ' ' �� �����͸� �����ϰ� ����Ͻÿ�.
SELECT * FROM GIFT
WHERE GNAME IS NOT NULL
AND GNAME != ' ';
-- NOT IN ('NULL', '') ORDER BY GNO DESC; NOT IN���� �����ϰ� �� �� �ִ�.

-- �������̸鼭 '�����' ã��
select * from emp2
where name = '�����' and emp_type = '������';

--�������̰ų� '������' ã��
select * from emp2
where name= '������' or emp_type = '������';

--�������̰ų� �达 ���� ���� ��� ã��
select * from emp2
where emp_type = '������' or name like '��%';

--�达�� �ƴ� ������ ã��
select * from emp2
where emp_type = '������' and name not like '��%';
______________________________________________________________
 
 ANY : �ּҰ� ���� ũ��
 �ʵ��(pay) >= ANY : �ּҰ����� ũ�ų� ������   any( 300, 550, 400 )
  < ANY : �ִ밪���� ������
  <= ANY : �ִ밪���� �۰ų� ������
   = ANY : IN�� ���� ȿ��
  != ANY : NOT IN�� ���� ȿ��

select * from professor where pay >= any( 300, 550, 400 ); --300���� ������ ū ���
select * from student where weight > any( 70, 80 );  -- 70���� ū ��
select * from student where weight < any( 60, 70 );  --70���� ���� ��

ALL

ANY�ʹ� �ݴ�Ǵ� �����Դϴ�.

  �ʵ��(pay) > ALL : �ִ밪 ���� ũ��  all( 300, 550, 400 )
>= ALL : �ִ밪���� ũ�ų� ������
< ALL : �ּҰ����� ������
<= ALL : �ּҰ����� �۰ų� ������
= ALL : SUBSELECT�� ����� 1���̸� ��������� ���� ���̸� ������ �߻��մϴ�.
!= ALL : ���� ���������� SUBSELECT�� ����� ���� ���̸� ������ �߻��մϴ�
*/
select * from professor where pay >= all( 300, 550, 400 ); -- 550���� ū ��
select * from student where weight > all( 70, 80 );  -- 80 ���� ū ��
select * from student where weight < all( 60, 70 ); -- 60���� ���� ��


--�Լ�----------------------------------------------------------
-- 1. ���� �Լ� (�׷� �Լ�)---------------------------------------
select * from gift;
select sum(g_start), sum(g_end) from gift;
select sum(g_start) "�������հ�",  sum(g_end) "��ǰ �ְ��� ����" from gift;

select sum(g_start), avg(g_start), max(g_start), min(g_start), avg(g_end) from gift;

select * from gift, emp2, professor;
select * from gift;
select * from emp2;
select * from professor;

--��� ���ϱ�

select  count(name), count(bonus), -- => �� ���ڵ��(null���� ������)
    avg(pay), avg(bonus)  -- ���(null ���� �����ϰ� ����)
    from professor;
    
select  count(name), count(bonus), -- => �� ���ڵ��(null���� ������)
    avg(pay),  avg(nvl(bonus, 0)), count(bonus) , count(nvl(bonus, 0)) --   ���(null ���� �����ϰ� ����)
    from professor;
_______________________________________________________________________________ 
select count(*) from professor;   -- count(*)  null ���� ���� �����ش�.
select count(hpage) from professor;  -- count(�ʵ��) null ������

select name, pay, bonus
    from professor;

insert into gift(gno, g_start) values(11, 999);
insert into gift(gname, g_start) values(' ', 999);

select * from gift;
select count(*) from gift;
select count(gname) from gift;

-- Oracle�� null ���� �켱���� ����.  MySQL�� null ���� �켱���� ����
SELECT RANK(600000) within GROUP(ORDER BY g_end desc)
    FROM gift
  where g_end is not null;
-- where g_end is not null or g_end='';
--  where g_end not in (' ', null);

--����-----------------------------------------------------------
-- ����10] Ű�� 168�� ����� �� ��°�� ū�� Ȯ��?
select * from student;
select rank(168) within group(order by height desc)
from student;

-- ����11] �����԰� 58�� ����� ���°���� ��� ���ϱ�
select rank(58) within group (order by weight desc)
from student;

-- ����12] g_end�� 200000, 600000 ���� ���� �� ��� (any �̿�)
select * from gift where g_end < any(200000, 600000);

-- ����13] �л����� Ű�� �հ� ���, ���� Ű�� ū ģ��, ���� ģ�� ����ϼ���.
select sum(height) ��, avg(height) ���, max(height), min(height)
from student;

_____________________________________________________________________

--����1] �̸����� '�迵��' ������� �����ּ���.
SELECT * FROM PROFESSOR
WHERE NAME LIKE '�迵��';

--����3] �̸��� �� ������ ��� �����ּ���.
SELECT * 
FROM PROFESSOR
WHERE NAME LIKE '__';

--����4] id�� s or a ���ڰ� ���� ��� ã��
SELECT *
FROM  PROFESSOR
WHERE ID LIKE '%s%' OR ID LIKE '%a%';

--����5] ���Ӱ��� ã���ּ���
SELECT *
FROM PROFESSOR
WHERE POSITION = '���Ӱ���';

--����6] �г��� 3�г�(grade)�̰� Ű(height)�� 165�̻��� �а��ڵ�(deptno1)�� 201�� �л� ã��  
select * from student where grade = 3
and height >= 165
and deptno1 = 201;

--����7] ������ 77�� ������ �л��� ã��
select * 
from student
where birthday < '77/01/01' order by birthday desc;

--����8] ������(deptno2)�� ���� �л��鸸 ã��
select * from student where deptno2 is not null;

--����9] ��米��(profno)�� 1000 ~ 2001 �� ���� �л��� ã�� 
select * from student
where profno  between 1000 and 2001;