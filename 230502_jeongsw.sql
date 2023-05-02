-- 집계함수 사용시 Group by : 소계 (부분합)

select * from student;
select grade, sum(height), avg(height), max(height), min(weight)
from student
group by grade; -- 일반필드는 그룹(집합) 필드와 같이 사용 할 수 없다.

select * from emp2;
-- emp_type 별로 인원수, pay 합, 평균, 최고급여, 최하급여 구하기
select emp_type, count(emp_type),sum(pay), avg(pay), max(pay), min(pay)
from emp2
group by emp_type;

-- 교수 테이블에서 직급별로 연봉의 평균, 최고값, 최하 구하기
select * from professor;

select distinct position from professor;

select position, avg(pay), max(pay), min(pay)
FROM professor
group by position;

-- 조건 : where절, having 절 이용
/*
select *
from tableName
[where] 조건
[order by] 정렬
*/
select grade, sum(height), avg(height), max(height), min(weight)
from student
group by grade
having avg(height) > 172;

select emp_type, count(emp_type),sum(pay), avg(pay), max(pay), min(pay)
from emp2
group by emp_type
having avg(pay) >= 30000000 ;

-- 문제] 최고급여 받는 사람보다 작은 직급
select position, avg(pay), max(pay), min(pay)
FROM professor
group by position
having avg(pay) < 380;

--②숫자함수----------------------------------
select round(12.3456789,0),round(12.7456789,0),round(12.3436789,2),round(12.3456789,2)
from dual;

select ceil(12.34), ceil(-12.34) from dual; --올림 한 후 정수 반환
select floor(12.34), floor(-12.34) from dual;
select trunc(12.3456789,2),trunc(12.7456789,2),trunc(12.3456789,0) from dual;
select * from dept2;

-- 교수테이블에서 월급에 인상률 2%한 결과 출력(소숫점 0으로 처리)
select * from professor;
select name, round(pay*1.02,0) from professor;

update professor
set pay=round(pay*1.02,0);
rollback;

-- 교수테이블에서 모든 교수들에게 보너스 1000을 추가
update professor
set bonus = nvl(bonus,0) + 1000; 

-- ③문자열함수----------------------------
select * from professor;
select id, upper(id) from professor;
select id, initcap(id) from professor;
select id, length(id), length('abcd') from professor;
select * from dept2;
select dname,length(dname),lengthb(dname) from dept2;
select length('사장실') from dual;
select lengthb('사장실') from dual;
select * from gogak;
select jumin, substr(jumin,7,1) from gogak;
select instr('abcd','b') from dual; -- index number : 1부터 시작
select id, instr(id, 'b') from professor;
select instr('abcdefwlfklsnflsfbsfb','b',-1) from dual; -- 1이면 뒤에서부터 찾는다.
select instr('abcdefwlfklsnflsfbsfb','b',-3) from dual;

select lpad('abcd',20,'#') from dual;
select rpad('abcd',20,'@') from dual;
select lpad('한글',10,'#') from dual;

select rpad(lengthb('한글'),10,'$') from dual;
select rpad(length('한글'),10,'$') from dual;

select dname, length(dname), lengthb(dname) from dept2;
select dname, substr(dname,3) from dept2;
select dname, substr(dname,2,3) from dept2;

select rpad(dname, 10, substr('1234567890', length(dname) + 1)) "RPAD연습" from dept2;
select lpad(dname, 10, substr('1234567890', length(dname) + 1)) "LPAD연습" from dept2;

select concat(name, position) || '님'
from professor
where deptno = 101;

select name || position || '님'
from professor;

-- order by
select * from emp2
order by name, deptno desc, pay desc;

-- ppt 2장 실습 : 단일행 함수
