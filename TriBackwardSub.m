function [x, status]=TriBackwardSub(U,y)

[n,m]=size(U);

x = y;
x(n) = y(n)/U(n,n);

for i= (n-1):-1:1
    x(i) = (y(i)- U(i,i+1)*x(i+1))/U(i,i);
end

status = 0;

end
