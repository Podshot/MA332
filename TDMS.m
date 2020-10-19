function [x,status]=TDMS(A,b)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

[n,m] = size(A);
lg = length(b);

if n ~= lg
    status = 1;
    warning("A and b must have the same number of rows")
    return
end

[L,U] = TriLU(A);
[y, y_status] = TriForwardSub(L,b);
[x, x_status] = TriBackwardSub(U,y);


end
