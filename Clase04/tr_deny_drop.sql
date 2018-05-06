create or replace trigger tr_deny_drop
before drop on schema
begin
  raise_application_error(-20000,'No es posible borrar objetos');
end;