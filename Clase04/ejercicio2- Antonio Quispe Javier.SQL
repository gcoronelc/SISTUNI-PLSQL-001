
create table Sal_History(
  EmpNo number(4) not null,
  SalOld number(7,2) null,
  SalNew number(7,2) null,
  StartDate  date not null,
  SetUser varchar2(30) not null
);

/*----------------------------------*/
create or replace trigger tr_updateEmpSal
after insert or update on emp
for each row
begin
  insert into sal_history(EMPNO,SALOLD,SALNEW,STARTDATE,SETUSER)
  values(:new.empno, :old.sal, :new.sal , sysdate, USER);
end tr_updateEmpSal;



update emp set sal=3500 where empno=7369;

