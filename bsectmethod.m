function [ mvals ] = bsectmethod( A, k, xl, xu, mvals )
%bsectmethod returns mach numbers for a range of normalized area values
%   inputs:
%     A = normalized area
%     k = specific heat ratio
%     xl = lower initial guess
%     xu = upper initial guess
%     mvals = empty array; used in hopes of minimizing computational time
%     needed to initialize a new empty array in every method
%   Outputs: an array of mach numbers

% initialize loop control
i = 1;

while i <= length(A)
    A1=A(i);
    maxit=0;
    Afunc =@(M1) ((1/M1)*((2/(k+1))*(1+((k-1)/2)*M1^2))^((k+1)/(2*(k-1))))-A1;
    % call Professor Willett's bisection method
    x=bisection(Afunc,xl,xu,500,0.0001);
    maxit=maxit+1;
    % check loop control
    if maxit > 300
        return
    end
    i=i+1;
    % concatenate mach numbers array
    mvals=[mvals x];
end

end

