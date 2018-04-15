create or replace function fn_mcd(a number,b number) return number
as 
    mcd number;    
    menor number;
    mayor number;
    num1 number;
    num2 number;
begin     
    num1 := a;
    num2 := b;
    
    if num1 > num2 then 
       mayor := num1;
       menor := num2;
    else
       mayor := num2;
       menor := num1;
    end if;
            
    for i in 1 .. menor
    loop
        if mod(num1, i)=0 and mod(num2, i)=0 then
            mcd := i;
        end if;
    end loop;

    return mcd;
    
end fn_mcd;


select fn_mcd(15,20) from dual;

