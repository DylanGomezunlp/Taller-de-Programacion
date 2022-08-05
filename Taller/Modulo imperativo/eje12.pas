program ejercicio12;
const
    DIMF=4;
type    
    subrango=1..DIMF;
    venta=record 
        cod:integer;
        fecha:integer;
        sucursal:subrango;
        cantVendida:integer;
    end;
    lista=^nodo;
    nodo=record 
        dato:venta;
        sig:lista;
    end;
    j=record
        tot:integer;
        cod:integer;
    end;
    
    lista2=^nodo2;
    nodo2=record 
        dato:j;
        sig:lista2;
    end;
    
    vventas=array [subrango] of lista;

procedure inicializarListas (var v:vventas);
var 
    i:integer;
begin
    for i:=1 to DIMF do begin   
        v[i]:=nil;
    end;
end;


procedure leerventa (var p:venta);
begin   
    writeln('ingrese el cod de venta:');
    readln(p.cod);
    if (p.cod<>-1) then begin  
        writeln('ingrese la fecha de la venta: ');
        readln(p.fecha);
        writeln('ingrese la sucursal de venta: ');
        readln(p.sucursal);
        writeln('ingrese la cantidad de ventas:');
        readln(p.cantVendida);
    end;
end;

procedure insertarOrdenado(var L:lista; j:venta);
var
  nue: lista; 
  act, ant: lista; 
begin
  new (nue); 
  nue^.dato := j; 
  act := L; 
  ant := L; 
  while( act <> nil)and(j.cod > act^.dato.cod)do 
  begin
    ant := act;
    act:= act^.sig;
  end;
  if (act = ant) then 
    L:= nue
  else 
    ant^.sig:= nue;
  nue^.sig:= act; 
end;


procedure leerlISTAS (var v:vventas);
var
    p:venta;
begin
    leerventa(p);
    while p.cod<>0 do begin
        insertarOrdenado(v[p.sucursal],p);
        leerventa(p);
    end;
end;

procedure imprimirLista (l:lista2);
begin
	while l<>nil do begin
        writeln('para el codigo: ', l^.dato.cod, ' el total de ventas fue: ', l^.dato.tot);
		l:=l^.sig;
end;
end;

Procedure agregarAtras (var pI:lista2; num:j);
Var
  nue,act,ant:lista2;
Begin
  new(nue); 
  nue^.dato:=num; 
  nue^.sig:=nil;
  if (pI = nil) then
    pI:=nue
  else begin
    act:= pI; ant:=pI;
    while (act <> nil) do begin
      ant:=act;
      act:= act^.sig;
    end;
    ant^.sig:= nue;
  end;
End;


procedure procesarVec (v:vventas; var l:lista2);
var
    actual,tot:integer;
    k:j;
    aux:venta;
begin
  minimo(v, aux);
	while (aux.codigo <> 9999) do begin
  	tot := 0;
    actual = aux.codigo;
    while (aux.codigo<> 9999) and (actual=aux.codigo) do 
    begin
            tot:=tot+aux.cant;
            minimo(v, aux);
     end;
     k.cod:=actual;
     k.tot:=tot;
     agregarAtras(l,k);
  end;
end;

var
    v:vventas;
    l:lista2;
begin
    l:=nil;
    inicializarListas(v);
    leerlISTAS(v);
    procesarVec(v,l);
    writeln('----------');
    imprimirLista(l);
end.
