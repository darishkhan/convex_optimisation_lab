% Define the functions F and G
F = @(x, y) x.^2 + y.^2;
G = @(x, y) x .* cos(y);

% Compute the gradients of F and G
grad_F = @(x, y) [2*x, 2*y];
grad_G = @(x, y) [cos(y), -x .* sin(y)];

points = [0, 0; 0, 0.5; 1, 3];

% Direction vector and its unit vector
direction = [1, -2];
unit_direction = direction / norm(direction);

for i = 1:size(points, 1)
    x_val = points(i, 1);
    y_val = points(i, 2);
    
    F_val = F(x_val, y_val);
    G_val = G(x_val, y_val);
    
    if F_val > G_val
        grad_H = grad_F(x_val, y_val);
    elseif G_val > F_val
        grad_H = grad_G(x_val, y_val);
    else
        grad_F_val = grad_F(x_val, y_val);
        grad_G_val = grad_G(x_val, y_val);
        if norm(grad_F_val) >= norm(grad_G_val)
            grad_H = grad_F_val;
        else
            grad_H = grad_G_val;
        end
    end
    
    direc_derivative = dot(grad_H, unit_direction);
    
    % Output the result
    fprintf('The directional derivative of h at (%.1f, %.1f) in the direction of (1, -2) is %.4f\n', x_val, y_val, direc_derivative);
end
