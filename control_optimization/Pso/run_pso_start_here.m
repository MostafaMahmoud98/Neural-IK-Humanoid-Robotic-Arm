clc;clear;
%% Problem Definiton

problem.CostFunction = @(k)optimize_PID(k);  % Cost Function
problem.nVar = 3;       % Number of Unknown (Decision) Variables
problem.VarMin =  [0 0 0];  % Lower Bound of Decision Variables
problem.VarMax = [3 100 100];   % Upper Bound of Decision Variables

%% Parameters of PSO

params.MaxIt = 100;        % Maximum Number of Iterations
params.nPop = 50;           % Population Size (Swarm Size)
params.w = 1;               % Intertia Coefficient
params.wdamp = 0.99;        % Damping Ratio of Inertia Coefficient
params.c1 = 2;              % Personal Acceleration Coefficient
params.c2 = 2;              % Social Acceleration Coefficient
params.ShowIterInfo = true; % Flag for Showing Iteration Informatin

%% Calling PSO

out = PSO(problem, params);

BestSol = out.BestSol;
BestCosts = out.BestCosts;

%% Results

figure;
% plot(BestCosts, 'LineWidth', 2);
semilogy(BestCosts, 'LineWidth', 2);
xlabel('Iteration');
ylabel('Best Cost');
grid on;
BestSol = out.BestSol

