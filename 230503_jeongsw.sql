-- Join ---------------------------------
-- �ΰ��̻������̺����ϳ������̺�θ�����ѹ��ǰ˻����ο����÷���������Ȯ���Ҷ������.

select * from emp; -- 14
select * from dept;-- 4

select * from emp, dept;

-- inner Join
--select �÷���, .....
--from ���̺��̸���Ī[Inner] join ���̺��̸���Ī
--on ��Ī.�÷��� = ��Ī.�÷���

select empno, ename, job, d.deptno, loc --���̺��.�ʵ�� ȣ�� dept.deptno, emp.deptno
from emp e, dept d
where e.deptno = d.deptno; --inner join

select empno, ename, job, d.deptno, loc --���̺��.�ʵ�� ȣ�� dept.deptno, emp.deptno
from emp e join dept d
on e.deptno = d.deptno; --inner join
-- join ��ɾ ���� ���, on�� �����

select empno, ename, job, d.deptno, loc --���̺��.�ʵ�� ȣ�� dept.deptno, emp.deptno
from emp e left outer join dept d -- left outer join : ���ʿ� �ִ� ������ ���, ������ ��ġ�ϴ� �����͸�...
on e.deptno = d.deptno;


select empno, ename, job, d.deptno, loc --���̺��.�ʵ�� ȣ�� dept.deptno, emp.deptno
from dept d left outer join emp e  
on d.deptno = e.deptno;


select empno, ename, job, d.deptno, loc --���̺��.�ʵ�� ȣ�� dept.deptno, emp.deptno
--from emp e right outer join dept d -- right outer join : �����ʿ� �ִ� ������ ���, ���� ��ġ�ϴ� �����͸�...
--on e.deptno = d.deptno;
from dept d right outer join emp e -- right outer join : �����ʿ� �ִ� ������ ���, ���� ��ġ�ϴ� �����͸�...
on d.deptno = e.deptno;

desc emp;
insert INTO emp(empno, ename, sal) values (100, '�迬��', 1000);
---------------------------------
select p.name "�����̸�", p.position "����", p.deptno "�а��ڵ�", p.profno "�����ڵ�",
s.name "�л��̸�", s.studno "�й�", s.grade "�г�", s.deptno1 "�������а�"
from professor p left outer join student s
on p.profno=s.profno;
select p.name "�����̸�", p.position "����", p.deptno "�а��ڵ�", p.profno "�����ڵ�",
s.name "�л��̸�", s.studno "�й�", s.grade "�г�", s.deptno1 "�������а�"
from professor p right outer join student s
on p.profno=s.profno;
---------------------------------

---�����������̺�����
--select �÷���, .....
--from ���̺��̸���Ī[Inner] join ���̺��̸���Ī
--on ��Ī.�÷���= ��Ī.�÷���[Inner] join ���̺��̸���Ī
--on ��Ī.�÷���= ��Ī.�÷���...

select * from department;

select p.profno, p.name, s.studno, s.name �л��̸�, s.grade, d.dname
    from professor p join student s
    on p.profno = s.profno join department d
    on s.deptno1 = d.deptno;
    
select p.profno, p.name, s.studno, s.name �л��̸�, s.grade, d.dname
    from professor p left join student s
    on p.profno = s.profno right join department d
    on s.deptno1 = d.deptno;

select p.profno, p.name, s.studno, s.name �л��̸�, s.grade, d.dname
    from professor p left join student s
    on p.profno = s.profno left join department d
    on s.deptno1 = d.deptno;

-- ����̸�, �μ��̸�, ��å, �Ŵ�����ȣ ��� emp/dept ���̺� �̿�
select * from emp;
select * from dept;
select e.ename ����̸� ,d.dname �μ��̸�, e.job ��å, e.mgr �Ŵ�����ȣ
from emp e left join dept d
on e.deptno = d.deptno;

-- self join 
select * from emp;

select e.empno, e.ename, e.job, em.mgr ��������, em.ename �����ڸ�
    from emp e join emp em
    on e.mgr = em.empno;
    
create table c_empAll -- ���̺� ���������� ���簡 �ȵ�!!!
    as select * from emp;
    
select * from c_empAll;
desc emp;
select * from all_constraints --kingsmile ����ڰ� �����ִ� ��ü �������� ����
    where Table_name = 'EMP'; -- ���ǿ� ���� ���̺��� �������Ÿ� Ȯ�� (���̺�� ��ҹ��� ������)

desc c_empAll;
select * from all_constraints --kingsmile ����ڰ� �����ִ� ��ü �������� ����
    where Table_name = 'c_empAll'; -- ���ǿ� ���� ���̺��� �������Ÿ� Ȯ�� (���̺�� ��ҹ��� ������)
