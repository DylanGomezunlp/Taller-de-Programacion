program ejercicio1;
const
	dimf=20;
type
	subrango=1..dimf;//diml PUEDE valer 0
	participante=record
		cod:integer;
		edad:integer;
	end;
	vector= array [subrango] of participante;
	lista=^nodo;
	nodo=record
		dato:participante;
		sig:lista;
	end;
procedure leerParticipante (var p:participante);
begin
	writeln('ingrese el codigo del participante: ');
	readln(p.cod);
	if (p.cod<>-1) then begin
	writeln('ingrese la edad del participante: ');
	readln(p.edad);
	end;
end;
	
procedure cargarVector (var v:vector; var dimL:subrango);
var
	p:participante;
begin
	dimL:=0;
	leerParticipante(p);
	while ((dimL<=dimf) and (p.cod<>-1)) do begin
		dimL:=dimL+1;
		v[dimL]:=p;
		leerParticipante(p);
	end;
end;

procedure imprimirVector (v:vector;	dimL:subrango);
var
	i:integer;
begin
	for i:=1 to dimL do begin
		writeln(v[i].cod,' ',v[i].edad);
	end;
end;

Procedure Ordenar(var v:vector; dimL:subrango); //metodo seleccion

var 
	i,j,p:subrango; dato:participante;
begin
	for i:=1 to dimL-1 do begin 
          p:=i;
          for j:=i+1 to dimL do
             if (v[j].edad<v[p].edad) then p:=j;
         dato:=v[p];   
         v[p]:=v[i];   
         v[i]:=dato;
      end;
end;

function buscardato (v:vector;dimL:integer):integer;
var
	pos,i:integer;
	ok:boolean;
begin
	pos:=-1;
	ok:=false;
	i:=1;
	while ((i<=dimL) and (not ok)) do begin
		if (((v[i].edad=20) or (v[i].edad=21)) or (v[i].edad=22)) then begin //borrar en un rango determinado
			ok:=true;
			pos:=i;
		end
		else
			i:=i+1;
		end;
	buscardato:=pos;
end;
{Procedure EliminarRangoVector(var v:vector; var dl:integer; elimmenor,elimmayor:integer);
//Recibe arreglo y valor, y elimina las apariciones
	var
		auxdl,i,j,pri,ult,dif:integer;
	begin
		i:=1;
		auxdl:=dl;
		while(v[i].edad<elimmenor)and(i<auxdl)do
			i:=i+1;
		pri:=i;
		if(i<>dl)then begin
			while(v[i].edad<elimmayor)and(i<auxdl)do
				i:=i+1;
			ult:=i;
			dif:=ult-pri+1;
			dl:=auxdl-dif;
			for j:=pri to ult do
				v[j]:=v[j+dif];
			writeln('Se han eliminado ',(auxdl-dl),' posiciones del vector.');
		end
		else begin
			if(v[dl].edad>=elimmenor)and(v[dl].edad<=elimmenor)then begin
				dl:=dl-1;
				writeln('Se ha eliminado solo una posicion del vector.');
			end
			else
				writeln('No se han eliminado posiciones del vector.');
		end;
	end; solucion correcta con algunos problemas}
procedure borrardatoEnVector (var v:vector; var ok:boolean; var diml:subrango);
var
	i,pos:integer;
begin
	pos:=buscardato(v,dimL);
	if (pos=-1) then
		writeln('el elemento no esta en el vector');
	while (pos<>-1) do begin
		ok:=false;
		if ((pos>=1) and (pos<=diml)) then begin
			for i:=pos to diml-1 do
				v[i]:=v[i+1];
			ok:=true;
			diml:=diml-1;
		end;
		pos:=buscardato(v,dimL);
	end;
end;
procedure imprimirLista(L:lista);
begin
	while l<>nil do begin
		writeln(l^.dato.edad);
		l:=l^.sig;
	end;
end;

procedure InsertarOrdenado (var L:lista; v:vector; dimL:subrango);
var
	nuevo,actual,ant:lista;
	i:integer;
begin
    for i:=1 to dimL do begin
    new(nuevo); nuevo^.dato:=v[i];
    actual:=L;
    ant:=L;
    while (actual<>nil) and (v[i].edad>actual^.dato.edad) do begin
        ant:=actual;
        actual:=actual^.sig;
    end;
    if (actual=ant)then begin
        L:=nuevo;
    end else
        ant^.sig:=nuevo;
    nuevo^.sig:=actual;
    end;
end;

var
 L:lista;
 v:vector;
 dimL:subrango;
 ok:boolean;
begin
	cargarVector(v,dimL);
	imprimirVector(v,diml);
	Ordenar(v,diml);
	imprimirVector(v,diml);
	borrardatoEnVector(v,ok,dimL);
	imprimirVector(v,diml);
	insertarOrdenado(L,v,diml);//como ya esta ordenado va un agregar atras, otra forma ya que es un vector, recorrer con un downto e insertar adelante
	imprimirLista(L);
end.
	
