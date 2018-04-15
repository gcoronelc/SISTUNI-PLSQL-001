create or replace procedure descBilletes(cantidad number)
is 
     mensaje varchar2(500);
     digits  number;
     n200    number:=0;
     n100    number:=0;
     n50     number:=0;
     n20     number:=0;
     n10     number:=0;
     n5      number:=0;
     n2      number:=0;
     n1      number:=0;
     n05     number:=0;
     billete number;
begin
     digits := length(to_char(cantidad));
     billete := cantidad;
     mensaje:=cantidad||',contiene los siguientes billetes:';
      if(billete>=200) then
         n200 := trunc(billete/200);
         billete := mod(billete, 200);   
         mensaje := mensaje||'Billetes de 200: '||n200||', ';
      end if;
      if(billete>=100) then
         n100 := trunc(billete/100);
         billete := mod(billete, 100);
         mensaje := mensaje||'Billetes de 100: '||n100||', ';
      end if;
      if(billete>=50) then
         n50 := trunc(billete/50);
         billete := mod(billete, 50);
         mensaje := mensaje||'Billetes de 50: '||n50||', ';
      end if;
      if(billete>=20) then
         n20 := trunc(billete/20);
         billete := mod(billete, 20);
         mensaje := mensaje||'Billetes de 20: '||n20||', ';
      end if;
      if(billete>=10) then
         n10 := trunc(billete/10);
         billete := mod(billete, 10);
         mensaje := mensaje||'Billetes de 10: '||n10||', ';
      end if;
      if(billete>=5) then
         n5 := trunc(billete/5);
         billete := mod(billete, 5);
         mensaje := mensaje||'Billetes de 5: '||n5||', ';
      end if;
      if(billete>=2) then
         n2 := trunc(billete/2);
         billete := mod(billete, 2);
         mensaje := mensaje||'Billetes de 2: '||n2||', ';
      end if;
      if(billete>=1) then
         n1 := trunc(billete/1);
         billete := mod(billete, 1);
         mensaje := mensaje||'Billetes de 1: '||n1||', ';
      end if;
          
      dbms_output.put_line(mensaje);
      
end descBilletes;

