{Escribir un programa que:
a.Implemente un módulo que genere una lista a partir de la lectura de números enteros. La lectura finaliza con el número -1.
b.Implemente un módulo recursivo que devuelva el mínimo valor de la lista.
c.Implemente un módulo recursivo que devuelva el máximo valor de la lista.
dImplemente un módulo recursivo que devuelva verdadero si un valor determinado se encuentra en la lista o falso en caso contrario.}
program eje4;
const 
    corte=-1;
type
    lista=^nodo;
    nodo=record
        dato:integer;
        sig:lista;
    end;

procedure agregarAdelante (var l:lista; k:integer);
var 
    nue:lista;
begin
    new(nue); nue^.dato:=k; nue^.sig:=l;
    l:=nue;
end;

procedure LeerDatos (var l:lista);
var
    n:integer;
begin
    writeln('ingrese un numero');
    readln(n);
    while n<>corte do begin
        agregarAdelante(l,n);
        writeln('ingrese un numero');
        readln(n);
    end;  
end;

procedure buscarMaximo(a:lista; var max:integer);
begin
  if ((a<>nil) then begin
      if(a^.dato>max)) then  begin
             max:=a^.dato;
        end;
     buscarMaximo(a^.sig,max);
    end;
end;

procedure buscarMinimo(a:lista; var min:integer);
begin
  if (a<>nil) then begin
        if (a^.dato<min) then  begin
            min:=a^.dato;
            buscarMinimo(a^.sig,min);
        end;
    end;
end;


procedure procesarLista (l:lista);
var
    max,min:integer;
begin
    max:=-9999;
    min:=9999;
    buscarMaximo(l,max);
    buscarMinimo(l,min);
    writeln(max);
    writeln('-------------------');
    writeln(min);
end;

function buscarLista(l:lista; dato:integer):boolean;
begin  
    if (l=nil) then
        buscarLista:=false
    else
    if l^.dato=dato then
        buscarLista:=true
    else
        buscarLista:=buscarLista(l^.sig,dato);
end;

var
    l:lista;
    dato:integer;
begin   
    l:=nil;
    LeerDatos(l);
    procesarLista(l);
    readln(dato);
    writeln(buscarLista(l,dato));
end.
