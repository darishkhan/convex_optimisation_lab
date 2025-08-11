f1 = @(x)(sin(x) + cos(x));
x1 = [1];
g1 = gradientF(f1, x1)

f2 = @(x)(x(1)^2 + x(2)^2);
x2 = [1; 2];
g2 = gradientF(f2, x2)

f3 = @(x)(sin(x(2))*(x(1)^2)*cos(x(3)));
x3 = [1; 2; 3];
g3 = gradientF(f3, x3)

f4 = @(x)(x(1) + x(2)*cos(x(3))+ sin(x(4)));
x4 = [1; 2; 3; 4];
g4 = gradientF(f4, x4)

function grad = gradientF(f, point)
    
    h = 1e-4;               % Fixed perturbation step size
    n = length(point);       % Number of variables
    grad = zeros(1, n);      % Initialize gradient vector
    
    for i = 1:n
        perturbed_point = point;
        perturbed_point(i) = perturbed_point(i) + h;
        f_original = f(point);
        f_perturbed = f(perturbed_point);
        
        grad(i) = (f_perturbed - f_original) / h;
    end
end
