function [x, status] = TriForwardSub(L, b)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
[n, n1] = size(arg1);

x = b;
x(1) = b(1);
for i=2:n
    x(i) = b(i) - L(i,i-1)*x(i-1);
end

end