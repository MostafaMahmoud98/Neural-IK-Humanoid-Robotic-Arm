clc;
clear;
close all;
%% Problem Definition

problem.CostFunction = @(k)optimize_PID(k);
problem.nVar = 3;
problem.VarMin = [0 0 0];
problem.VarMax = [1 200 200];

%% GA Parameters

params.MaxIt = 500;
params.nPop = 50;

params.beta = 1;
params.pC = 1;
params.gamma = 0.1;
params.mu = 0.02;
params.sigma = 0.1;

%% Run GA

out = RunGA(problem, params);


%% Results

figure;
% plot(out.bestcost, 'LineWidth', 2);
semilogy(out.bestcost, 'LineWidth', 2);
xlabel('Iterations');
ylabel('Best Cost');
grid on;



