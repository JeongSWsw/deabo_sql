-- �����Լ� ���� Group by : �Ұ� (�κ���)

select * from student;
select grade, sum(height), avg(height), max(height), min(weight)
from student
group by grade; -- �Ϲ��ʵ�� �׷�(����) �ʵ�� ���� ��� �� �� ����.

select * from emp2;
-- emp_type ���� �ο���, pay ��, ���, �ְ�޿�, ���ϱ޿� ���ϱ�
select emp_type, count(emp_type),sum(pay), avg(pay), max(pay), min(pay)
from emp2
group by emp_type;

-- ���� ���̺��� ���޺��� ������ ���, �ְ�, ���� ���ϱ�
select * from professor;

select distinct position from professor;

select position, avg(pay), max(pay), min(pay)
FROM professor
group by position;

-- ���� : where��, having �� �̿�
/*
select *
from tableName
[where] ����
[order by] ����
*/
select grade, sum(height), avg(height), max(height), min(weight)
from student
group by grade
having avg(height) > 172;

select emp_type, count(emp_type),sum(pay), avg(pay), max(pay), min(pay)
from emp2
group by emp_type
having avg(pay) >= 30000000 ;

-- ����] �ְ�޿� �޴� ������� ���� ����
select position, avg(pay), max(pay), min(pay)
FROM professor
group by position
having avg(pay) < 380;

--������Լ�----------------------------------
select round(12.3456789,0),round(12.7456789,0),round(12.3436789,2),round(12.3456789,2)
from dual;

select ceil(12.34), ceil(-12.34) from dual; --�ø� �� �� ���� ��ȯ
select floor(12.34), floor(-12.34) from dual;
select trunc(12.3456789,2),trunc(12.7456789,2),trunc(12.3456789,0) from dual;
select * from dept2;

-- �������̺��� ���޿� �λ�� 2%�� ��� ���(�Ҽ��� 0���� ó��)
select * from professor;
select name, round(pay*1.02,0) from professor;

update professor
set pay=round(pay*1.02,0);
rollback;

-- �������̺��� ��� �����鿡�� ���ʽ� 1000�� �߰�
update professor
set bonus = nvl(bonus,0) + 1000; 

-- �鹮�ڿ��Լ�----------------------------
select * from professor;
select id, upper(id) from professor;
select id, initcap(id) from professor;
select id, length(id), length('abcd') from professor;
select * from dept2;
select dname,length(dname),lengthb(dname) from dept2;
select length('�����') from dual;
select lengthb('�����') from dual;
select * from gogak;
select jumin, substr(jumin,7,1) from gogak;
select instr('abcd','b') from dual; -- index number : 1���� ����
select id, instr(id, 'b') from professor;
select instr('abcdefwlfklsnflsfbsf','b',-1) from dual; -- 1�̸� �ڿ������� ã�´�.
