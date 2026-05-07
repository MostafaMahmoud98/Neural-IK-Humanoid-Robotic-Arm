% Define the plant transfer function
G = tf(5708, [1, 465.6, 5709]);

% Define the ITAE cost function for optimization
costFunction = @(K) computeITAE(K, G);

% Set bounds for the PID parameters [Kp, Ki, Kd]
% Adjust bounds as needed based on your system’s requirements
lb = [0, 0, 0];     % Lower bounds for Kp, Ki, Kd
ub = [100, 100, 100]; % Upper bounds for Kp, Ki, Kd

% Genetic Algorithm options
options = optimoptions('ga', ...
    'PopulationSize', 50, ...       % Size of the population
    'MaxGenerations', 100, ...      % Maximum number of generations
    'Display', 'iter', ...          % Display progress
    'UseParallel', true);           % Use parallel computing for faster performance

% Run Genetic Algorithm optimization
[optimalK, optimalCost] = ga(costFunction, 3, [], [], [], [], lb, ub, [], options);

% Display the optimized PID parameters
disp('Optimized PID parameters:');
disp(['Kp = ', num2str(optimalK(1))]);
disp(['Ki = ', num2str(optimalK(2))]);
disp(['Kd = ', num2str(optimalK(3))]);
disp(['Minimum ITAE Cost = ', num2str(optimalCost)]);

% Helper function to compute ITAE for given PID parameters
function cost = computeITAE(K, G)
    % Define PID controller with current gains
    C = pid(K(1), K(2), K(3));
    
    % Closed-loop system
    T = feedback(C * G, 1);
    
    % Simulate the step response
    [y, t] = step(T);
    
    % Compute the error as the difference from the reference (desired output = 1)
    error = abs(1 - y);
    
    % Compute ITAE: Integral of Time-weighted Absolute Error
    cost = trapz(t, t .* error);  % Numerical integration using trapz
end
