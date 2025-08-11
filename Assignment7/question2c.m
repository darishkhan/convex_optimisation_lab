function gradient_descent_rosenbrock()
    x = [0; 0];
    alpha = 0.05;
    
    for k = 1:2
        grad = rosenbrock_gradient(x);
        
        x = x - alpha * grad;
        
        fprintf('Iteration %d: x = [%f, %f]\n', k, x(1), x(2));
    end
end

function grad = rosenbrock_gradient(x)
    x1 = x(1);
    x2 = x(2);
    grad = [-400 * x1 * (x2 - x1^2) - 2 * (1 - x1);
            200 * (x2 - x1^2)];
end
