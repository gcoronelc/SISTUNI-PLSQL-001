create or replace function fn_mcm(a number,b number) return number
as 
    mcm number:=1;
    i number;
    num1 number;
    num2 number;
begin   
    i:=2; 
    num1 := a;
    num2 := b;
    
    while (i<=num1 or i<= num2)
    loop
        if mod(num1,i)=0 or mod(num2,i)=0  then
            mcm := mcm*i;
            if(mod(num1,i)=0) then
                num1:= num1/i;
            end if;
            if(mod(num2,i)=0) then
                num2:= num2/i;
            end if;
        else
           i:=i+1;
        end if;
    end loop;
    return mcm;
    --dbms_output.put_line('El MCM de'||num1||' y '||num2||' es:'||mcm);
end fn_mcm;

select fn_mcm(15,20) from dual;

