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
