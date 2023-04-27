create user sw identified by oracle account unlock;
grant connect, resource to sw;

select * from tab;

alter user jeongsw default tablespace users quota unlimited on users;