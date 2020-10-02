function y=backsolve(U,b) 
%Test--Comment block
[m,n]=size(U);

for i=m:-1:1    %Reverse order - decrementing starting at m
    temp=b(i);
    for j=(i+1):n  %Forwardsolve: for j=1:(i-1)
        temp=temp-U(i,j)*y(j);
    end
    if U(i,i)==0 && temp==0 %Bad to test for equality.
        y(i)=0;
    elseif U(i,i)==0
        error('Inconsistent')
    else
        y(i)=temp/U(i,i);
    end
end
y=y';
