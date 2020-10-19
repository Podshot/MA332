function [L,U]=TriLU(A)
% Creates upper and lower triangular matrices from input matrix A

% Inputs:
% A - matrix containing the coefficients of the system

% Outputs:
% L - lower triangular matrix
% U - upper triangular matrix

% Created on 10/18/2020 by
% - Haley Braker
% - Ben Gothard
% - Madison Lindfelt
% - Taryn Perry

[n,m] = size(A);    %size of matrix
U = A;              %initialize U matrix
L = eye(n,m);       %initialize L matrix

for i=1:(n - 1)
    L(i+1,i) = U(i+1,i) / U(i,i);                   %update L matrix values
    U(i+1,i) = U(i+1,i) - L(i+1,i)*U(i,i);          %update U matrix values
    U(i+1,i+1) = U(i+1,i+1) - L(i+1,i)*U(i,i+1);
end

end
