function [x,nrmfx,numitr,status]=test_1()
global A B C t c
A = [15600 18760 17610 19170]; % x coords
B = [7540 2750 14630 610]; % y coords
C = [20140 18610 13480 18390]; % z coords
t = [0.07074 0.0722 0.07690 0.07242]; % times
c = 299792;
x0 = [0; 0; 6378; 0]; % Initial guess is earth radius for z, or North Pole

f1 = @(x)(x(1)-A(1))^2+(x(2)-B(1))^2+(x(3)-C(1))^2-(c*(t(1)-x(4)))^2;
f2 = @(x)(x(1)-A(2))^2+(x(2)-B(2))^2+(x(3)-C(2))^2-(c*(t(2)-x(4)))^2;
f3 = @(x)(x(1)-A(3))^2+(x(2)-B(3))^2+(x(3)-C(3))^2-(c*(t(3)-x(4)))^2;
f4 = @(x)(x(1)-A(4))^2+(x(2)-B(4))^2+(x(3)-C(4))^2-(c*(t(4)-x(4)))^2;

f = @(x) [f1(x);f2(x);f3(x);f4(x)];

df1 = @(x) (2*(x(1)-A(1))+2*(x(2)-B(1))+2*(x(3)-C(1))+2*c*(c*t(1)-c*x(4)));
df2 = @(x) (2*(x(1)-A(2))+2*(x(2)-B(2))+2*(x(3)-C(2))+2*c*(c*t(2)-c*x(4)));
df3 = @(x) (2*(x(1)-A(3))+2*(x(2)-B(3))+2*(x(3)-C(3))+2*c*(c*t(3)-c*x(4)));
df4 = @(x) (2*(x(1)-A(4))+2*(x(2)-B(4))+2*(x(3)-C(4))+2*c*(c*t(4)-c*x(4)));
df = @(x) [df1(x);df2(x);df3(x);df4(x)];

[x,nrmfx,numitr,status] = NewtonSys(f,df,x0,0.001,50);
disp(x);
fprintf('Your x position is %d. \nYour y position is %d. \nYour z position is %d. \nd is %d.', x(1),x(2),x(3),x(4))
end