function [y, status] = TriForwardSub(L, b)
% Solves the system for x using forward substition on a triangular matrix

% Inputs:
% L - lower triangular matrix containing the coefficients of the system
% b - vector containing the right sides of the equations

% Outputs:
% y - vector of system solutions
% status - The resulting status of the function call
%   0: The function returned successfully

% Created on 10/18/2020 by
% - Haley Braker
% - Ben Gothard
% - Madison Lindfelt
% - Taryn Perry

[n, m] = size(L);   %size of matrix

y = b;      %initialize y
for i=2:n
    y(i) = b(i) - L(i,i-1)*y(i-1);  %update y vector values
end

status = 0;     %set status to 0

end
