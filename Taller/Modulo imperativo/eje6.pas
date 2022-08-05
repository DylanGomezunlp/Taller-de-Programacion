program ejercicio6;

procedure busquedaDicotomica (v:vector; ini,fin:indice; dato:integer; var pos:indice);
begin
    if ini>fin then
        pos:=-1
    else 
        begin
          pos:=(ini+fin) div 2;
          if (v[pos]<>datp) then
            begin
                if (dato<v[pos]) then
                    busquedaDicotomica(v,ini,pos-1,dato,pos)
                else
                    busquedaDicotomica(v,pos+1,fin,dato,pos);
             end;
        end;
end;