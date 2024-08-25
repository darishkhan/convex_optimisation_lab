warning('off', 'all');
% Part a
xRange = linspace(-2, 2, 500);
tRange = linspace(0, 4, 500);
[X, T] = meshgrid(xRange, tRange);
Z = X.^2;

figure;
hold on;

% Masking values below the function
T(T < Z) = NaN;

% Plot the epigraph
mesh(X, T, Z, 'FaceColor', [0.7 0.8 0.2], 'EdgeColor', 'none');
contour3(X, T, Z, 20, 'LineWidth', 1);

xlabel('x');
ylabel('t');
title('Epigraph of f(x) = x^2');
grid on;
hold off;

% Display convexity of the function
disp('The function f(x) = x^2 is convex as its Epigraph is convex.');


% Part b 
syms x y real;
f2 = exp(x) + y^2;
hessianF2 = computeHessian(f2, x, y);

% Check eigenvalues for non-negativity
convexCheckF2 = all(arrayfun(@(ev) isAlways(ev >= 0), hessianF2));

if convexCheckF2
    disp('The function f(x, y) = exp(x) + y^2 is convex.');
else
    disp('The function f(x, y) = exp(x) + y^2 is not convex.');
end

% Part c
f3 = sin(x) + cos(y);
hessianF3 = computeHessian(f3, x, y);

% Check eigenvalues for non-negativity
convexCheckF3 = all(arrayfun(@(ev) isAlways(ev >= 0), hessianF3));

if convexCheckF3
    disp('The function f(x, y) = sin(x) + cos(y) is convex.');
else
    disp('The function f(x, y) = sin(x) + cos(y) is not convex.');
end


% Part d
f4 = x^3 + y^3;
hessianF4 = computeHessian(f4, x, y);

% Check eigenvalues for non-negativity
convexCheckF4 = all(arrayfun(@(ev) isAlways(ev >= 0), hessianF4));

if convexCheckF4
    disp('The function f(x, y) = x^3 + y^3 is convex.');
else
    disp('The function f(x, y) = x^3 + y^3 is not convex.');
end


% Part e
f5 = x^3 + y^3;
hessianF5 = computeHessian(f5, x, y);

% Check convexity in the domain [4, 7] x [4, 7]
xRangeMin = 4; xRangeMax = 7;
yRangeMin = 4; yRangeMax = 7;
isConvexInRegion = true;

for i = xRangeMin:xRangeMax
    for j = yRangeMin:yRangeMax
        eigenValuesAtPoint = subs(hessianF5, {x, y}, {i, j});
        if any(eigenValuesAtPoint < 0)
            isConvexInRegion = false;
            break;
        end
    end
    if ~isConvexInRegion
        break;
    end
end

if isConvexInRegion
    disp('The function f(x, y) = x^3 + y^3 is convex in the domain [4, 7] × [4, 7].');
else
    disp('The function f(x, y) = x^3 + y^3 is not convex in the domain [4, 7] × [4, 7].');
end


function eigVals = computeHessian(func, xVar, yVar)
    gradX = diff(func, xVar);
    gradY = diff(func, yVar);
    
    secondGradXX = diff(gradX, xVar);
    secondGradYY = diff(gradY, yVar);
    mixedGradXY = diff(gradX, yVar);
    
    H = [secondGradXX, mixedGradXY; mixedGradXY, secondGradYY];
    
    eigVals = simplify(eig(H));
end
