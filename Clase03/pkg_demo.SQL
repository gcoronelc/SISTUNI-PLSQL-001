CREATE OR REPLACE PACKAGE PKG_DEMO AS

type tipo_cursor is REF CURSOR;

-- Agregar procedimiento para
-- consultar los empleados de
-- un departamento

function sumar( n1 number, n2 number ) return number;

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

