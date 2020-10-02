function [L,U,p] = LUfact(A)
[n,n1] = size(A);   %size of matrix
L=eye(n,n1);    %initialize L matrix
w=eye(n,n1);    %initialize w matrix
p=eye(1,n1);    %initialize p vector
U=A;            %initialize U matrix

if n<n1     %choose iteration variable if non-square matrix
    a=n;
else
    a=n1;
end

for j=1:a
  [pivot m] = max(abs(U(j:n, j)));     
  m=m+j-1;
  if m~=j   %if unequal
    U([m,j],:)=U([j,m],:);   %switch rows in U
    w([m,j],:)=w([j,m],:);   %switch rows in w
    if j>=2   
      L([m,j],1:j-1)=L([j,m],1:j-1);   %switch rows in L
    end
  end
  for i=j+1:n      
    L(i,j)=U(i,j)/U(j,j);   %update L matrix values
    U(i,:)=U(i,:)-L(i,j)*U(j,:);    %update U matrix values
  end
end

v=1;
for k=1:n       %run through w matrix to create permutation vector
    for v=1:n1
        if w(k,v)==1
           p(k)=v;
        end
    end
end