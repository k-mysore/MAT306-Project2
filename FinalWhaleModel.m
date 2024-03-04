clc
fprintf('\n');

%% This Script Calls All of the functions from our modelling implementations.
% This serves to explicitly answer all of the questions that
% were asked.
disp('Answers to each of the questions asked by the IWC:')

fprintf('-------------------------------------------------------------\n');
fprintf('\n');

% parameters can easily be changed. 
a = 10^-8; % alpha
b = 0.05; %r_1
c = 0.08; % r_2
d = 150000; % K_1
e = 400000; % K_2

%% In this first section are the functions for the implementations 
% of what we modeled when there is no harvesting permitted. 
disp('Findings for when there is no whaling is permitted:')
fprintf('\n');


whaleMaxRate(a,b,c,d,e) 
fprintf('\n');

% This function displays the rounded whale populations that give the maximum growth rate, as well as the sensitivities

disp('Sustainable whale populations:')

fprintf('\n');

SustainableandMaxPop(a,b,c,d,e)

fprintf('\n');
fprintf('-------------------------------------------------------------\n');


%% In this  section are the functions for the implementations 
% of what we modeled when there is unregulated harvesting 
disp('Findings for when whaling is unregulated:')

fprintf('\n');
UnconstrainedWhaleProfit(a,b,c,d,e)

fprintf('\n');
fprintf('-------------------------------------------------------------\n');


%% In this  section are the functions for the implementations 
% of what we modeled when there is unregulated harvesting 
disp('Findings for when whaling is regulated:')

whaleConstrainedProfit(a,b,c,d,e)










