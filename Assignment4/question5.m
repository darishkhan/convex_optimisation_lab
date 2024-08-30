% Define symbolic variables
syms x y lambda1 lambda2 

% Objective function
f = x^2 + y^2;

% Constraints
g1 = x - 7;
g2 = y^2 - x + 4;

% Gradients of the objective function and constraints
grad_f = gradient(f, [x, y]);      % Gradient of the objective function
grad_g1 = gradient(g1, [x, y]);    % Gradient of g1
grad_g2 = gradient(g2, [x, y]);    % Gradient of g2

% Stationarity condition
stationarity_x = grad_f(1) + lambda1 * grad_g1(1) + lambda2 * grad_g2(1);
stationarity_y = grad_f(2) + lambda1 * grad_g1(2) + lambda2 * grad_g2(2);

% Complementary slackness conditions
comp_slack_1 = lambda1 * g1;
comp_slack_2 = lambda2 * g2;

% Solve the system of equations
solution = solve([stationarity_x == 0, stationarity_y == 0, comp_slack_1 == 0, comp_slack_2 == 0, g1 <= 0, g2 <= 0, lambda1 >= 0, lambda2 >= 0], [x, y, lambda1, lambda2]);

% Display the solutions
disp('Solutions:');
fprintf("x = %f\n", solution.x);
fprintf("y = %f\n", solution.y);
fprintf("lambda1 = %f\n", solution.lambda1);
fprintf("lambda2 = %f\n", solution.lambda2);
fprintf("Minimum function value = %f\n", solution.x^2 + solution.y^2);
