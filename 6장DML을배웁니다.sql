select * from dept2;
insert into dept2(dcode, dname, pdept, area)
values(9000,'Ư��1��','����','�ӽ�����');
insert into dept2
values(9001, 'Ư��2��','����','�ӽ�����');
insert into dept2(dcode, dname, pdept)
values(9002,'Ư��3��','����');
insert into professor (profno, name, id, position, pay, hiredate)
values (5001,'�輳��','Love_me','������',501,'2011-11-14');
select * from professor;

drop table professor2;
create table professor2
as select * from professor;
select * from professor2;
insert into professor2 select * from professor;

insert all into p_01 (no,name) values (1,'aaa')
into p_02 (no,name) values (2,'bbb');
select * from dual;

insert all
when profno between 1000 and 1999 then
into p_01 values(profno, name)
when profno between 2000 and 2999 then
into p_02 values(profno, name)
select profno, name
from professor;

select * from p_01;
select * from p_02;

insert all
into p_01 values (profno, name)
into p_02 values (profno, name)
select profno, name
from professor
where profno between 3000 and 3999;

update professor
set bonus = 100
where position = '������';

select * from professor;

update professor
set pay = pay * 1.15
where position = (select position
                from professor
                where name = '����ö')
and pay < 250;

delete from dept2
where dcode between 9000 and 9100;
