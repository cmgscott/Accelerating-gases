function output = bisection(func,a,b,n,err)
%bisection: finds the roots of the function func on the interval [a,b] with
%n sections and an error tolerance of err

% -----------------------------------------------------------------------------
    
x = linspace(a,b,n); % create vector of x vals on [a,b] with ns intervals
roots = [];

for i = 1:n-1
    if ischanged(func,x(i),x(i+1)) 
        left = x(i);
        right = x(i+1);
        mid = (left+right)/2;
        % bisection iteration
        while (right-left) > err
            if ischanged(func,left,mid)
                right = mid;
            else
                left = mid; 
            end
            mid = (left+right)/2;
        end
        roots = [roots mid];
    end
end
output = roots;
end

% -----------------------------------------------------------------------------

% function to test for a sign change between the intervals' values
function out = ischanged(func,a,b)
    if sign(func(a)) ~= sign(func(b))
        out = 1;
    else
        out = 0;
    end
end