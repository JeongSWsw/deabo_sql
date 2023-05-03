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