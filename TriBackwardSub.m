function [x, status]=TriBackwardSub(A, b)
[n,n1]=size(A);

x = b;
for i=(n-1):-1:1
    x(i) = b(i) - A(i,i-1)*x(i+1);
end

end