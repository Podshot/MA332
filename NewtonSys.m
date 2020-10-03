function [x, nrmfx, numitr, status]=NewtonSys(f, df, x0, epsilon, maxiter)
% Solves the nonlinear system (f(x) = 0) using Newton's method

% Inputs:
% f - A function handle that defines f(x), returns a Nx1 column vector
% df - A function handle that defines Dxf(v). Returns an NxN square matrix
%   with dimensions consistent with f(v)
% x0 - A column vector of initials guesses for f(x) = 0
% epsilon - The termination tolerance. The function will return when
%   |f(xn)| < epsilon
% maxiter - The iteration limit

% Outputs:
% x - The computed solution found for x
% nrmfx - The value of |f(x)| at the found computed solution
% numitr - The number of iterations that the solution took to compute
% status - The resulting status of the function call
%   0: The function returned successfully
%   1: The function reach the iteration limit before the termination
%       tolerance was reached
%   2: Another problem was encountered

if iscolumn(x0) == 0
    warning('x0 must be a column vector')
    status = 2;
    x = -1;
    nrmfx = -1;
    numitr = 0;
    return;
else
    status = 1;
    numitr = 0;
    
    for i = 1:maxiter
        
        fx = feval(f, x0); % Eval f at our current guess
        dfx = feval(df, x0); % Eval df at out current guess
        
        [L, U, p] = LUfact(dfx);
        [v, bstatus] = backsolve(L, U, -fx, p); 
        % Solves J*s = -f where J is the jacobian and s is the step
        
        x0 = x0 + v; 
        % x(k+1) = x(k) + s -> x(k+1) = x(k) + (x(k+1) - x(k)) -> x(k+1) =
        % `x(k+1)

        nrmfx = abs(feval(f, x0)); % Compute the valu of |f(x)| at our current guess
        
        if abs(nrmfx) < epsilon % Termination condition
            status = 0;
        end
        numitr = numitr + 1; % Increase our iteration number
        
    end
    x = x0; % Set our output variable
    
end
end
