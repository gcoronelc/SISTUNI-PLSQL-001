--Antonio Arthur Quispe Javier

create or replace procedure consultaCuenta(p_codigo cuenta.CHR_CUENCODIGO%type)
is
 cont number;
 type reg is record(
    v_nroCuenta cuenta.CHR_CUENCODIGO%type,
    v_descMoneda moneda.VCH_MONEDESCRIPCION%type,
    v_cliente cliente.VCH_CLIENOMBRE%type,
    v_saldo cuenta.DEC_CUENSALDO%type,
    v_movimientos movimiento.INT_MOVINUMERO%type,
    v_nombreSucursal sucursal.VCH_SUCUNOMBRE%type
  );
  r reg;
begin

  select count(*) into cont from cuenta cta
  where cta.CHR_CUENCODIGO= p_codigo;
  
  if(cont=0) then
    raise NO_DATA_FOUND;
  end if;
  
  select cu.CHR_CUENCODIGO, mnd.vch_monedescripcion, cli.vch_clienombre,cu.dec_cuensaldo,
		 CU.INT_CUENCONTMOV,su.vch_sucunombre into r
  from cuenta cu
  join moneda mnd on cu.chr_monecodigo=mnd.chr_monecodigo
  join cliente cli on cu.chr_cliecodigo=cli.chr_cliecodigo
  join sucursal su on cu.chr_sucucodigo = su.chr_sucucodigo  
  where cu.CHR_CUENCODIGO = p_codigo;
  
  dbms_output.put_line(r.v_nroCuenta||', '||r.v_descMoneda||', '||r.v_cliente||
            ', '||r.v_saldo||', '||r.v_movimientos||', '||r.v_nombreSucursal);
exception 
  
	when NO_DATA_FOUND then
		dbms_output.put_line('ERROR: No se encuentra el numero de cuenta');
  
end;

CALL consultaCuenta( '00100002' );


select cu.CHR_CUENCODIGO, mnd.vch_monedescripcion, cli.vch_clienombre,cu.dec_cuensaldo,
		 CU.INT_CUENCONTMOV,su.vch_sucunombre 
from cuenta cu
join moneda mnd on cu.chr_monecodigo=mnd.chr_monecodigo
join cliente cli on cu.chr_cliecodigo=cli.chr_cliecodigo
join movimiento mov on cu.chr_cuencodigo = mov.chr_cuencodigo
join sucursal su on cu.chr_sucucodigo = su.chr_sucucodigo  
where cu.CHR_CUENCODIGO = '00100002';


