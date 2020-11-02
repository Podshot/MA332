clear all
clc
% confirmed
url_confirmed = 'https://raw.githubusercontent.com/CSSEGISandData/COVID-19/master/csse_covid_19_data/csse_covid_19_time_series/time_series_covid19_confirmed_global.csv';

% recovered
url_recovered = 'https://raw.githubusercontent.com/CSSEGISandData/COVID-19/master/csse_covid_19_data/csse_covid_19_time_series/time_series_covid19_recovered_global.csv';

% deceased
url_deaths = 'https://raw.githubusercontent.com/CSSEGISandData/COVID-19/master/csse_covid_19_data/csse_covid_19_time_series/time_series_covid19_deaths_global.csv';
 
[c]=get_global(url_confirmed);      %global confirmed variable
[d]=get_global(url_deaths);         %global death variable
[r]=get_global(url_recovered);      %global recovered variable
y = c - (d + r);        %calculate actively infected
x = 1:length(y);        %calculate number of days
figure(1);
plot(x,y,'r.');         %plot actual data
hold on
xlabel('Days');
ylabel('People Currently Infected');

m=[ones(numel(x),1),x(:)];       %ensure x is a column vector
lny=log(y(:));                   %ensure y is a column vector and take ln

x2=m\lny;        %solve for parameters
aa=exp(x2(1));    %solve for A
b=x2(2);         %get b
xval=linspace(min(x), max(x));        %x-values of predicted
yval=aa*exp(b*xval);                  %y-values of predicted
reg_func=@(x)(aa*exp(b*x));           %predicted function handle

global x y
outF = F(a, b);
dFA = diff(outF, a);
dFB = diff(outF, b);


plot(xval,yval,'b');                  %plot of predicted function
legend('Actual Data','Predicted Function');
fprintf('f(x)=(%5.3e)*e^(%5.5f*x))',aa,b);
