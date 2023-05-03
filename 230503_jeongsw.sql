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