function [x, status] = TriForwardSub(L, b)
% Performs forward substitution on the given L matrix in relation to the supplied b column vector
% Returns the forward substituted values in x, status is always 0 since I wasn't sure which errors 
% the function could encounter
[n, n1] = size(L);
status = 0;
x = b;
x(1) = b(1);
for i=2:n
    x(i) = b(i) - L(i,i-1)*x(i-1);
end

end