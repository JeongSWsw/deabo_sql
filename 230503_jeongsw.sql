-- Join ---------------------------------
-- 두개이상의테이블을하나의테이블로만들어한번의검색으로여러컬럼의정보를확인할때사용함.

select * from emp; -- 14
select * from dept;-- 4

select * from emp, dept;

-- inner Join
--select 컬럼명, .....
--from 테이블이름별칭[Inner] join 테이블이름별칭
--on 별칭.컬럼명 = 별칭.컬럼명

select empno, ename, job, d.deptno, loc --테이블명.필드명 호출 dept.deptno, emp.deptno
from emp e, dept d
where e.deptno = d.deptno; --inner join

select empno, ename, job, d.deptno, loc --테이블명.필드명 호출 dept.deptno, emp.deptno
from emp e join dept d
on e.deptno = d.deptno; --inner join
-- join 명령어가 들어갔을 경우, on을 써야함

select empno, ename, job, d.deptno, loc --테이블명.필드명 호출 dept.deptno, emp.deptno
from emp e left outer join dept d -- left outer join : 왼쪽에 있는 데이터 모두, 오른쪽 일치하는 데이터만...
on e.deptno = d.deptno;


select empno, ename, job, d.deptno, loc --테이블명.필드명 호출 dept.deptno, emp.deptno
from dept d left outer join emp e  
on d.deptno = e.deptno;


select empno, ename, job, d.deptno, loc --테이블명.필드명 호출 dept.deptno, emp.deptno
--from emp e right outer join dept d -- right outer join : 오른쪽에 있는 데이터 모두, 왼쪽 일치하는 데이터만...
--on e.deptno = d.deptno;
from dept d right outer join emp e -- right outer join : 오른쪽에 있는 데이터 모두, 왼쪽 일치하는 데이터만...
on d.deptno = e.deptno;

desc emp;
insert INTO emp(empno, ename, sal) values (100, '김연아', 1000);
---------------------------------
select p.name "교수이름", p.position "직위", p.deptno "학과코드", p.profno "교수코드",
s.name "학생이름", s.studno "학번", s.grade "학년", s.deptno1 "주전공학과"
from professor p left outer join student s
on p.profno=s.profno;
select p.name "교수이름", p.position "직위", p.deptno "학과코드", p.profno "교수코드",
s.name "학생이름", s.studno "학번", s.grade "학년", s.deptno1 "주전공학과"
from professor p right outer join student s
on p.profno=s.profno;
---------------------------------

---여러개의테이블조인
--select 컬럼명, .....
--from 테이블이름별칭[Inner] join 테이블이름별칭
--on 별칭.컬럼명= 별칭.컬럼명[Inner] join 테이블이름별칭
--on 별칭.컬럼명= 별칭.컬럼명...

select * from department;

select p.profno, p.name, s.studno, s.name 학생이름, s.grade, d.dname
    from professor p join student s
    on p.profno = s.profno join department d
    on s.deptno1 = d.deptno;
    
select p.profno, p.name, s.studno, s.name 학생이름, s.grade, d.dname
    from professor p left join student s
    on p.profno = s.profno right join department d
    on s.deptno1 = d.deptno;

select p.profno, p.name, s.studno, s.name 학생이름, s.grade, d.dname
    from professor p left join student s
    on p.profno = s.profno left join department d
    on s.deptno1 = d.deptno;

-- 사원이름, 부서이름, 직책, 매니저번호 출력 emp/dept 테이블 이용
select * from emp;
select * from dept;
select e.ename 사원이름 ,d.dname 부서이름, e.job 직책, e.mgr 매니저번호
from emp e left join dept d
on e.deptno = d.deptno;

-- self join 
select * from emp;

select e.empno, e.ename, e.job, em.mgr 담당관리자, em.ename 관리자명
    from emp e join emp em
    on e.mgr = em.empno;
    
create table c_empAll -- 테이블 제약조건은 복사가 안됨!!!
    as select * from emp;
    
select * from c_empAll;
desc emp;
select * from all_constraints --kingsmile 사용자가 갖고있는 전체 제약조건 추출
    where Table_name = 'EMP'; -- 조건에 따른 테이블의 제약조거만 확인 (테이블명 대소문자 구분함)

desc c_empAll;
select * from all_constraints --kingsmile 사용자가 갖고있는 전체 제약조건 추출
    where Table_name = 'c_empAll'; -- 조건에 따른 테이블의 제약조거만 확인 (테이블명 대소문자 구분함)
