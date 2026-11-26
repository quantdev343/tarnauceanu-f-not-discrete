fval := function(G) local S,H; S:=0; for H in AllSubgroups(G) do S:=S+Size(AutomorphismGroup(H)); od; return S/Size(G); end;
vals := [];
for n in [1..63] do
  for i in [1..NrSmallGroups(n)] do
    G := SmallGroup(n,i);
    if not IsCyclic(G) then
      v := fval(G);
      if v < 13/4 then Add(vals, [v, n, i, StructureDescription(G)]); fi;
    fi;
  od;
od;
Sort(vals);
for x in vals do Print(x[1], "  ", x[2], "#", x[3], "  ", x[4], "\n"); od;
QUIT;
