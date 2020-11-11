function out = F(x0,x,y)
global y x

a = x0(1);
b = x0(2);

out = sum(y - a*exp(b*x))^2;
end
