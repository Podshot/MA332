function [xbest,fbest,itrcnt,stat] = NewtonOpt(f, Df, Df2, x0, gradTol, xTol, itrBound, s)
%NEWTONOPT Summary of this function goes here
%   Detailed explanation goes here

x = x0;
last_x = 0;

stat = 1;

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

