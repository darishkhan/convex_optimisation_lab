% Define the symbolic variables
syms x y z lambda

% Define the objective function
f(x, y, z) = 4*x + 2*y + 6*z;

% Define the constraint function
g(x, y, z) = x^2 + y^2 + z^2 -14;

% Define the Lagrange function
L = f - lambda * g;

% Compute the gradients of the Lagrange function with respect to x, y, and lambda
grad_L_x = diff(L, x);
grad_L_y = diff(L, y);
grad_L_z = diff(L, z);
grad_L_lambda = diff(L, lambda);

% Set up the system of equations
equations = [grad_L_x == 0, grad_L_y == 0, grad_L_z == 0, grad_L_lambda == 0];

% Solve the system of equations
solutions = solve(equations, [x, y, z, lambda]);

% Extract the solutions
x_sol = double(solutions.x);
y_sol = double(solutions.y);
z_sol = double(solutions.z);

% Evaluate the objective function at the solutions
f_values = f(x_sol, y_sol, z_sol);

% Display the results
disp('Solutions (x, y, z):');
disp([x_sol, y_sol, z_sol]);
disp('Objective function values at these points:');
disp(f_values);

% Find the maximum and minimum values
max_value = max(f_values);
min_value = min(f_values);

disp('Maximum value of f(x, y, z):');
disp(max_value);
disp('Minimum value of f(x, y, z):');
disp(min_value);
