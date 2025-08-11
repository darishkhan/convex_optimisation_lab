function conjugate_gradient_rosenbrock()
    x = [-2; 2];
    tol = 1e-6;  
    max_iter = 1000;  
    k = 0; 
    grad = rosenbrock_gradient(x);  
    d = -grad;  
    
    while norm(grad) > tol && k < max_iter
        alpha = secant_line_search(@rosenbrock_function, x, d);
        
        x_new = x + alpha * d;
        
        grad_new = rosenbrock_gradient(x_new);
        
        if mod(k, 6) == 0
            d = -grad_new;
        else
            beta_k = (grad_new' * (grad_new - grad)) / (grad' * grad);  
            d = -grad_new + beta_k * d;
        end
        
        x = x_new;
        grad = grad_new;
        k = k + 1;
        
        fprintf('Iteration %d: x = [%f, %f], f(x) = %f\n', k, x(1), x(2), rosenbrock_function(x));
    end
    
    fprintf('Conjugate gradient converged in %d iterations to x = [%f, %f]\n', k, x(1), x(2));
end

function f = rosenbrock_function(x)
    x1 = x(1);
    x2 = x(2);
    f = 100 * (x2 - x1^2)^2 + (1 - x1)^2;
end

function grad = rosenbrock_gradient(x)
    x1 = x(1);
    x2 = x(2);
    grad = [-400 * x1 * (x2 - x1^2) - 2 * (1 - x1);
            200 * (x2 - x1^2)];
end

function alpha = secant_line_search(func, x, d)
    alpha_prev = 0;
    alpha = 1;  
    tol = 1e-5;
    max_iter = 100;
    
    for i = 1:max_iter
        phi_prev = phi(func, x, d, alpha_prev);
        phi_curr = phi(func, x, d, alpha);
        
        if abs(phi_curr) < tol
            break;
        end
        
        alpha_new = alpha - phi_curr * (alpha - alpha_prev) / (phi_curr - phi_prev);
        
        alpha_prev = alpha;
        alpha = alpha_new;
    end
end

function val = phi(func, x, d, alpha)
    val = rosenbrock_gradient(x + alpha * d)' * d;
end
