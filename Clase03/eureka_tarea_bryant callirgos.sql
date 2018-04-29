set SERVEROUTPUT ON

select* from Empleado;
select* from Sucursal;
select* from Asignado;
select* from TipoMovimiento;
select* from Cliente;
select* from Moneda;
select * from Cuenta;
select* from Movimiento;
select* from Parametro;
select* from InteresMensual;
select* from CostoMovimiento;
select* from CargoMantenimiento;
select* from Contador;


----------------------------------------------------
Ejercicio 2:
----------------------------------------------------

select owner, name, type
  from all_dependencies
 where referenced_owner = 'eureka'
   and referenced_name = 'CargoMantenimiento'



Utilizando la base de datos EUREKA, desarrollar 
un procedimiento para crear una cuenta.

El analista funcional ha solicitado al programador
que verifique que el empleado se encuentre activo
para proceder con el registro.

El procedimiento debe retornar el número de cuenta.

create or replace procedure crear_cuenta ()


----------------------------------------------------
Ejercicio 3:
----------------------------------------------------

Utilizando la base de datos EUREKA, desarrollar 
un procedimiento registrar un nuevo empleado.



select* from Empleado;

create or replace procedure Nuevo_empleado 
(
       v_chr_emplcodigo       CHAR,
       vch_emplpaterno      VARCHAR,
       vch_emplmaterno      VARCHAR,
       vch_emplnombre       VARCHAR,
       vch_emplciudad       VARCHAR,
       vch_empldireccion    VARCHAR,
       vch_emplusuario      VARCHAR,
       vch_emplclave        VARCHAR
       
)
as
v_codigo_nuevo char(10);
begin

insert into Empleado values ( v_chr_emplcodigo,vch_emplpaterno      ,vch_emplmaterno      ,vch_emplnombre       ,
vch_emplciudad       ,vch_empldireccion    , vch_emplusuario      ,vch_emplclave      );
commit;
dbms_output.put_line('el empleado a sido agregado correctamente');
select max(chr_asigcodigo) into v_codigo_nuevo from Asignado;
insert into Asignado 
select (v_codigo_nuevo + 1) as chr_asigcodigo,b.CHR_SUCUCODIGO , a.chr_emplcodigo, sysdate as  dtt_asigfechaalta, null as DTT_ASIGFECHABAJA
from Empleado A
left join sucursal b on b.vch_sucuciudad=a.vch_emplciudad
where b.int_sucucontcuenta<>0 and a.chr_emplcodigo=v_chr_emplcodigo;
commit;
  Exception
when no_data_found then
DBMS_OUTPUT.PUT_LINE ('el codigo no existe: ');
end;


begin
  Nuevo_empleado('0010','callirgos','cardenas','bryant','Lima','mz Jv', 'admi','mudo');
end;
show error




----------------------------------------------------
Ejercicio 4:
----------------------------------------------------

Utilizando la base de datos EUREKA, desarrollar 
un procedimiento rotar a un empleado de una 
sucursal a otra.

create or replace PROCEDURE rotar_empleado (p_codemp Empleado.CHR_EMPLCODIGO%TYPE, p_destino ASIGNADO.CHR_SUCUCODIGO%type)
is
--v_chr_asigcodigo char(6),
v_chr_sucucodigo CHAR(3);
v_chr_emplcodigo CHAR(4);--,
V_DTT_ASIGFECHALTA DATE; 
v_DTT_ASIGFECHABAJA DATE;
vv_chr_emplcodigo CHAR(4);
v_VCH_SUCUCIUDAD varchar2(30);
BEGIN


  select MAX(DTT_ASIGFECHAALTA),CHR_EMPLCODIGO INTO V_DTT_ASIGFECHALTA, v_chr_emplcodigo
  from Asignado
WHERE chr_emplcodigo=p_codemp
GROUP BY CHR_EMPLCODIGO;



select  DTT_ASIGFECHABAJA into v_DTT_ASIGFECHABAJA from Asignado
WHERE chr_emplcodigo=p_codemp AND DTT_ASIGFECHAALTA=V_DTT_ASIGFECHALTA;



  IF (v_DTT_ASIGFECHABAJA  IS NULL) THEN
  update Asignado set (chr_sucucodigo) = (p_destino)
  WHERE chr_emplcodigo=p_codemp AND DTT_ASIGFECHAALTA=V_DTT_ASIGFECHALTA;
  COMMIT;
  
  select distinct chr_emplcodigo, chr_sucucodigo into v_chr_emplcodigo , v_chr_sucucodigo from Asignado
  where CHR_EMPLCODIGO=p_codemp AND DTT_ASIGFECHAALTA=V_DTT_ASIGFECHALTA;
  dbms_output.put_line('el codigo del empleado es: '|| v_chr_emplcodigo);
  dbms_output.put_line('el destino es: '|| v_chr_sucucodigo);
  
  select a.chr_emplcodigo,c.VCH_SUCUCIUDAD into vv_chr_emplcodigo, v_VCH_SUCUCIUDAD
  from Empleado a
  left join Asignado b on a.chr_emplcodigo=b.chr_emplcodigo
  left join sucursal c on c.CHR_SUCUCODIGO=b.CHR_SUCUCODIGO
  where a.chr_emplcodigo=p_codemp   AND b.DTT_ASIGFECHAALTA=V_DTT_ASIGFECHALTA;
  
  update Empleado set VCH_EMPLCIUDAD=v_VCH_SUCUCIUDAD
  where chr_emplcodigo=p_codemp;
  commit;

dbms_output.put_line('La ciudad que ahora corresponde es: '|| v_VCH_SUCUCIUDAD);

ELSIF (v_DTT_ASIGFECHABAJA is not null )then
DBMS_OUTPUT.PUT_LINE ('EL EMPLEADO YA NO TRABAJA');
end if;
  Exception
when no_data_found then
DBMS_OUTPUT.PUT_LINE ('el codigo no existe: ');
END;




