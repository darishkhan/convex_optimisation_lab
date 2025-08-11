function newtons_method_rosenbrock()
    x = [0; 0];
    
    for k = 1:2
        grad = rosenbrock_gradient(x);
        H = rosenbrock_hessian(x);
        
        x = x - H \ grad;
        
        fprintf('Iteration %d: x = [%f, %f]\n', k, x(1), x(2));
    end
end

function grad = rosenbrock_gradient(x)
    x1 = x(1);
    x2 = x(2);
    grad = [-400 * x1 * (x2 - x1^2) - 2 * (1 - x1);
            200 * (x2 - x1^2)];
end

function H = rosenbrock_hessian(x)
    x1 = x(1);
    x2 = x(2);
    H = [1200 * x1^2 - 400 * x2 + 2, -400 * x1;
         -400 * x1, 200];
end
