select deptno, position, sum(pay)
from professor
group by position, rollup(deptno);

select deptno, position, sum(pay)
from professor
group by deptno, rollup(position);

select deptno, position, count(*), sum(pay)
from professor
group by cube(deptno, position);
------------------------------
select * from professor;
insert into professor
values(1004,'조','c','정교수',550,to_date('1980-06-23','YYYY-MM-DD'),100,101,'captain@abc.net','http://www.abc.net');

select deptno, position, count(*) , sum(pay)
from professor
group by rollup(deptno, position);

select deptno, position,count(*), sum(pay)
from professor
group by position, rollup(deptno);