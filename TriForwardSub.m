function [y, status] = TriForwardSub(L, b)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
[n, m] = size(L);

y = b;
for i=2:n
    y(i) = b(i) - L(i,i-1)*y(i-1);
end

status = 0;

end
