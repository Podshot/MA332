function [L,U,p]=LUfact(A)
[m,n]=size(A);
L=eye(m,n);
p=eye(1,m);
U=A;

for i=1:n
    [pivot b]=max(abs(U(i:m,i)));
    b=b+i-1;
    if b~=i
        t1=U(i,:);
        U(i,:)=U(b,:);
        U(b,:)=t1;
        t2=p(i,:);
        p(i,:)=p(b,:);
        p(b,:)=t2;
    if i>=2
    %    t3=L(i,1:i-1);
    %    L(i,1:i-1)=L(b,1:i-1);
    end
end
    for a=i+1:n
        L(a,i)=U(a,i)/U(i,i);
        U(a,:)=U(a,:)-L(a,i)*U(i,:);
    end
end
c=1;
%fprintf('a');
