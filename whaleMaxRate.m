function whaleMaxRate(a,b,c,d,e)
% This function does a sensitivity analysis for how the parameters affect populations 
% and calculates inital conditions for maximized growth rate 

% alpha = a = 10^-8
% r_1 = b = 0.05
% r_2 = c = 0.08
% k_1 = d = 150000
% k_2 = e = 400000

Ap = [(2*b)/d, 2*a; 2*a, (2*c)/e];
bp = [b; c];
xp = Ap\bp;

dx_dt = xp(1)*b*(1-xp(1)/d) - xp(1)*xp(2)*a;
dy_dt = xp(2)*c*(1-xp(2)/e) - xp(1)*xp(2)*a;

total_growth = dx_dt + dy_dt;


disp('Populations of whales that maximize the growth rate:');
disp(['blue whale = ' num2str(round(xp(1))), ', fin whale = ' num2str(round(xp(2)))]);
fprintf('\n');
disp(['Maximum Growth rate = ' num2str(total_growth), ' whales per year']);

end
