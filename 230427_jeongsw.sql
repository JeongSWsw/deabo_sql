--select * -- 필드1, 필드2
--    from test; -- 테이블명
    
select sysdate from dual; -- oracle에서 가상 테이블 제공
/*
--create table 테이블이름(
--  컬럼명datatype [ null | not null ] [ constraint 별칭제약조건] ,
--  컬럼명datatype [ null | not null ] [ constraint 별칭제약조건] ,
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
insert into userlist values ('yuna','김연아');
insert into userlist(id) values('ccc');

delete from userlist; -- delete : 레코드 삭제
rollback;
-------------제약조건---------
--CREATE TABLE fk_member(
--code number(2) NOT NULL ,
--id VARCHAR2(20) NOT NULL
--CONSTRAINT id_fk REFERENCES MEMBER(id) ,
--etc VARCHAR2(10)
--);

CREATE TABLE userlist_un(
    id VARCHAR2(10) CONSTRAINT userlist_un_id_pk PRIMARY key, -- 기본키 유일성, 널 허용하지 않음, 중복 허용 X
    jumin char(13) CONSTRAINT jumin_un unique -- 유니크 유일성, 중복 허용X, 널허용
);

select * from userlist_un;
insert into userlist_un values ('aa','111');
insert into userlist_un values ('bb','222');
insert into userlist_un values ('cc','333');

insert into userlist_un(id) values ('bb'); -- pk 위배
insert into userlist_un(id) values ('ppp');-- un 위배 안됨

CREATE TABLE ck_Test(
NAME VARCHAR2(10) NOT NULL,
age NUMBER(2) NOT NULL
CHECK (age BETWEEN 20 AND 30 )
--age컬럼의값은20~30사이만허용
);

select * from ck_test;
insert into ck_test values('aa',22);
insert into ck_test values('aa',30);
insert into ck_test values('aa',55);
insert into ck_test values('aa',12);
insert into ck_test values('aa',44);

CREATE TABLE de_Test(
    NAME VARCHAR2(10) NOT NULL,
    addr VARCHAR2(10) DEFAULT '서울'
);
select * from de_test;
insert into de_test values ('aa','jeju');
insert into de_test values ('bb','seoul');
insert into de_test values ('cc','서울');
insert into de_test values ('dd','부산');

insert into de_test values('ppp',default);
insert into de_test values('kk',null);

insert into de_test(name) values ('bb');
insert into de_test(name) values ('cc');
insert into de_test(name) values ('dd');

