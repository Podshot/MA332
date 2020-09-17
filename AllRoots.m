function  [r, status] = AllRoots(c,x0,epsilon,maxitr)
temp_roots = [];
q = c;
n = length(c) - 1;
for i = 1:n
    [xbest, pxbext, nitr, qk, status] = NewtonPoly(q, x0, epsilon, maxitr);
    temp_roots = [temp_roots xbest];
    q = qk;
end
r = temp_roots;
status = -100;
end