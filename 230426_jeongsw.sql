select * from tab;

create TABLE Test(
    no number, -- number default 4byte
    name varchar2(10),
    phone varchar2(15)
);

select * from test; -- test ���̺� ���(���ڵ� ����)

desc test; -- ���̺� ���� ����

insert into test values (1, 'yuna','010-2222-4555');
insert into test values (21, 'doyeong','010-3333-3333');
insert into test(name,no) values ('�浿', 20 );

select * from person;

drop table person;