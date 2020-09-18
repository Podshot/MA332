function [r, status] = AllRoots(c,x0,epsilon,maxitr,loud)
%AllRoots: This function attempts to find all roots of a polynomial.
%   This function uses Newton's Method to identify a root of the polynomial
%   whose coefficents are input as 'c'. After a root is identified, the
%   function uses deflation to form a new polynomial to replace 'c'
%   in the next iteration. This repeats, calling Newtons' Method until all roots
%   are found. Status = 0 indicates success. Status = 1 indicates that
%   Newton's Method failed. Status = 2 is reserved for other failure of the
%   function. User inputs 'epsilon' and 'maxitr' are the convergence
%   criteria and maximum iterations, respectively, used in Newton's Method.
%   Authors: Haley Braker, Ben Gothard, Madison Lindfelt, Taryn Perry
%   Date: 09-17-2020.

if nargin < 4
    error('Not Enough Inputs')
end

if nargin < 5
    loud = 0;
end

if epsilon <= 0 || maxitr <= 0
    error('''epsilon'' and ''maxitr'' must be greater than 0')
end

if isreal(x0)
    warning('x0 must have an imaginary component');
end

l = length(c) - 1;
r = zeros(1,l);    
status = 0;

for i = 1:l
    [xbest,pxbest,nitr,q,stat] = NewtonPoly(c,x0,epsilon,maxitr,loud);
    % 'status' defaults to zero. If NewtonPoly returns a status of 1, this will fill status as the new value.
    if stat > status
    status = stat;
    end
    
    % 'r' is array of roots found
    r(i) = xbest;
    
    % Set next polynomial using "deflated" polynomial from NewtonPoly
    c = q;

end

