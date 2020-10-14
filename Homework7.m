% This script uses the method of least squares to approximate daily average
% temperatures for Claremont, CA (per Haley Rancho Cucamonga girl) 
% using f(d) = a0 + a1*d + a2*cos(2*Pi*d/365.25 - phi).
% This scipt also plots the daily average termperature data against the
% generated least squares approximation.
% Authors:
% Ben Gothard (2021)
% Haley Braker (2022)
% Taryn Perry (2022)
% Madison Lindfelt (2023)

weather_data = readtable('weather_data.csv','HeaderLines',0);
date_offset = datenum(weather_data.DATE(1))-1;

% Date vector
x = datenum(weather_data.DATE) - date_offset;
x = x.';

% Average Temperature column vector
y = weather_data.TAVG;


% Generate plot of x-y data (temperature vs time)
p1 = plot(x,y,'g*','MarkerSize',1.25);
hold on;

n=length(x);
A = zeros(n,4);
% Matrix of coefficients for cos/sin
for i = 1:n
    
A(i,1) = 1;
A(i,2) = x(i);
A(i,3) = cos(2*pi*x(i)/365.25);
A(i,4) = sin(2*pi*x(i)/365.25);

end

% Coefficients found from solving Ax = b, where x holds the a0, a1, a3, and
% a4 values
[C] = A\y;
a0 = C(1);
a1 = C(2);
a3 = C(3);
a4 = C(4);

% a2 is computed from a3 and a4 as these were separated to form a linear
% function. Phi is also related to a3 and a4 below.
a2 = sqrt(a3^2 + a4^2);
phi = atan(a4/a3);

% Least squares approximation
f = @(d) a0+a1*d+a2*cos(2*pi*d/365.25 - phi);

% Generate plot of this funtion over the same range as the x-y data above
ab=[1,n];
f_vect=eye(ab);
for i=1:n
    j=x(i);
    f_vect(i)=f(j);
end
p2 = plot(x,f_vect,'k');
legend([p1,p2],'Data','Least Squares');
title('Daily Temps in Rancho Cucamonga,CA');
xlabel('Days');
ylabel('Temperature (F)');
