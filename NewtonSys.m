function [x, nrmfx, numitr, status]=NewtonSys(f, df, x0, epsilon, maxiter)

if iscolumn(x0) == 0
    warning('x0 must be a column vector')
    status = 2;
    x = -1;
    nrmfx = -1;
    numitr = 0;
    return;
else
    status = 1;
    numitr = 0;
    
    for i = 1:maxiter
        
        fx = feval(f, x0);
        dfx = feval(df, x0);
        
        [L, U, p] = LUfact(dfx);
        [v, bstatus] = backsolve(L, U, -fx, p);
        
        x0 = x0 + v;

        nrmfx = abs(feval(f, x0));
        
        if abs(nrmfx) < epsilon
            status = 0;
        end
        numitr = numitr + 1;
        
    end
    disp(x0);
    x = x0;
    
end
end
