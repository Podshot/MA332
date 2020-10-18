function [x,status]=TDMS(A,b)
[n1,n2] = size(A);
I = eye(n1,n2);
[L,U] = TriLU(A,);
[x, x_status] = TriForwardSub(L,b);
[y, y_status] = TriBackwardSub(U,x);
end