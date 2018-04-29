CREATE OR REPLACE PACKAGE BODY PKG_DEMO AS


function sumar( n1 number, n2 number ) return number
is
	v_suma number;
begin
	v_suma := n1 + n2;
	return v_suma;
end;


-- Todos los empleados
procedure getEmpleados( 
    p_cursor tipo_cursor 
);

-- Empleados de un departamento
procedure getEmpleados( 
    p_deptno EMP.DEPTNO%type,  
    p_cursor out nocopy tipo_cursor 
);

-- Empleados de un departamento
procedure getEmpleados( 
    p_deptno EMP.DEPTNO%type,  
    p_json out nocopy varchar2 
);


END PKG_DEMO;
/