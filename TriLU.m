function [L,U]=TriLU(A, I)
U = A;
L = I;

[n,n_] = size(A);

for i=1:(n - 1)
    L(i+1,i) = U(i+1,i) / U(i,i);
    U(i+1,i) = U(i+1,i) - L(i+1,i)*U(i,i);
end
end