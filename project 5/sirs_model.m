clear all

months = 9;

beta = 1/2.5;
xi = (1/months)*(1/30);
gamma = 0.1;
N = 1000.0;

parameters = [beta, xi, gamma, N];

sim_len = [0, 650];

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
    
    v(1) = (-(b * S * I) / n) + (x_x * R);
    v(2) = ((b * S * I) / n) - (g * I);
    v(3) = (g * I) - (x_x * R);
end