-- ���̺� ���������� ���簡 �ȵ�!!!

select * from emp where deptno = 20;
create table c_emp_20
    as select * from emp where deptno=20; -- ������ �༭ ���̺� ���� ����
select * from c_emp_20;

select * from emp where deptno=30;
create table c_emp_30
    as select empno ���, ename �����, job ��å, sal �޿�
    from emp where deptno=30;
    
-- ����1] �������̺��� ���Ӱ��縸 �̾Ƽ� ���̺� ����
select * from professor;
create table c_professor_1
    as select * from professor where position='���Ӱ���';
select * from c_professor_1;

-- ����2] emp ���̺��� mgr�� 7566���� ����� �����ؼ� ���̺� ����
select * from emp;
create table c_emp_7566
    as select * from emp where mgr=7566;
select * from c_emp_7566;

-- ���� > �������� �����ϱ� ���Ҷ�
--create table ���̺��
--    as select �ʵ�� ... 
--    from ���̺�� where 1=0; -- ���� ����

create table c_emp4
    as select * from emp
    where 1=0;
select * from c_emp4;

create table c_emp5
    as select empno, ename, job, sal from emp;
    
select * from c_empAll; -- ��ü ����
select * from c_emp_20; -- ���ǿ� �°� ����
select * from c_emp_30; -- ��������, ��Ī
select * from c_emp4;   -- �������� ����, ���ڵ� ����
select * from c_emp5;   -- ���ϴ� �ʵ忡 �ش��ϴ� ���ڵ� ����, empno, ename, job, sal

-- �������ǵ��� ���� �ȵ�!!!


-- Union -------- pk / fk ���� �ƴ� ���� ���̺� ��ġ��
select * from emp
union -- �ߺ��� ����
select * from c_empAll;

select * from emp
union all -- �ߺ��� ����
select * from c_empAll;

insert into c_empAll values(7788, 'kingsmile', 'manager', 7566, '2202/01/17' , 5000, 1000, 30);

select * from emp 
union -- �ߺ��� ����
select * from c_emp5; -- error : �ʵ尳���� ������Ÿ���� �¾ƾ���

desc emp;

-- �˻�!!!!!!!! �������� ��ҹ��� ���� ���Ѵ�.
-- ��, ���ڵ�� ��ҹ��� �����Ѵ�.
select * from c_empAll;
select * from c_empAll where job='MANAGER';
select * from c_empAll where job='MANAGER' or job='manager';
select * from c_empAll where job!='MANAGER' or job!='manager';
select * from c_empAll where job<>'MANAGER' or job<>'manager';
select * from c_empAll where job in('MANAGER','manager');
select * from c_empAll where job not in('MANAGER','manager');

select empno �����ȣ, ename �̸�, sal �޿�
    from emp
--    where ename = 'FORD'
--    where �̸� = 'FORD'; -- error : ��Ī���� ���� X
    order by �޿� DESC;    -- ��Ī���� ���� O
    
-- ����1] c_emp_20, c_emp4 union ���
select * from c_emp_20
union
select * from c_emp4;

-- ����2] �����ȣ, �̸�, �޿� �׸��� 15%�λ�� �޿��� ������ ǥ���ϵ�
-- �÷����� New Salary�� �����Ͽ� ����϶�
select * from emp;
select empno �����ȣ, ename �̸�, sal �޿�, round(sal*1.15) "New Salary"
from emp;

select empno �����ȣ, ename �̸�, sal �޿�, cast(sal*1.15 as int) "New Salary"
from emp;

-- ����3] 2�� ������ ������ �����Ϳ��� �޿� �λ�� ( �� �޿����� ���� �޿��� �� �� )
-- �� �߰��ؼ� ����϶� (�÷����� increase�� �϶�)
select empno �����ȣ, ename �̸�, sal �޿�, round(sal*1.15) "New Salary", round(sal*1.15) - sal "increase"
from emp;

-- ����4] �� ����� �̸��� ǥ���ϰ� �ٹ� �� ���� ����Ͽ�
-- Ŀ������ Months_Works�� �����ϰ�, �ٹ� �޼��� �������� ������ ������� �����Ͽ� ���
select * from emp;
select ename ����̸�, floor(months_between(sysdate, hiredate)) Months_Works
from emp
order by Months_Works desc;

-- ����5] ����� �̸��� Ŀ�̼��� ����ϵ�
-- Ŀ�̼��� å������ ���� ����� Ŀ�̼��� 'no commission'���� ���
select * from emp;
select ename ����̸�, nvl(comm,'no commission') Ŀ�̼�
from emp; -- error 
select ename ����̸�, nvl(to_char(comm),'no commission') Ŀ�̼�
from emp; 
select ename ����̸�, decode(comm, null, 'no commission', comm)
from emp; 