SQL> select username from dba_users;

SQL> conn scott/tiger
ERROR:
ORA-28000: the account is locked


Advertencia: ¡Ya no está conectado a ORACLE!

SQL> conn system/oracle
Conectado.

SQL> alter user scott identified by tiger account unlock;

Usuario modificado.

SQL> conn scott/tiger
Conectado.

SQL> conn system/oracle
Conectado.
SQL> show parameter name

NAME                       TYPE        VALUE
-------------------------- ----------- --------
db_file_name_convert       string
db_name                    string      orcl
db_unique_name             string      orcl
global_names               boolean     FALSE
instance_name              string      orcl
lock_name_space            string
log_file_name_convert      string
service_names              string      orcl


-- BLOQUE ANONIMO

SQL> set serveroutput on
SQL> declare
  2     a number := 5;
  3     b number := 8;
  4     c number;
  5  begin
  6     c := a + b;
  7     dbms_output.PUT_LINE('A: ' || a);
  8     dbms_output.PUT_LINE('B: ' || b);
  9     dbms_output.PUT_LINE('C: ' || c);
 10  end;
 11  /
A: 5
B: 8
C: 13

Procedimiento PL/SQL terminado correctamente.