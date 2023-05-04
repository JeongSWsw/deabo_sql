-- subquery ------------
-- select * from emp where ename = ( ������������) ;

select * from emp2;
select pay from emp2 where name = '�����';

select * from emp2 where pay > 60000000;

select * from emp2 
where pay > (select pay from emp2 where name = '�����');

select avg(pay) from emp2;

select * from emp2
where pay < 43100000;

select * from emp2
where pay < (select avg(pay) from emp2);

--����1] student ���̺�� department ���̺��� ����Ͽ� 
-- ������ �л��� ����(deptno1)�� 
-- ������ �л����� �̸��� ���� �̸��� ����ϼ���
select s.name, d.dname
from student s join department d
on s.deptno1 = d.deptno
and s.deptno1 = (select deptno1 from student where name = '������');

--����2] �������̺��� �Ի��� �۵��� �������� 
-- ���߿� �Ի��� ����� �Ի���, �а����� ����ϼ���.
select p.hiredate, d.dname
from department d join professor p
on d.deptno = p.deptno
where p.hiredate > 
(select hiredate from professor where name = '�۵���');


--����3] �л����̺��� ����1�� 101�� �а��� 
-- ��� �����Ժ��� ���� ������ �л����� �̸��� �����Ը� ����ϼ���.

select name, weight
from student
where weight > (select avg(weight) 
from student 
where deptno1 = 101);

--����4] emp2 ���̺��� ����Ͽ� ��ü ���� �� 
--���� ������ �ּ� �����ں��� ������ ���� ����� 
--�̸��� ����, ������ ����ϼ���.
--��, ���� ��� ������ õ ���� ���б�ȣ(,)�� �� ǥ�ñ����ؼ� ����ϱ�
select name, position, to_char(pay,'999,999,999')
from emp2
where pay > (select min(pay) from emp2 where position = '����');

--����5]student ���̺��� ��ȸ�Ͽ� 
-- ��ü �л� �߿��� ü���� 
-- 4�г� �л����� ü�߿��� ���� ���� ������ 
-- �л����� ���� �л��� �̸��� �г�� �����Ը� ���.
select name, grade, weight
from student
where weight < (select min(weight) from student where grade = 4);
--����6]student ���̺��� ��ȸ�Ͽ� 
--�� �г⺰�� �ִ� Ű�� ���� �л����� �г�� �̸��� Ű�� ���.
select grade �г�, name �̸�, height Ű
from student
where (grade, height) in (select grade, max(height) from student group by grade);

--����7]professor ���̺��� ��ȸ�Ͽ� 
-- �� �а����� �Ի����� ���� ������ ������ 
-- ������ȣ�� �̸�, �Ի���, �а����� ���. 
-- ��, �а�������� �������� ����.
select * from professor;
select profno, name, hiredate, dname
from professor p , department d
where p.deptno = d.deptno 
and (p.deptno, p.hiredate)
in (select deptno, min(hiredate) from professor group by deptno);
--����8]Emp2 ���̺��� ��ȸ�Ͽ� 
--���޺��� �ش� ���޿��� �ִ� ������ �޴� ������ 
-- �̸��� ����, ������ ����ϼ���. 
--���������� �������� �����ϼ���.
select * from emp2;
select name, position, pay
from emp2
where (position, pay) in ( select position, max(pay) from emp2 group by position)
order by 3;
--����9]emp2 ��� �޿����� ���� ��� ����ϼ���.
select * from emp2;
select * from emp2
where pay < (select avg(pay) from emp2);
--------------------------------------------------
--����1] student ���̺�� department ���̺��� ����Ͽ� ������ �л��� ����(deptno1)�� 
-- ������ �л����� �̸��� ���� �̸��� ����ϼ���
select * from department;
select * from student;

select deptno1 from student where name='������';  -- 101

--select s.name, d.dname
select name, dname
    from student s, department d
    where s.deptno1 = d.deptno and s.deptno1 = 101;
    
select name, dname
    from student s join department d
    on s.deptno1 = d.deptno and s.deptno1 = 101;

select name, dname
    from student s, department d
    where s.deptno1 = d.deptno 
    and s.deptno1 = (select deptno1 from student where name='������');
    
select name, dname
    from student s join department d  -- inner join
    on s.deptno1 = d.deptno 
    and s.deptno1 = (select deptno1 from student where name='������');

select name, dname
    from student s, department d
    where s.deptno1 = (select deptno1 from student where name='������') 
    and s.deptno1 = d.deptno;

--����2] �������̺��� �Ի��� �۵��� �������� ���߿� �Ի��� ����� �Ի���, �а����� ����ϼ���.
select * from professor;
select hiredate from professor where name='�۵���';  -- 98/03/22

select p.name, p.hiredate, d.dname
    from professor p, department d
    where p.hiredate > ( select hiredate from professor where name='�۵���' )
    and p.deptno = d.deptno;
    
