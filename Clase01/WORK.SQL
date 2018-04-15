
-- BLOQUE ANONIMO

declare
   a number := 5;
   b number := 8;
   c number;
begin
   c := a + b;
   dbms_output.PUT_LINE('A: ' || a);
   dbms_output.PUT_LINE('B: ' || b);
   dbms_output.PUT_LINE('C: ' || c);
end;


-- FUNCION

CREATE OR REPLACE FUNCTION FN_SUMA 
( a NUMBER, b NUMBER )
RETURN NUMBER AS
   c NUMBER;
BEGIN
  -- GUSTAVO
  c := a + b;
  RETURN c;
END FN_SUMA;


select * from USER_source
where TEXT like '%GUSTAVO%';


SELECT FN_SUMA(4,6) SUMA FROM DUAL;


-- PROCEDIMIENTO

CREATE OR REPLACE PROCEDURE SP_SUMA 
( a NUMBER, b NUMBER )
AS
   c NUMBER;
BEGIN
  c := a + b;
  dbms_output.PUT_LINE('A: ' || a);
  dbms_output.PUT_LINE('B: ' || b);
  dbms_output.PUT_LINE('C: ' || c);
END SP_SUMA;

CALL SP_SUMA ( 5, 7 );




-- FUNCION EMPLEADOS

CREATE OR REPLACE FUNCTION FN_CANT_EMPLEADOS 
RETURN NUMBER AS
   N NUMBER;
BEGIN
  SELECT COUNT(*) INTO N FROM EMP;
  RETURN N;
END FN_CANT_EMPLEADOS;


SELECT FN_CANT_EMPLEADOS() FROM DUAL;



CREATE OR REPLACE FUNCTION FN_MAYOR 
( a NUMBER, b NUMBER, C NUMBER )
RETURN NUMBER AS
   m NUMBER := a;
BEGIN
  if( b > m ) then
     m := b;
  end if;
  if( c > m ) then
     m := c;
  end if;
  RETURN m;
END FN_MAYOR;

select FN_MAYOR(-15, -20, -10) from dual;

-- Ejercicio
-- Desarrollar la fuon FN_MENOR para encontrar
-- el menor de tres números.

declare 
  n number := 0;
begin
  loop
    n := n + 1;
    dbms_output.put_line(n || '.- PERU CAMPEON MUNDIAL');
    
    exit when (n = 10);
    
  end loop;
end;


-- Ejercicio
-- Desarrollar una función para calcular el factorial de N. 
-- N es el parámetro de la función.


CREATE OR REPLACE FUNCTION FN_FACTORIAL2
( n number)
RETURN number
IS
  f number :=1;
BEGIN
  FOR cont IN 2 .. n LOOP
    f := f * cont;
  END LOOP;
  return f;
END FN_FACTORIAL2;


select fn_factorial2(7) from dual;

-- ==========================================
-- Ejercicio para la casa
-- ==========================================

/*
Desarrollar un procedimiento que descompomga 
una cantidad de dinero:
- Si el dato es 1268
- El resultado debe ser:
- Billetes de 200: 
- Billetes de 100:
- Billetes de 50: 
- Billetes de 20:
- Billetes de 10:
- Monedas de 5:
- Billetes de 1:
*/

-- ==========================================
-- Ejercicio para la casa
-- ==========================================
/*
- Hacer dos funciones, una parea encontrar el MCD de dos
- números y otra para encontrar el MCM de dos números
*/


