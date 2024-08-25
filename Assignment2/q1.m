% Q1 : Given an array, make a matrix with 2 rows, both as a, with the first row sorted in descending order

% given aray
a = [1, 4, -9, 7, 9, 4];
% made matrix with two same rows
b = [a; a];

% implementing bubble sort on first row
for i = 1:1:6
    for j = i+1:1:6
        if b(1, j)>b(1,i)
            temp = b(1, i);
            b(1, i) = b(1, j);
            b(1, j) = temp;
        end
    end
end

% displaying the matrix
disp("Final Matrix : ");
disp(b);