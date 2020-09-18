function [xbest,pxbest,nitr,q,status] = NewtonPoly(c,x0,epsilon,maxitr,loud)
%NewtonPoly: Uses Newton's method to find root of polynomial
%   This function uses Newton's method to find a root of a polynomial. The
%   polynomial coeffiecents are input by the user in 'c' and an initial
%   guess is stored in 'x0'. Author: Taryn Perry. Date: 09/15/2020.

% Require first 4 inputs from user
if nargin < 4
    error('Not Enough Inputs Specified')
end

% Set default value for 'loud' if it is not provided
if nargin < 5
    loud = 0;
end

% Initial values
xbest = x0;
pxbest = Horner(c,x0);
nitr = 0;
q = c;


% Take derivative of polynomial with coefficients 'c' and store in 'cprime'
% Horners Method can now evaluate 'cprime' as a polynomial as well, since
% the derivative is a polynomial.
l = length (c);

cprime = zeros(1,l-1);
count = l-1;

for i = 1:l-1
    cprime(i) = count*c(i);
    count = count - 1;
end

% Verify that 'epsilon' and 'maxitr' are both greater than 0
if maxitr <= 0
    status = 2;
    fprintf('"maxitr" must be greater than 0')
    return
end

if epsilon <= 0
    status = 2;
    fprintf('"epsilon" must be greater than 0')
    return
end

for i = 0:maxitr
    afx = abs(pxbest);
    nitr = i;
        
    if loud == 1
    fprintf('Itr:%d x:%.2f |f(x)|:%.2e\n',nitr,x0,afx)
    end
  
    if afx < epsilon
        status = 0;
        % Synthetic Division
        div = [1 -xbest];
        [q,r] = deconv(c,div);
        return
    end
    
    pxprime = Horner(cprime,x0);
    
    if pxprime == 0
        status = 1;
        fprintf('p''(%.2f) = 0',x0)
        return
    end
    
    % Iterate x0 using Newton's Method
    xbest = x0 - (pxbest/pxprime);
    x0 = xbest;
    % Evaluate polynomial at new 'xbest' value
    pxbest = Horner(c,xbest);
    
end

status = 1;

        % Synthetic Division
        div = [1 -xbest];
        [q,r] = deconv(c,div);

end
