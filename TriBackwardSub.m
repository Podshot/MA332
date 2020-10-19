function [x, status]=TriBackwardSub(U,y)
% Solves the system for x using backward substition on a triangular matrix

% Inputs:
% U - upper triangular matrix containing the coefficients of the system
% y - vector containing the right sides of the equations

% Outputs:
% x - vector of system solutions
% status - The resulting status of the function call
%   0: The function returned successfully

% Created on 10/18/2020 by
% - Haley Braker
% - Ben Gothard
% - Madison Lindfelt
% - Taryn Perry

[n,m]=size(U);  %size of matrix

x = y;                  %initialize x
x(n) = y(n)/U(n,n);     %update x vector values

for i= (n-1):-1:1
    x(i) = (y(i)- U(i,i+1)*x(i+1))/U(i,i);      %update x vector values
end

status = 0;     %set status to 0

end
