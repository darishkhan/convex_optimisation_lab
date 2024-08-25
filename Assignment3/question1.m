% part 1 : for interval [1, inf)

syms f(x)
f(x) = x^2;
gradf = gradient(f);

disp("function is x^2, with interval [1, inf)")
% for point x =1 
x = 1;
if x-1==0
    d = 1;
    if gradf(x)*d >= 0
        fprintf("function satisfies FONC at x = %d\n", x);
    end
elseif x-1>0
    d = 1;
    flag = 0;
    if gradf(x)*d == 0
        flag = flag + 1;
    end
    d=-1;
    if gradf(x)*d == 0
        flag = flag + 1;
    end
    if flag == 2
        fprintf("function satisfies FONC at x = %d\n", x);
    else
        fprintf("function doesn't satisfies FONC at x = %d\n", x);
    end
else 
    fprintf("Point %d is not feasible\n", x);
end




x=2;
if x-1==0
    d = 1;
    if gradf(x)*d >= 0
        fprintf("function satisfies FONC at x = %d\n", x);
    end
elseif x-1>0
    d = 1;
    flag = 0;
    if gradf(x)*d == 0
        flag = flag + 1;
    end
    d=-1;
    if gradf(x)*d == 0
        flag = flag + 1;
    end
    if flag == 2
        fprintf("function satisfies FONC at x = %d\n", x);
    else
        fprintf("function doesn't satisfies FONC at x = %d\n", x);
    end
else 
    fprintf("Point %d is not feasible\n", x);
end


% part 2 : for interval [-1, inf)

syms x
f(x) = x^2;
gradf = gradient(f);
fprintf("\n\n");
disp("function is x^2, with interval [-1, inf)")
% for point x =1 
x = 1;
if x+1==0
    d = 1;
    if gradf(x)*d >= 0
        fprintf("function satisfies FONC at x = %d\n", x);
    end
elseif x+1>0
    d = 1;
    flag = 0;
    if gradf(x)*d == 0
        flag = flag + 1;
    end
    d=-1;
    if gradf(x)*d == 0
        flag = flag + 1;
    end
    if flag == 2
        fprintf("function satisfies FONC at x = %d\n", x);
    else
        fprintf("function doesn't satisfies FONC at x = %d\n", x);
    end
else 
    fprintf("Point %d is not feasible\n", x);
end




x=2;
if x-1==0
    d = 1;
    if gradf(x)*d >= 0
        fprintf("function satisfies FONC at x = %d\n", x);
    end
elseif x-1>0
    d = 1;
    flag = 0;
    if gradf(x)*d == 0
        flag = flag + 1;
    end
    d=-1;
    if gradf(x)*d == 0
        flag = flag + 1;
    end
    if flag == 2
        fprintf("function satisfies FONC at x = %d\n", x);
    else
        fprintf("function doesn't satisfies FONC at x = %d\n", x);
    end
else 
    fprintf("Point %d is not feasible\n", x);
end






