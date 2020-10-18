function [x, status]=TriBackwardSub(A, b)
[n,n1]=size(A);
status = 0;
x = b;
for i=(n-1):-1:2
    x(i) = b(i) - A(i,i-1)*x(i+1);
end

end