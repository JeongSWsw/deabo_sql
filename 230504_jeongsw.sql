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