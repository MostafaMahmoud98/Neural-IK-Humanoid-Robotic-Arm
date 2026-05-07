function [Xprey, Food_Score, CNVG] = HBA(objfunc, dim, lb, ub, tmax, N)
% HBA  Honey Badger Algorithm optimizer.
%
% Reference:
% Hashim, F. A., Houssein, E. H., Hussain, K., Mabrouk, M. S.,
% and Al-Atabany, W. "Honey Badger Algorithm: New Metaheuristic
% Algorithm for Solving Optimization Problems." Mathematics and
% Computers in Simulation, 2021.

beta = 6;      % Ability to get food, Eq. (4)
C = 2;         % Density-factor constant, Eq. (3)
vec_flag = [1, -1];

X = initialization(N, dim, ub, lb);
fitness = fun_calcobjfunc(objfunc, X);
[GYbest, gbest] = min(fitness);
Xprey = X(gbest, :);
Xnew = X;
CNVG = zeros(1, tmax);

for t = 1:tmax
    alpha = C * exp(-t/tmax);
    I = Intensity(N, Xprey, X);

    for i = 1:N
        r = rand();
        F = vec_flag(floor(2*rand() + 1));

        for j = 1:dim
            di = Xprey(j) - X(i, j);

            if r < 0.5
                r3 = rand();
                r4 = rand();
                r5 = rand();
                Xnew(i, j) = Xprey(j) ...
                    + F*beta*I(i)*Xprey(j) ...
                    + F*r3*alpha*di*abs(cos(2*pi*r4)*(1 - cos(2*pi*r5)));
            else
                r7 = rand();
                Xnew(i, j) = Xprey(j) + F*r7*alpha*di;
            end
        end

        upperMask = Xnew(i, :) > ub;
        lowerMask = Xnew(i, :) < lb;
        Xnew(i, :) = Xnew(i, :).*(~(upperMask | lowerMask)) + ub.*upperMask + lb.*lowerMask;

        tempFitness = fun_calcobjfunc(objfunc, Xnew(i, :));
        if tempFitness < fitness(i)
            fitness(i) = tempFitness;
            X(i, :) = Xnew(i, :);
        end
    end

    upperMask = X > ub;
    lowerMask = X < lb;
    X = X.*(~(upperMask | lowerMask)) + ub.*upperMask + lb.*lowerMask;

    [Ybest, index] = min(fitness);
    CNVG(t) = Ybest;
    if Ybest < GYbest
        GYbest = Ybest;
        Xprey = X(index, :);
    end
end

Food_Score = GYbest;
end

function Y = fun_calcobjfunc(func, X)
N = size(X, 1);
Y = zeros(N, 1);

for i = 1:N
    Y(i) = func(X(i, :));
end
end

function I = Intensity(N, Xprey, X)
di = zeros(1, N);
S = zeros(1, N);
I = zeros(1, N);

for i = 1:N-1
    di(i) = norm(X(i, :) - Xprey + eps)^2;
    S(i) = norm(X(i, :) - X(i+1, :) + eps)^2;
end

di(N) = norm(X(N, :) - Xprey + eps)^2;
S(N) = norm(X(N, :) - X(1, :) + eps)^2;

for i = 1:N
    denominator = max(4*pi*di(i), eps);
    I(i) = rand()*S(i)/denominator;
end
end

function X = initialization(N, dim, up, down)
if size(up, 2) == 1
    X = rand(N, dim).*(up - down) + down;
else
    X = zeros(N, dim);
    for i = 1:dim
        high = up(i);
        low = down(i);
        X(:, i) = rand(N, 1).*(high - low) + low;
    end
end
end
