% Define the symbolic variables
syms x y lambda1 lambda2

% Define the objective function
f(x, y) = x^2 + y^2;

% Define the constraint functions
g1(x, y) = x - 7;
g2(x, y) = (y^2)/4 - x + 4 ;

% Define the Lagrange function
L = f - lambda1 * g1 - lambda2 * g2;

% Compute the gradients of the Lagrange function with respect to x, y, and lambda
grad_L_x = diff(L, x);
grad_L_y = diff(L, y);
grad_L_lambda1 = diff(L, lambda1);
grad_L_lambda2 = diff(L, lambda2);

% Set up the system of equations
equations = [grad_L_x == 0, grad_L_y == 0, grad_L_lambda1 == 0, grad_L_lambda2 == 0];

% Solve the system of equations
solutions = solve(equations, [x, y, lambda1, lambda2]);

% Extract the solutions
x_sol = double(solutions.x);
y_sol = double(solutions.y);

% Evaluate the objective function at the solutions
f_values = f(x_sol, y_sol);

% Display the results
disp('Solutions (x, y):');
disp([x_sol, y_sol]);
disp('Objective function values at these points:');
fprintf("%f\n", f_values);

% Find the maximum and minimum values
max_value = max(f_values);
min_value = min(f_values);


disp('Minimum value of f(x, y):');
fprintf("%f\n", min_value);
