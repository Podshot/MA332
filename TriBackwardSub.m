function [x, status]=TriBackwardSub(A, b)
% Performs back substitution on the given A matrix in relation to the supplied b column vector
% Returns the back substituted values in x, status is always 0 since I wasn't sure which errors 
% the function could encounter
[n,n1]=size(A);
status = 0;
x = b;
for i=(n-1):-1:2
    x(i) = b(i) - A(i,i-1)*x(i+1);
end

end