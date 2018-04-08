CREATE OR REPLACE FUNCTION FN_FACTORIAL
( n number)
RETURN number
IS
  f number :=1;
  cont number := n;
BEGIN
  while(cont >= 1) LOOP
    f := f * cont;
    cont := cont - 1;
  END LOOP;
  return f;
END FN_FACTORIAL;


select fn_factorial(6) from dual;