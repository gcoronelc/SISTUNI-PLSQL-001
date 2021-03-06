CREATE OR REPLACE PROCEDURE PR105 
( P_EMPNO EMP.EMPNO%TYPE )
IS
	TYPE REG IS RECORD(
		NOMBRE EMP.ENAME%TYPE,
		SALARIO EMP.SAL%TYPE
	);
	R REG;
BEGIN
	SELECT ENAME, SAL INTO R
	FROM EMP WHERE EMPNO = P_EMPNO;
	DBMS_OUTPUT.PUT_LINE( 'NOMBRE: ' || R.NOMBRE );
	DBMS_OUTPUT.PUT_LINE( 'SALARIO: ' || R.SALARIO );
END;


SET SERVEROUTPUT ON

CALL PR105( 7698 );

/*
SQL> CALL PR105( 7698 );
NOMBRE: BLAKE
SALARIO: 2850

Llamada terminada.
*/

CALL PR105( 8888 );

/* EL CODIGO NO EXISTE */
/*
SQL> CALL PR105( 8888 );

Llamada terminada.
*/

	
	
CREATE OR REPLACE PROCEDURE PR106
( P_DEPTNO DEPT.DEPTNO%TYPE )
IS
	R DEPT%ROWTYPE;
BEGIN
	SELECT * INTO R
	FROM DEPT WHERE DEPTNO = P_DEPTNO;
	DBMS_OUTPUT.PUT_LINE( 'CODIGO: ' || R.DEPTNO );
	DBMS_OUTPUT.PUT_LINE( 'NOMBRE: ' || R.DNAME );
	DBMS_OUTPUT.PUT_LINE( 'LOCALIZACION: ' || R.LOC );
END;


CALL PR106(10);

/*
SQL> CALL PR106(10);
CODIGO: 10
NOMBRE: ACCOUNTING
LOCALIZACION: NEW YORK

Llamada terminada.
*/


	