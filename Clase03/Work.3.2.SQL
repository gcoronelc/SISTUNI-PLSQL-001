create or replace procedure pr_demo01
(p_Raise in boolean, p_dato out varchar2)
is
	Excep1 Exception;
begin
	p_dato := 'PERU CAMPEON';
	if p_Raise then
		raise Excep1;
	else
		return;
	end if;
end;

declare
	v_dato varchar2(200) := 'Alianza Campeon';
begin
	pr_demo01( true, v_dato );
	dbms_output.put_line( v_dato );
exception
	when others then
		dbms_output.put_line( v_dato );
end;


