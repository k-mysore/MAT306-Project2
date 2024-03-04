function SustainableandMaxPop(a,b,c,d,e)


% alpha = a = 10^-8
% r_1 = b = 0.05
% r_2 = c = 0.08
% k_1 = d = 150000
% k_2 = e = 400000

Ap = [b/d, a; a, c/e];
bp = [b; c];
xp = Ap\bp;


disp(['blue whale <= ' num2str(round(xp(1))), ', fin whale <= ' num2str(round(xp(2)))]);
fprintf('\n');
disp(['Maximum Sustainable Capacity = ' num2str(round(xp(1)) + round(xp(2))), ' whales per year']);

%% Sensitivity analysis should be here


end