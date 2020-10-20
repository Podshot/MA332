% This script provides the stress-strain data from the article provided
% (see write-up), calls the CubicSpline function to fit a spline for the
% data and plots the results.

% Created on 10/18/2020 by
% - Haley Braker
% - Ben Gothard
% - Madison Lindfelt
% - Taryn Perry

x = [7.444, 9.3, 11.16,13.02,14.88,16.74,18.60];
y = [38.76, 45.56, 49.80, 51.89, 52.88, 52.92,51.68];
v = [7.444:0.1:18.6];
plot(x,y,".r",'MarkerSize',10)
hold on

xlabel('Strain (mm)');
ylabel('Stress (kgf/mm^2)');

z = CubicSpline(x,y,v);
plot(v,z,"g",'MarkerSize',3)
