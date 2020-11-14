clear all
%beta = 0.45;
%beta = 1;
%xi = 0.75;
%gamma = 1/5;
beta = .171;
xi = 0.025;
gamma = 0.1;
N = 1000.0;

parameters = [beta, xi, gamma, N];

sim_len = [0, 400];

y0 = [N - 1, 1, 0];

[t,y] = ode45(@sirs, sim_len, y0, [], parameters);
plot(t,y);
legend("Susceptible", "Infectious", "Recovered");

function v = sirs(t, y, params)
    v = zeros(3,1);
    
    S = y(1);
    I = y(2);
    R = y(3);
    
    b = params(1);
    x_x = params(2);
    g = params(3);
    n = params(4);
    
    v(1) = ((-b * S * I) / n) + (x_x * R);
    v(2) = ((b * S * I) / n) - (g * I);
    v(3) = (g * I) - (x_x * R);
end
