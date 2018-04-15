CREATE OR REPLACE
PROCEDURE P_REPORTE_CUENTA (n_cuenta in eureka.CUENTA.CHR_CUENCODIGO%type) AS
  type registro is record(
    cuenta eureka.CUENTA.CHR_CUENCODIGO%type,
    moneda eureka.MONEDA.VCH_MONEDESCRIPCION%type,
    cliente varchar2(400),
    saldo eureka.cuenta.DEC_CUENSALDO%type,
    cant_mov eureka.cuenta.INT_CUENCONTMOV%type,
    sucursal eureka.SUCURSAL.VCH_SUCUNOMBRE%type
  );
  reg registro;
BEGIN
  
  select cuenta.CHR_CUENCODIGO num_cuenta,
         moneda.VCH_MONEDESCRIPCION moneda,
         cliente.VCH_CLIEPATERNO||cliente.VCH_CLIEMATERNO||cliente.VCH_CLIENOMBRE Nombre,
         cuenta.DEC_CUENSALDO saldo,
         cuenta.INT_CUENCONTMOV movimiento,
         sucursal.VCH_SUCUNOMBRE sucursal
  into reg
  from cuenta  
  join moneda on (cuenta.CHR_MONECODIGO = moneda.CHR_MONECODIGO)
  join cliente on (cuenta.CHR_CLIECODIGO = cliente.CHR_CLIECODIGO)
  join sucursal on (cuenta.CHR_SUCUCODIGO = sucursal.CHR_SUCUCODIGO)
  where cuenta.CHR_CUENCODIGO = n_cuenta;
  
  dbms_output.PUT_LINE('cuenta '||reg.cuenta);
  dbms_output.PUT_LINE('moneda '||reg.moneda);
  dbms_output.PUT_LINE('cliente '||reg.cliente);
  dbms_output.PUT_LINE('saldo '||reg.saldo);
  dbms_output.PUT_LINE('cant_mov '||reg.cant_mov);
  dbms_output.PUT_LINE('sucursal '||reg.sucursal);

exception 
  when no_data_found then
    dbms_output.PUT_LINE('numero de cuenta incorrecto');
END P_REPORTE_CUENTA;


CALL P_REPORTE_CUENTA( '00100001' );

