function [x,status]=TDMS(A,b)
% Solves the equation "Ax=b" finding the x-value

% Inputs:
% A - A tridiagonal matrix
% b - Vector that relates to the equation "Ax=b"

% Outputs:
% x - The computed solution found for x
% status - The resulting status of the function call
%   0: The function returned successfully
%   1: The inputted A and b values do not have the same number of rows

% Created on 10/18/2020 by
% - Haley Braker
% - Ben Gothard
% - Madison Lindfelt
% - Taryn Perry

[n,m] = size(A);    %size of matrix
lg = length(b);     %length of vector

if n ~= lg
    status = 1;     %set status to 1 is n doesn't equal length(b)
    error("A and b must have the same number of rows")
end

[L,U] = TriLU(A);                       %call TriLU function
[y, y_status] = TriForwardSub(L,b);     %call TriForwardSub function
[x, x_status] = TriBackwardSub(U,y);    %call TriBackwardSub function

if y_status == 0 && x_status == 0
    status = 0;                         %if both Sub functions returned
                                        %successfully, set status  to 0
else
    status = 1;
end

end
