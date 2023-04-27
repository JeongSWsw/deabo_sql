select * from tab;

create TABLE Test(
    no number, -- number default 4byte
    name varchar2(10),
    phone varchar2(15)
);

select * from test; -- test 테이블 목록(레코드 보기)

desc test; -- 테이블 구조 보기

insert into test values (1, 'yuna','010-2222-4555');
insert into test values (21, 'doyeong','010-3333-3333');
insert into test(name,no) values ('길동', 20 );

select * from person;

drop table person;