create or replace
function f_calcular_factorial
(n in number) 
return number as 
  n_resultado number:= 1; 
  m_cantidad number:= n;
begin
  while (m_cantidad > 1) loop
    n_resultado := n_resultado * m_cantidad;
    m_cantidad := m_cantidad-1;
  end loop;
  return n_resultado;
end;


