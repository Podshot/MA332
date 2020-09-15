function [px,q]=Horner(c,x0);

%%%%%%%%%%
%c - vector of coeffs from polynomial
%x0 - point to evaluate p at

%px - computed value of p(x0)
%q - vector of coeffs of quotient from p(x)/(x-x0)
%%%%%%%%%%

%%% COMPUTES FUNCTION %%%
sum=0;
a=length(c)-1;
for i=1:length(c)-1         %repeat for each coefficent except constant
    value=1;                %set initial value at 1
    for b=1:a;              %repeat for each power
        value=x0*value;     %multiply for each power
    end
    sum=sum+(c(i)*value);   %add to sum of polynomial
    a=a-1;                  %decrease counter value
end
px=sum+c(length(c));        %add constant to sum

%%% DIVIDES FUNCTION %%%
