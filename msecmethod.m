function [ mvals ] = msecmethod(A, k, init, errtol, mvals)
%msecmethod a modified secant method algorithm
%   Inputs:
%     A = array of values for normalized area
%     k = specific heat ratio
%     init = initial guess
%     errtol = specified error tolerance for precesion in approximation
%     mvals = an empty array; attempts to save on computational time by
%     creating the new array only once

% loop counter control
i = 1;

while i <= length(A)
    A1 = A(i);
    Afunc =@(M1) ((1/M1)*((2/(k+1))*(1+((k-1)/2)*M1^2))^((k+1)/...
        (2*(k-1))))-A1;
    
    maxit = 0;
    % calculating values to enter the loop
    x = init;
    x2 = x-((0.0001*x*Afunc(x))/(Afunc(x+0.0001*x)-Afunc(x)));
    while abs(x2-x) > errtol
        x = x2;
        x2 = x-((0.0001*x*Afunc(x))/(Afunc(x+0.0001*x)-Afunc(x)));
        maxit = maxit + 1;
        % loop control check
        if maxit > 300
            return
        end
    end
    i = i + 1;
    mvals = [mvals x];
end

end

