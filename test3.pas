program nome1;
{exemplo 1}
var a, a1, b: integer;
begin
read(a);
a1:= a1*2;
while (a1>0) do
begin
write(a1);
a1:= a1-1;
end;
for b:=1 to 10 do
begin
b:=b+2;
a:=a-1;
end;
if a<> b then write(a);
end.
