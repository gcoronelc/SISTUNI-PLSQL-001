CREATE OR REPLACE TRIGGER tr_test_emp
AFTER INSERT OR DELETE OR UPDATE ON emp
--FOR EACH ROW
BEGIN
  IF INSERTING THEN
    dbms_output.put_line( 'Nuevo empleado insertado' );
  ELSIF UPDATING THEN 
    dbms_output.put_line( 'Un empleado modificado' );
    dbms_output.put_line( 'El sueldo ha cambiado de ' || :old.sal || ' a ' || :new.sal );    
  ELSIF UPDATING THEN
    dbms_output.put_line( 'Un empleado eliminado' );
  END IF;
END;


-- Prueba:
SET serveroutput ON;

UPDATE emp
SET   sal = 1000;                -- 800




