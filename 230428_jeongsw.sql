create table test(
    no number not null, -- primary key, number : default 4byte (-9999~9999)
    name varchar2(10) not null,
    birthdate date, -- ������� : '��-��-��' or '��/��/��' '88-12-20' or '88/12/20'
    age number,
    constraint test_no_pk primary key(no)
);

select * from test;
desc test;
select * from userlist;
select * from emp2;

--���÷��߰�
--alter table ���̺��̸� add
--(�÷����ڷ���[��������] , �÷����ڷ���[��������] , ....)

alter table userlist add phone varchar2(15);
alter table userlist add (no number(2), gender char(2)); -- �ϳ� �̻��� ��� �����־�� �Ѵ�.()

select * from userlist;
-- update ���̺�� set ������ ����; -- ��ü ���ڵ� ����
-- update ���̺�� set ������ ���� where ����; -- ���ǿ� �´� ���ڵ� ����
update userlist set no=1;
update userlist set no=1 where id='kingsmile';
update userlist set no=3, gender = 'f', name = '������' where id='ccc';
rollback;

--���÷�����
--alter table ���̺��̸� drop column �÷��̸�

alter table userlist drop column phone;
alter table userlist drop (no, gender);
select * from userlist;

--��datatype����
--alter table ���̺��̸� modify �÷��̸������ڷ���

desc userlist;
alter table userlist modify phone number; -- �÷��� ������ ������ ��� Ÿ�� ���� ������
alter table userlist modify no date; -- ������ ������ ���� ��� ���� �ȵ�, ����� nulló���ϰų� ������ �����Ѵ�.
select * from userlist;

update userlist set no = '';

--���÷��̸�����
--alter table ���̺��̸�rename column �����÷���to �����÷���
alter table userlist rename column phone to tel;
alter table userlist rename column no to num;
select * from userlist;

--�����̺����
--drop table ���̺��̸�
select * from userlist;
drop table userlist;
delete from userlist;
rollback;
select * from userlist;

-- ���� ���̺� ��� ����
show RECYCLEBIN;
desc recyclebin;

-- ���� (������ ���̺�)
FLASHBACK table userlist to before drop;

drop table emp2 purge;
flashback table emp2 to before drop;
select * from emp2;

show recyclebin;

-- ������ ����
purge RECYCLEBIN;

drop table emp2;
select * from emp2;
select * from tab;

-- ���ڵ� ���� / ���� / ���� ----------------
--insert into ���̺��̸�(�÷���, �÷���,...) values(��, ��, ...)
--insert into ���̺��̸�values(��, ��, ...)
--          =>����÷�����ΰ������������

select * from userlist;
select * from gift;
desc gift;
insert into gift values (100,'�����Ʈ',1000, 100000);
insert into gift(gname,g_end) values ('��ȭå',30000);

-- ���ڵ� ����
--update ���̺��̸�
--set �÷���=���氪, �÷���=���氪, �÷���=���氪, .....
--[ where ���ǽ�]
select * from professor;
--select name, position, pay,pay*1.2 as "�λ��", bonus
select *
    from professor
    where position='���Ӱ���';
    
update professor set pay = pay * 1.2 
    where position = '������';
rollback;

-- ���ڵ� ����
--Delete table�̸�[ where ���ǽ�]
--truncate table ���̺��̸�;
select * from gift;
select * from gift where gname like '%��Ʈ'; -- % :���, _ : �ѹ���
delete gift where gname LIKE '%��Ʈ';
rollback;