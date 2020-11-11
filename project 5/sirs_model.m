beta = 1;
eps = 0.2;
yr = 0.1;
N = 10000;

parameters = [beta, eps, yr, N];

sim_len = [0, 100];

y0 = [N - 1, 1, 0];

[t,y] = ode45(@sirs, sim_len, y0, [], parameters);
plot(t,y);

function v = sirs(t, y, params)
    v = zeros(3,1);
    v(1) = ((-params(1) * y(1) * y(2))/params(4)) + params(2) * y(3);
    v(2) = ((params(1) * y(1) * y(2))/params(4)) - params(3) * y(2);
    v(3) = params(3) * y(2) - params(2) * y(3);
end
