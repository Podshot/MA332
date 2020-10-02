function [x, nrmfx, numitr, status]=NewtonSys(f, df, x0, epsilon, maxiter)
% global - global stuff that we want to be defined globally
% I now wince whenever the words Newton and method are in the same sentence
% f(x) =~= f(v) + Dxf(v)(x-v)
if iscolumn(x0) == 0
    warning('x0 must be a column vector')
    status = 2;
    x = -1;
    nrmfx = -1;
    numitr = 0;
    return;
else
    [r,c] = size(f);
    status = 1;
    numitr = 0;
    for i = 1:maxiter
        % f is the function
        % df is the jacobian that has the coefficients
        % x0 = x0 - (f(x0)/df(x0)); - not sure if this is what we want
        % exactly but it's roughly what we are looking for
        fx = feval(f, x0);
        dfx = feval(df, x0);
        xdx = (fx / dfx);
        xdx = xdx(:,3);
        x0 = x0 - xdx;
        %x0 = x0 - (feval(f, x0) / feval(df, x0));
        %x0 = x(mr,1);
        nrmfx = feval(f, x0);
        
        if abs(nrmfx) < epsilon
            status = 0;
        end
        numitr = numitr + 1;
    end
    disp(x0);
    x = x0;
end
end