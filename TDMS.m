function [x,status]=TDMS(A,b)
% Solves Ax = b when A is a tridiagonal matrix
% Arguments
%   A - The tridiagonal matrix
%   b - A column vector of the known values of the right-hand side of the equals sign
% Return Values
%   x - The values for the solution to the given Ax = b
%   status - The status value  of the function, always 0 since I wasn't sure what errors might be encountered

status = 0
[n1,n2] = size(A);
I = eye(n1,n2);
[L,U] = TriLU(A,I);
[x, x_status] = TriForwardSub(L,b);
[y, y_status] = TriBackwardSub(U,x);
disp(x);
disp(y);
end