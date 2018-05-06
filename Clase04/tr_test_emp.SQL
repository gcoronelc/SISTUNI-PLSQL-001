CREATE OR REPLACE TRIGGER tr_test_emp
after insert or delete or update on emp
begin
    if inserting then
        DBMS_OUTPUT.PUT_LINE('Nuevo empleado se ha insertado');
    elsif updating then
        DBMS_OUTPUT.PUT_LINE('Nuevo empleado se ha modificado');
    elsif deleting then
        DBMS_OUTPUT.PUT_LINE('Nuevo empleado se ha eliminado');
    end if;
end tr_test_emp;