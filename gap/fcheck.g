# f(G) = (1/|G|) * sum over ALL subgroups H<=G of |Aut(H)|  (literal definition)
fval := function(G)
  local S, H;
  S := 0;
  for H in AllSubgroups(G) do
    S := S + Size(AutomorphismGroup(H));
  od;
  return [S, S/Size(G)];
end;
Print("C_{2^n} x C_2 : n, S, f, 3-2^-n, equal?\n");
for n in [1..8] do
  r := fval(AbelianGroup([2^n,2]));
  Print(n, "  ", r[1], "  ", r[2], "  ", 3-2^-n, "  ", r[2]=3-2^-n, "\n");
od;
Print("C_{3^n} x C_3 : n, f, predicted 1+[3*2^2*4 + 4*sum_{j=2}^n 3^(j+1)]/3^(n+1), limit 7\n");
for n in [1..5] do
  r := fval(AbelianGroup([3^n,3]));
  pred := 1 + (3*4*4 + 4*Sum([2..n], j->3^(j+1)))/3^(n+1);
  Print(n, "  ", r[2], "  ", pred, "  ", r[2]=pred, "  ", Float(r[2]), "\n");
od;
Print("Closed form f(C_{p^n} x C_p) = 1 + p(p-1) - (p-1)/p^n : p, n, f, closed form, equal?\n");
for p in [2,3,5] do
  for n in [1..3] do
    r := fval(AbelianGroup([p^n,p]));
    cf := 1 + p*(p-1) - (p-1)/p^n;
    Print(p, "  ", n, "  ", r[2], "  ", cf, "  ", r[2]=cf, "\n");
  od;
od;
Print("Paper Table 1 sanity: \n");
for pr in [["S3",SymmetricGroup(3)],["C3:C4",SmallGroup(12,1)],["C2^2",AbelianGroup([2,2])],
           ["C4xC2",AbelianGroup([4,2])],["D8",DihedralGroup(8)],["D12",DihedralGroup(12)],
           ["A4",AlternatingGroup(4)],["Q8",QuaternionGroup(8)],["Q8xC2",DirectProduct(QuaternionGroup(8),CyclicGroup(2))]] do
  r := fval(pr[2]); Print(pr[1], "  |G|=", Size(pr[2]), "  S=", r[1], "  f=", r[2], "\n");
od;
QUIT;
