Program ejercicio7;

procedure numAbinario (n:integer);
begin   
    if n>1 then
        begin
            numAbinario(x div 2);
            writeln(x mod 2);
        end
    else    
        write('1');
end;

