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
w=2.07;
bb=x2(2);         %get b
xval=linspace(min(x), max(x));        %x-values of predicted
yval=aa*exp(bb*xval);                  %y-values of predicted
reg_func=@(x)(aa*exp(bb*x));           %predicted function handle

syms a b
outF = F([x2(1);x2(2)],x,y);
dF = @(a, b)(-exp(b*x));
ddF = @(a, b)(-a*x*exp(b*x));

[xbest,fbest,itrcnt,status]=NewtonOpt(@F,@dF,@ddF,[x2(1);x2(2)],10^-6,10^-8,100,1);
AA=xbest(1,1);      %A value for predicted function
cc=xbest(2,1)*w;    %b value for predicted function
x_pred=x;
y_pred=[AA*exp(x*cc)];

disp(AA);
disp(cc);

plot(x_pred,y_pred,'b');        %plot of predicted function
legend('Actual Data','Predicted Function');
fprintf('f(x)=(%5.3f)*e^(%5.5f*x))\n',AA,cc);
