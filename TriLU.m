function [L,U]=TriLU(A)

[n,m] = size(A);
U = A;
L = eye(n,m);

for i=1:(n - 1)
    L(i+1,i) = U(i+1,i) / U(i,i);
    U(i+1,i) = U(i+1,i) - L(i+1,i)*U(i,i);
    U(i+1,i+1) = U(i+1,i+1) - L(i+1,i)*U(i,i+1);
end

end
