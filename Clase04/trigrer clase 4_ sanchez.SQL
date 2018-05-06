create or replace trigger tr_test_temp
after insert or delete or update on emp
begin
    if inserting then 
        dbms_output.put_line('nuevo empleado se ha insertado');
    elsif updating then
        dbms_output.put_line('un empleado se ha modificado');
    elsif deleting then
        dbms_output.put_line('un empleado se ha eliminado');
    end if;
end tr_test_temp;