--����3] �л����̺��� ����1�� 101�� �а��� ��� �����Ժ��� ���� ������ �л����� �̸��� �����Ը� ����ϼ���.
select * from student;
select avg(weight) from student where deptno1 = 101;  -- 60

select deptno1, avg(weight) 
    from student 
    --where deptno1 = (select avg(weight) from student where deptno1 = 101)
    group by deptno1;

select name, weight
    from student 
    where weight > (select avg(weight) from student where deptno1 = 101); -- 60
    
-- cf) ���� �ڵ忡�� �а����� ��� 

--- �� ���������� ����� �� �� �̻� ��ȯ�ɶ��� in , any, all �����ڸ� �����. ----------------
select * from dept2;
select dcode from dept2 where area='��������';

select empno, name, deptno
    from emp2
    where deptno in( 1000, 1001, 1002, 1010 ); 
--------------------------------------------------------
select empno, name, deptno
    from emp2
    where deptno in( select dcode from dept2 where area='��������' ); -- �������� ����� �������϶�
    
--����4] emp2 ���̺��� ����Ͽ� ��ü ���� �� ���� ������ �ּ� �����ں��� ������ ���� ����� �̸��� ����, ������ ����ϼ���.
--��, ���� ��� ������ õ ���� ���б�ȣ(,)�� �� ǥ�ñ����ؼ� ����ϱ�
select * from emp2;
select name, position, pay 
    from emp2
    where pay > (  select min(pay) from emp2 where position ='����' );

select name, position, pay 
    from emp2
    where pay > any(  select pay from emp2 where position ='����' );

select name, position,  to_char(pay, '999,999,999')||'��' "����" 
    from emp2
    where pay > any(  select pay from emp2 where position ='����' );
    
--����5]student ���̺��� ��ȸ�Ͽ� ��ü �л� �߿��� ü���� 4�г� �л����� ü�߿��� ���� ���� ������ 
--�л����� ���� �л��� �̸��� �г�� �����Ը� ���.
select name, grade, weight
    from student
    where weight < ( select min(weight) from student where grade=4 );  -- ( 52 )
-----------------------------------------------------------
select name, grade, weight
    from student
    where weight < all( select weight from student where grade=4 ); -- �������� ��� 
--    where weight < all( 72, 64, 52, 83, 70 ); 

--����6]student ���̺��� ��ȸ�Ͽ� �� �г⺰�� �ִ� Ű�� ���� �л����� �г�� �̸��� Ű�� ���.
select grade "�г�", name "�̸�", height "Ű"
    from student
    where (grade, height) in( select grade, max(height) from student group by grade ) ;
    
--����7]professor ���̺��� ��ȸ�Ͽ� �� �а����� �Ի����� ���� ������ ������ ������ȣ�� �̸�, �Ի���, �а����� ���. 
-- ��, �а�������� �������� ����.
select profno "������ȣ", name "��   ��", hiredate �Ի���, dname �а���
    from professor p, department d
    where p.deptno = d.deptno and (p.deptno, p.hiredate)
        in( select deptno, min(hiredate) from professor group by deptno )
        order by 4 ;  -- order by dname   -- order by �а���
        
select profno "������ȣ", name "��   ��", hiredate �Ի���, dname �а���
    from professor p join department d
    on p.deptno = d.deptno and (p.deptno, p.hiredate)
        in( select deptno, min(hiredate) from professor group by deptno )
        order by 4 ;  -- order by dname   -- order by �а���
        
select * from department;
------------------------------------------------------------------
SELECT
    profno,
    name,
    hiredate,
    dname
FROM
         professor p  JOIN department d 
ON p.deptno = d.deptno

WHERE
    ( p.deptno ,hiredate) IN (  SELECT   deptno, min(hiredate)   FROM  professor group by deptno );

--����8]Emp2 ���̺��� ��ȸ�Ͽ� ���޺��� �ش� ���޿��� �ִ� ������ �޴� ������ �̸��� ����, ������ ����ϼ���. 
--���������� �������� �����ϼ���.
select name "�̸�", position "����", pay "����"
   from emp2
   where (position, pay) in( select position, Max(pay) from emp2 group by position )
   order by 3 ;
   
select * from emp2;
-------------------------------------------------------
SELECT name, position, pay
    FROM emp2
    WHERE (position, pay) IN (SELECT position, MAX(pay) FROM emp2  where position is not null GROUP BY position)
--    WHERE (position, pay) IN (SELECT position, MAX(pay) FROM emp2  where position not in(null, ' ') GROUP BY position)  -- ??? 
    ORDER BY pay;
    
--����9] emp2 ��� �޿����� ���� ��� ����ϼ���.
select * 
    from emp2
    where pay < (select avg(pay) from emp2);

-----------------------------------------------
select grade, name, height
    from student
    where (grade, height) in ( select grade, max(height) from student group by grade );
    
select grade, name, height
    from student
    where (grade, height) in ( select grade, max(height) from student group by grade );



