program nome2;
{exemplo 2}
var a: real;
var b: integer;
procedure nomep(x: real)
;
var a, c: integer;
begin
read(c, a);
if a<x+c then
begin
a:= c+x;
write(a);
end
else c:= a+x;
end;
begin {programa principal}
read(b);
nomep(b);
end.
