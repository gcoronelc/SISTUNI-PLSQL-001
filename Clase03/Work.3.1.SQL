
select * from EUREKA.CONTADOR;

select * from EUREKA.EMPLEADO;

select * from EUREKA.ASIGNADO;

172.17.1.144

drop database link tiquillahuanca;

create database link tiquillahuanca
connect to eureka identified by admin
using 'REMOTO';

select * from cuenta@tiquillahuanca;

create or replace public synonym p_cuenta
for eureka.cuenta;


create or replace procedure scott.pr_cursor_01
is
  cursor c_demo is select * from emp;
  r emp%rowtype;
begin
  open c_demo;
  fetch c_demo into r;
  close c_demo;
  dbms_output.put_line('Nombre: ' || r.ename);
end;
/

set serveroutput on

call scott.pr_cursor_01();

create or replace procedure scott.pr_cursor_02
is
  cursor c_demo is select * from emp;
  r emp%rowtype;
begin
  open c_demo;
  loop
    fetch c_demo into r;
    exit when c_demo%notfound;
    dbms_output.put_line('Nombre: ' || r.ename);
  end loop;
  close c_demo;
end;
/

call scott.pr_cursor_02();




create or replace procedure scott.pr_cursor_03
is
  cursor c_demo is select * from emp;
  r emp%rowtype;
begin
  open c_demo;
  fetch c_demo into r;
  while c_demo%found loop
    dbms_output.put_line('Nombre: ' || r.ename);
    fetch c_demo into r;
  end loop;
  close c_demo;
end;
/

call scott.pr_cursor_03();


-- Ejemplo
-- Procedimiento para consultar los movimientos de una cuenta

create or replace procedure eureka.pr_get_movimientos
( p_cuenta in varchar2, p_cursor out SYS_REFCURSOR )
is
begin
    open p_cursor for 
        select * from EUREKA.MOVIMIENTO
        where EUREKA.MOVIMIENTO.chr_cuencodigo = p_cuenta;
end;
/

select * from eureka.movimiento;

declare
    v_cursor SYS_REFCURSOR;
    r eureka.movimiento%rowtype;
begin
    eureka.pr_get_movimientos('00100002', v_cursor);
    loop
        fetch v_cursor into r;
        exit when v_cursor%notfound;
        dbms_output.put_line(r.int_movinumero || ' ' || r.dec_moviimporte);
    end loop;
    close v_cursor;
end;
/


create or replace procedure eureka.pr_get_movimientos2
( p_cuenta in varchar2, p_json out varchar2 )
is
    cursor v_cursor is select * from EUREKA.MOVIMIENTO
        where EUREKA.MOVIMIENTO.chr_cuencodigo = p_cuenta;
    r eureka.movimiento%rowtype;
    v_n number(5) := 0;
begin
    p_json := '[';
    open v_cursor;
    loop
        fetch v_cursor into r;
        exit when v_cursor%notfound;
        if( v_n = 1 ) then
            p_json := p_json || ',';
        end if;
        p_json := p_json || '{';
        p_json := p_json || '"NRO":' || r.int_movinumero || ',"IMPORTE":' || r.dec_moviimporte;
        p_json := p_json || '}';
        v_n := 1;
    end loop;
    close v_cursor;
    p_json := p_json || ']';
end;
/



declare
    v_cuenta varchar2(15) := '00100002';
    v_json varchar2(4000);
begin
    eureka.pr_get_movimientos2(v_cuenta, v_json);
    dbms_output.put_line( v_json );
end;
/




create or replace procedure eureka.pr_get_movimientos3
( p_cuenta in varchar2, p_json out varchar2 )
is
    cursor v_cursor is select * from EUREKA.MOVIMIENTO
        where EUREKA.MOVIMIENTO.chr_cuencodigo = p_cuenta;
    r eureka.movimiento%rowtype;
    v_n number(5) := 0;
begin
    p_json := '[';
    open v_cursor;
    loop
        fetch v_cursor into r;
        exit when v_cursor%notfound;
        if( v_n = 1 ) then
            p_json := p_json || ',';
        end if;
        p_json := p_json || '[';
        p_json := p_json || '"' || r.int_movinumero || '","' ||  r.dec_moviimporte || '"';
        p_json := p_json || ']';
        v_n := 1;
    end loop;
    close v_cursor;
    p_json := p_json || ']';
end;
/



declare
    v_cuenta varchar2(15) := '0010002';
    v_json varchar2(4000);
begin
    eureka.pr_get_movimientos3(v_cuenta, v_json);
    dbms_output.put_line( v_json );
end;
/



create or replace procedure eureka.pr_get_movimientos4
( p_cuenta in varchar2, p_json out varchar2 )
is
    cursor v_cursor is select * from EUREKA.MOVIMIENTO
        where EUREKA.MOVIMIENTO.chr_cuencodigo = p_cuenta;
    v_n number(5) := 0;
begin
    p_json := '[';
    for r in v_cursor loop
        if( v_n = 1 ) then
            p_json := p_json || ',';
        end if;
        p_json := p_json || '[';
        p_json := p_json || '"' || r.int_movinumero || '","' ||  r.dec_moviimporte || '"';
        p_json := p_json || ']';
        v_n := 1;
    end loop;
    p_json := p_json || ']';
end;
/



declare
    v_cuenta varchar2(15) := '00100002';
    v_json varchar2(4000);
begin
    eureka.pr_get_movimientos4(v_cuenta, v_json);
    dbms_output.put_line( v_json );
end;
/






create or replace procedure eureka.pr_get_movimientos5
( p_cuenta in varchar2, p_json out varchar2 )
is
    v_n number(5) := 0;
begin
    p_json := '[';
    for r in (select * from EUREKA.MOVIMIENTO
        where EUREKA.MOVIMIENTO.chr_cuencodigo = p_cuenta) loop
        if( v_n = 1 ) then
            p_json := p_json || ',';
        end if;
        p_json := p_json || '[';
        p_json := p_json || '"' || r.int_movinumero || '","' ||  r.dec_moviimporte || '"';
        p_json := p_json || ']';
        v_n := 1;
    end loop;
    p_json := p_json || ']';
end;
/



declare
    v_cuenta varchar2(15) := '00100002';
    v_json varchar2(4000);
begin
    eureka.pr_get_movimientos5(v_cuenta, v_json);
    dbms_output.put_line( v_json );
end;
/

create or replace procedure scott.pr_inc_salario
( p_empno SCOTT.EMP.empno%type, p_inc SCOTT.EMP.sal%type)
is
begin
    update SCOTT.EMP
    set sal = sal + p_inc
    where empno = p_empno;
    if( SQL%found) then
        commit;
    else
        dbms_output.put_line('NO EXISTE');
    end if;
end;


select * from scott.emp;
call scott.pr_inc_salario(7369, 200);





