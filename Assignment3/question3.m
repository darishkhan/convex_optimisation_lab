disp("Part 1 : ")
A_a = [1 1; 2 2];
b_a = [2; 4];

Ab_a = [A_a b_a];

rref_A_a = rref(Ab_a);

A_rref_a = rref_A_a(:, 1:end-1);
b_rref_a = rref_A_a(:, end);

basis_a = null(A_a, 'r');

fprintf('Basis for the solution space of system a:\n');
disp(basis_a);

fprintf("\n");

% -----------------------------------------------------------

disp("Part 2 : ")
A_b = [1 1 -1; 1 -1 -1; 2 3 4];
b_b = [3; 4; 0];

Ab_b = [A_b b_b];

rref_A_b = rref(Ab_b);

A_rref_b = rref_A_b(:, 1:end-1);
b_rref_b = rref_A_b(:, end);

basis_b = null(A_b, 'r');

fprintf("Basis for the solution space of system b doesn't exists \n");
fprintf("solution is unique\n")
disp(basis_b);

fprintf('\n');

% ------------------------------------------------------------

disp("Part 3 : ")
A_c = [1 1 1 1; 1 2 2 1; 2 3 3 2];
b_c = [4; 8; 10];

Ab_c = [A_c b_c];

rref_A_c = rref(Ab_c);

A_rref_c = rref_A_c(:, 1:end-1);
b_rref_c = rref_A_c(:, end);

basis_c = null(A_c, 'r');

fprintf('Basis for the solution space of system c:\n');
disp(basis_c);

