function x=backsolvetest(L,U,b,pvector) 
% This function solves Ax = b after A has been factored into LU up to permutation by p.
%
% The input arguments are
% L - A square lower triangular square matrix L with ones on the main diagonal. 
% U - An upper triangular matrix U. L and U are not assumed to have consistent dimensions. 
% p - A permutation vector p. It is assumed that LU = A(p,:). 
% b - The right-hand side vector in Ax = b, b is not assumed to have consistent dimensions with A.
%
% The output arguments are
% x - A solution x to Ax = b if the problem is consistent.
% status - A status variable encoded as follows:
%   status 0: Ax = b is consistent with a unique solution. 
%   status 1: Ax = b is consistent with an in?nite number of solutions, in which case a solution to Ax = b is returned in x. 
%   status 2: Ax = b is inconsistent. status 3: The function failed for some other reason, such as input arguments with inconsistent dimensions.

[m,n]=size(U);
[o,p]=size(L);

y=zeros([p 1]);
x=zeros([n 1]);

%assert(m == n); % assert whether A is square matrix
%assert(o == n);

for i=pvector    % Forward Solver - decrementing starting at m
    temp=b(pvector(i));
    for j=1:(i-1)  
        temp=temp-L(pvector(i),j)*y(j);
    end
    if L(i,i)==0 && temp==0 % Bad to test for equality.
        y(i)=0;
    elseif L(i,i)==0
        error('Inconsistent')
    else
        y(i)=temp/L(i,i);
    end
end
% y=y';

for i=m:-1:1    % Backsolver - decrementing starting at m
    temp=y(i);
    for j=(i+1):n  
        temp=temp-U(i,j)*x(j);
    end
    if U(i,i)==0 && temp==0 % Bad to test for equality.
        x(i)=0;
    elseif U(i,i)==0
        error('Inconsistent')
    else
        x(i)=temp/U(i,i);
    end
end
% x=x';
    


