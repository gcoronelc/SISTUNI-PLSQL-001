CREATE OR REPLACE FUNCTION FN_MCD_ITER(num1 NUMBER, num2 NUMBER)
RETURN NUMBER
AS
residuo NUMBER;
mayor NUMBER;
menor NUMBER;
BEGIN
    IF ( num1>num2 )THEN
        mayor := num1;
        menor := num2;
    ELSE
        mayor := num2;
        menor := num1;
    END IF;
    
    WHILE (menor<>0) LOOP
        residuo := MOD(mayor,menor);
        mayor := menor;
        menor := residuo;
     END LOOP;
    
    
  RETURN mayor;
  
END FN_MCD_ITER;


select FN_MCD_ITER(15,20) from dual;



CREATE OR REPLACE FUNCTION FN_MCM(num1 NUMBER, num2 NUMBER)
RETURN NUMBER
AS
mcm NUMBER;
BEGIN
   
    mcm := num1 * num2 / FN_MCD_ITER(num1,num2) ;
    
  RETURN mcm;
  
END FN_MCM;

select FN_MCM(15,20) from dual;


create or replace
PROCEDURE PR_BILLETES
( cantidad number)
IS
  num_200 number;
  num_100 number;
  num_50  number;
  num_20  number;
  num_10  number;
  num_5   number;
  num_2   number;
  num_1   number;
  monto number := cantidad;

BEGIN
  num_200 := TRUNC(monto / 200,0);
  num_100 := TRUNC((monto - 200 * num_200) / 100,0);
  num_50 := TRUNC((monto - 200 * num_200 - 100 * num_100) / 50,0);
  num_20 := TRUNC((monto - 200 * num_200 - 100 * num_100 - 50 * num_50) / 20,0);
  num_10 := TRUNC((monto - 200 * num_200 - 100 * num_100 - 50 * num_50 - 20 * num_20) / 10,0);
  num_5 := TRUNC((monto - 200 * num_200 - 100 * num_100 - 50 * num_50 - 20 * num_20 - 10 * num_10) / 5,0);
  num_2 := TRUNC((monto - 200 * num_200 - 100 * num_100 - 50 * num_50 - 20 * num_20 - 10 * num_10 - 5 * num_5) / 2,0);
  num_1 := TRUNC(monto - 200 * num_200 - 100 * num_100 - 50 * num_50 - 20 * num_20 - 10 * num_10 - 5 * num_5 - 2 * num_2,0);

  dbms_output.put_line('Billetes de 200 =>'  || num_200);  
  dbms_output.put_line('Billetes de 100 =>'  || num_100);
  dbms_output.put_line('Billetes de 50 =>'  || num_50);
  dbms_output.put_line('Billetes de 20 =>'  || num_20);
  dbms_output.put_line('Billetes de 10 =>'  || num_10);
  dbms_output.put_line('Billetes de 5 =>'  || num_5);
  dbms_output.put_line('Billetes de 2 =>'  || num_2);
  dbms_output.put_line('Billetes de 1 =>'  || num_1);
  
END PR_BILLETES; 





