-- 테이블 제약조건은 복사가 안됨!!!

select * from emp where deptno = 20;
create table c_emp_20
    as select * from emp where deptno=20; -- 조건을 줘서 테이블 복사 가능
select * from c_emp_20;

select * from emp where deptno=30;
create table c_emp_30
    as select empno 사번, ename 사원명, job 직책, sal 급여
    from emp where deptno=30;
    
-- 문제1] 교수테이블에서 전임강사만 뽑아서 테이블 생성
select * from professor;
create table c_professor_1
    as select * from professor where position='전임강사';
select * from c_professor_1;

-- 문제2] emp 테이블에서 mgr가 7566번인 사람만 추출해서 테이블 생성
select * from emp;
create table c_emp_7566
    as select * from emp where mgr=7566;
select * from c_emp_7566;

-- 형식 > 구조물만 복사하길 원할때
--create table 테이블명
--    as select 필드명 ... 
--    from 테이블명 where 1=0; -- 조건 거짓

create table c_emp4
    as select * from emp
    where 1=0;
select * from c_emp4;

create table c_emp5
    as select empno, ename, job, sal from emp;
    
select * from c_empAll; -- 전체 복사
select * from c_emp_20; -- 조건에 맞게 복사
select * from c_emp_30; -- 조건적용, 별칭
select * from c_emp4;   -- 구조물만 복사, 레코드 없음
select * from c_emp5;   -- 원하는 필드에 해당하는 레코드 복사, empno, ename, job, sal

-- 제약조건들은 복사 안됨!!!


-- Union -------- pk / fk 관계 아닌 상태 테이블 합치기
select * from emp
union -- 중복행 제거
select * from c_empAll;

select * from emp
union all -- 중복행 포함
select * from c_empAll;

insert into c_empAll values(7788, 'kingsmile', 'manager', 7566, '2202/01/17' , 5000, 1000, 30);

select * from emp 
union -- 중복행 제거
select * from c_emp5; -- error : 필드개수와 데이터타입이 맞아야함

desc emp;

-- 검색!!!!!!!! 쿼리문은 대소문자 구분 안한다.
-- 단, 레코드는 대소문자 구분한다.
select * from c_empAll;
select * from c_empAll where job='MANAGER';
select * from c_empAll where job='MANAGER' or job='manager';
select * from c_empAll where job!='MANAGER' or job!='manager';
select * from c_empAll where job<>'MANAGER' or job<>'manager';
select * from c_empAll where job in('MANAGER','manager');
select * from c_empAll where job not in('MANAGER','manager');

select empno 사원번호, ename 이름, sal 급여
    from emp
--    where ename = 'FORD'
--    where 이름 = 'FORD'; -- error : 별칭으로 조건 X
    order by 급여 DESC;    -- 별칭으로 정렬 O
    
-- 문제1] c_emp_20, c_emp4 union 결과
select * from c_emp_20
union
select * from c_emp4;

-- 문제2] 사원번호, 이름, 급여 그리고 15%인상된 급여를 정수로 표시하되
-- 컬럼명을 New Salary로 지정하여 출력하라
select * from emp;
select empno 사원번호, ename 이름, sal 급여, round(sal*1.15) "New Salary"
from emp;

select empno 사원번호, ename 이름, sal 급여, cast(sal*1.15 as int) "New Salary"
from emp;

-- 문제3] 2번 문제와 동일한 데이터에서 급여 인상분 ( 새 급여에서 이전 급여를 뺀 값 )
-- 을 추가해서 출력하라 (컬럼명은 increase로 하라)
select empno 사원번호, ename 이름, sal 급여, round(sal*1.15) "New Salary", round(sal*1.15) - sal "increase"
from emp;

-- 문제4] 각 사원의 이름을 표시하고 근무 달 수를 계산하여
-- 커럼명을 Months_Works로 지정하고, 근무 달수를 기준으로 오래된 사람부터 정렬하여 출력
select * from emp;
select ename 사원이름, floor(months_between(sysdate, hiredate)) Months_Works
from emp
order by Months_Works desc;

-- 문제5] 사원의 이름과 커미션을 출력하되
-- 커미션이 책정되지 않은 사원의 커미션은 'no commission'으로 출력
select * from emp;
select ename 사원이름, nvl(comm,'no commission') 커미션
from emp; -- error 
select ename 사원이름, nvl(to_char(comm),'no commission') 커미션
from emp; 
select ename 사원이름, decode(comm, null, 'no commission', comm)
from emp; 