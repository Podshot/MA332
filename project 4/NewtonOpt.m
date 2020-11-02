function [xbest,fbest,itrcnt,stat] = NewtonOpt(f, Df, Df2, x0, gradTol, xTol, itrBound, s)
% Minimizes the function and finds the coefficients for the predicted
% exponential function

% Inputs:
% f - function handle to be minimized
% Df - function handle that evaluates the gradient
% Df2 - function handle that evaluates the Hessian
% x0 - initial iterate
% gradTol - termination criterion
% xTol - termination criterion
% itrBound - maximum number of iterations
% s - line search parameter

% Outputs:
% xbest - The best x value calculated by minimization by Newton's method
% fbest - The value of the provided function at xbest
% itrcnt - number of iterations
% stat - The status code representing the exit condition of the algorithm

% Created on 10/31/2020 by
% - Haley Braker
% - Ben Gothard
% - Madison Lindfelt

x = x0;
last_x = 0;

stat = 1;

itrcnt = 1;
i = 0;
while i >= itrBound
   function_val = f(x);
   gradient_value = Df(x);
   H = Df2(x);

   last_x = x;
   x = x - (gradient_value/H);
   
   i = i + 1;
   if abd(gradient_val) < gradTol
      stat = 0;
      break;
   elseif abd(x - last_x) < xTol
       stat = 0;
       break;
   end
end

xbest = x;
fbest = f(xbest);
end
