
create or replace view SCOTT.v_empleados as
select e.empno, e.ename, d.deptno, d.dname
from emp e inner join dept d
on e.deptno = d.deptno;

create or replace trigger SCOTT.tr_vista
  instead of insert or delete on SCOTT.v_empleados
  for each row
declare
  cuenta number;
begin
  if inserting then
    select count(*) into cuenta from dept where deptno= :new.deptno;
    if cuenta =0 then
      insert into dept(deptno,dname)
      values(:new.deptno, :new.dname);
    end if;
	
    select count(*) into cuenta from emp where empno= :new.empno;
    if cuenta  =0 then
      insert into emp(empno, ename, deptno)
      values(:new.empno, :new.ename, :new.deptno);
    end if;
  elsif deleting then
    delete from emp where empno = :old.empno;
  end if;

end tr_vista;


select * from v_empleados