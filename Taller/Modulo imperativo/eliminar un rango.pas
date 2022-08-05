{procedure eliminarParticipantes(var v:vec; var dimL:integer; valor1:integer; valor2:integer);
var
  posicion, i, cant : integer;
begin
  
  cant := 0;
  i := 1;  
  {busco al primer participante de 20 años o mas}{
  while ((i <= dimL) and (v[i].edad < valor1 )) do 
	i := i +1;
  
  posicion:= i;
  while (i <= dimL) and (v[i].edad <=valor2 ) do
	i := i + 1;

  { vamos a eliminar a todos los parcipantes entre las posiciones posicion e i del vector V }{	  
  cant := i - posicion;
  for i := (posicion+cant) to dimL do
     v[i-cant] := v[i];
	  
  dimL := dimL - cant;
	  
end}
