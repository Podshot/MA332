function [z] = CubicSpline(x,y,v)
% Determines the natural cubic spline for x-y data that is inputed

% Inputs:
% x - vector containing the x-coordinates of the data
% y - vector containing the y-coordinates of the data
% v - optional argument(with default x)

% Outputs:
% z - vector containing natural cubic spline function

% Created on 10/18/2020 by
% - Haley Braker
% - Ben Gothard
% - Madison Lindfelt
% - Taryn Perry

if nargin < 2
    error("not enough inputs")
end

if nargin < 3
    v = x;
end

if length(x)~= length(y)
    error("you must specify the same number of 'x' and 'y' data points")
end

n = length(x);

x1 = x;
y1 = y;
Dif = diff(x1);
Dif2 = diff(y1);

% Initialize a vector for the main diag values
deltas = zeros(n-2,1);
% Initialize the 'beta' vector of constants
beta = zeros(n-2,1);

% Populate a vector for the 2*(delx1 + delx0) values on the main diagonal
for i = 1:n-2
    deltas(i) = 2*(Dif(i+1)+Dif(i));
end

% Populate a 'beta' vector which is the "constants" vector
for i = 1:n-2
    beta(i) = (Dif2(i+1)/Dif(i+1))-(Dif2(i)/Dif(i));
end

% 'b' is multiplied by 6 per eqn 3.23 in the textbook
beta = 6.*beta;

DifTest = Dif;
DifTest(1) = [];
DifTest(n-2) = [];
% Create coefficient matrix
C = diag(deltas) + diag(DifTest,1) + diag(DifTest,-1);

% Initialize s
s = zeros(1,n);

% Ensure that s0 and sn remain as 0, while the solves s values populate
% s(2) through s(n-1)

[s(2:n-1)] = TDMS(C,beta);

% Determine 'a', 'b', 'c', and 'd' values based on 'y' and the solved 's'
% vector
a = zeros(1,n-1);
b = zeros(1,n-1);
c = zeros(1,n-1);
d = zeros(1,n-1);

for i = 1:n-1
    a(i) = y1(i);
    b(i) = (y1(i+1)-y1(i))/Dif(i) - (s(i+1)+2*s(i))*Dif(i)/6;
    c(i) = s(i)/2;
    d(i) = (s(i+1)-s(i))/(6*Dif(i));

end

m = length(v);
z = zeros(m,1);

% loop through the vector 'v' and evaluate at all the values provided
for i = 1:m
    
    if v(i) < x1(1)
        j = 1; % estimate with the closest cubic
        % If v(i) does not fall between x0 and xn an error displays
        % to warn that the value isn't and accurate estimate
        warning("the provided value of 'v' falls outside the evaluated x-interval")
    elseif v(i) > x(n)
        j = n - 1; % estimate with the closest cubic
        % If v(i) does not fall between x0 and xn an error displays
        % to warn that the value isn't and accurate estimate
        warning("the provided value of 'v' falls outside the evaluated x-interval")
    elseif v(i) == x(n)
        j = n -1;
        
    else        
    % Determine which interval v(i) falls in. The jth interval is used for
    % evaluating this v(i) value
    for k = 1:n-1
        if v(i) >= x(k) && v(i) < x(k+1)
            j = k;
            break
        end
      
    end
    end
      
    z(i) = a(j) + b(j)*(v(i) - x1(j)) + c(j)*(v(i) - x1(j))^2 + d(j)*(v(i) - x1(j))^3;
    
end

%%%%%%%%%%%%%%%%%%%%
% This section was used to compare spline with the article. Reformatting
% was necessary to match article format for accurate comparison.

% % Initialize variables for alternative coefficients
% A = zeros(1,n-1);
% B = zeros(1,n-1);
% C = zeros(1,n-1);
% D = zeros(1,n-1);
% 
% 
% % loop through the vector 'x' and change coefficients so that spline has
% % the form Ax^3 + Bx^2 + Cx + D
% for i = 1:n-1
%     
%     A(i) = d(i);
%     B(i) = c(i) - 3*d(i)*x(i);
%     C(i) = b(i) - 2*c(i)*x(i) + 3*d(i)*x(i)^2;
%     D(i) = a(i) - b(i)*x(i) + c(i)*x(i)^2 - d(i)*x(i)^3;
%     
%     % print values as a test to compare with article
%     fprintf("%.4f x^3 + %.4f x^2 + %.4f x + %.4f, x is subset [%.4f, %.4f]\n",A(i),B(i),C(i),D(i),x(i),x(i+1))
%     
% end


end
