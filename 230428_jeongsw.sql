create table test(
    no number not null, -- primary key, number : default 4byte (-9999~9999)
    name varchar2(10) not null,
    birthdate date, -- 생년월일 : '년-월-일' or '년/월/일' '88-12-20' or '88/12/20'
    age number,
    constraint test_no_pk primary key(no)
);

select * from test;
desc test;
select * from userlist;
select * from emp2;

--①컬럼추가
--alter table 테이블이름 add
--(컬럼명자료형[제약조건] , 컬럼명자료형[제약조건] , ....)

alter table userlist add phone varchar2(15);
alter table userlist add (no number(2), gender char(2)); -- 하나 이상일 경우 묶어주어야 한다.()

select * from userlist;
-- update 테이블명 set 변경할 내용; -- 전체 레코드 변경
-- update 테이블명 set 변경할 내용 where 조건; -- 조건에 맞는 레코드 변경
update userlist set no=1;
update userlist set no=1 where id='kingsmile';
update userlist set no=3, gender = 'f', name = '강감찬' where id='ccc';
rollback;

--②컬럼삭제
--alter table 테이블이름 drop column 컬럼이름

alter table userlist drop column phone;
alter table userlist drop (no, gender);
select * from userlist;

--③datatype변경
--alter table 테이블이름 modify 컬럼이름변경자료형

desc userlist;
alter table userlist modify phone number; -- 컬럼에 데이터 없었을 경우 타입 변경 가능함
alter table userlist modify no date; -- 기존에 데이터 있을 경우 변경 안됨, 방법은 null처리하거나 비우고나서 변경한다.
select * from userlist;

update userlist set no = '';

--④컬럼이름변경
--alter table 테이블이름rename column 기존컬럼명to 변경컬럼명
alter table userlist rename column phone to tel;
alter table userlist rename column no to num;
select * from userlist;

--⑤테이블삭제
--drop table 테이블이름
select * from userlist;
drop table userlist;
delete from userlist;
rollback;
select * from userlist;

-- 삭제 테이블 목록 보기
show RECYCLEBIN;
desc recyclebin;

-- 복구 (삭제된 테이블)
FLASHBACK table userlist to before drop;

drop table emp2 purge;
flashback table emp2 to before drop;
select * from emp2;

show recyclebin;

-- 휴지통 비우기
purge RECYCLEBIN;

drop table emp2;
select * from emp2;
select * from tab;

-- 레코드 삽입 / 삭제 / 수정 ----------------
--insert into 테이블이름(컬럼명, 컬럼명,...) values(값, 값, ...)
--insert into 테이블이름values(값, 값, ...)
--          =>모든컬럼에모두값을넣을때사용

select * from userlist;
select * from gift;
desc gift;
insert into gift values (100,'냉장고세트',1000, 100000);
insert into gift(gname,g_end) values ('동화책',30000);

-- 레코드 수정
--update 테이블이름
--set 컬럼명=변경값, 컬럼명=변경값, 컬럼명=변경값, .....
--[ where 조건식]
select * from professor;
--select name, position, pay,pay*1.2 as "인상분", bonus
select *
    from professor
    where position='전임강사';
    
update professor set pay = pay * 1.2 
    where position = '정교수';
rollback;

-- 레코드 삭제
--Delete table이름[ where 조건식]
--truncate table 테이블이름;
select * from gift;
select * from gift where gname like '%세트'; -- % :모든, _ : 한문자
delete gift where gname LIKE '%세트';
rollback;