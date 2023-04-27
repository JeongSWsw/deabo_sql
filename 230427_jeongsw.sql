--select * -- �ʵ�1, �ʵ�2
--    from test; -- ���̺��
    
select sysdate from dual; -- oracle���� ���� ���̺� ����
/*
--create table ���̺��̸�(
--  �÷���datatype [ null | not null ] [ constraint ��Ī��������] ,
--  �÷���datatype [ null | not null ] [ constraint ��Ī��������] ,
--  .....
--)
*/

CREATE TABLE userlist(
id VARCHAR2(10) CONSTRAINT id_pk PRIMARY key,
name varchar2(10) -- not null
);

select * from userlist;
drop table userlist;
insert into userlist values ('kingsmile','aa');
insert into userlist values ('yuna','�迬��');
insert into userlist(id) values('ccc');

delete from userlist; -- delete : ���ڵ� ����
rollback;
-------------��������---------
--CREATE TABLE fk_member(
--code number(2) NOT NULL ,
--id VARCHAR2(20) NOT NULL
--CONSTRAINT id_fk REFERENCES MEMBER(id) ,
--etc VARCHAR2(10)
--);

CREATE TABLE userlist_un(
    id VARCHAR2(10) CONSTRAINT userlist_un_id_pk PRIMARY key, -- �⺻Ű ���ϼ�, �� ������� ����, �ߺ� ��� X
    jumin char(13) CONSTRAINT jumin_un unique -- ����ũ ���ϼ�, �ߺ� ���X, �����
);

select * from userlist_un;
insert into userlist_un values ('aa','111');
insert into userlist_un values ('bb','222');
insert into userlist_un values ('cc','333');

insert into userlist_un(id) values ('bb'); -- pk ����
insert into userlist_un(id) values ('ppp');-- un ���� �ȵ�

CREATE TABLE ck_Test(
NAME VARCHAR2(10) NOT NULL,
age NUMBER(2) NOT NULL
CHECK (age BETWEEN 20 AND 30 )
--age�÷��ǰ���20~30���̸����
);

select * from ck_test;
insert into ck_test values('aa',22);
insert into ck_test values('aa',30);
insert into ck_test values('aa',55);
insert into ck_test values('aa',12);
insert into ck_test values('aa',44);

CREATE TABLE de_Test(
    NAME VARCHAR2(10) NOT NULL,
    addr VARCHAR2(10) DEFAULT '����'
);
select * from de_test;
insert into de_test values ('aa','jeju');
insert into de_test values ('bb','seoul');
insert into de_test values ('cc','����');
insert into de_test values ('dd','�λ�');

insert into de_test values('ppp',default);
insert into de_test values('kk',null);

insert into de_test(name) values ('bb');
insert into de_test(name) values ('cc');
insert into de_test(name) values ('dd');

