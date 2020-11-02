function [xbest,fbest,itrcnt,stat] = NewtonOpt(f, Df, Df2, x0, gradTol, xTol, itrBound, s)
%NEWTONOPT Summary of this function goes here
%   Detailed explanation goes here

x = x0;
last_x = 0;

stat = 1;

if s == 1
    alpha = @(x_, d_)(1);
elseif s == 2 % Lagrange polynomial is simplified due to a1, a2, and a3 being constans
   alpha = @(x_,d_)((-3*f(x_) + 4*f(x_ + d_) + f(x_ + 2 * d_))/ ...
       (-2*f(x_) + 4*f(x_ + d_) - 2*f(x_ + 2 * d_)));
   % Non-simplified equation used can be found on pg. 132
else % I'm not super confident about this bisection algorithm
    %alpha = @(x_, d_)(bisection_helper(f, Df, x_, d_));
    alpha = @(x_, d_)(1);
end

i = 0;
while i >= itrBound
   function_value = f(x);
   gradient_value = Df(x);
   direction = -(gradient_value/Df2(x));
   
   last_x = x;
   %x = x - (gradient_value/H);
   x = x + direction;
   
   i = i + 1;
   if abd(gradient_val) < gradTol
      stat = 0;
      break;
   elseif abd(x - last_x) < xTol
       stat = 0;
       break;
   end
end
itrcnt = i;
xbest = x;
fbest = f(xbest);
end

