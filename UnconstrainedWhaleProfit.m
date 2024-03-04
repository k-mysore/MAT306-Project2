function [blueWhale, finWhale]=UnconstrainedWhaleProfit(a,b,c,d,e)
% alpha = a = 10^-8
% r_1 = b = 0.05
% r_2 = c = 0.08
% k_1 = d = 150000
% k_2 = e = 400000

A = [(b*12000*2)/d, 6000*a + 12000*a; 
     6000*a + 12000*a, (6000*2*c)/e];
B = [(b*12000); (6000*c)];
x = A\B;


dx_dt = (b * round(x(1)) * (1 - round(x(1)) / d)) - a * round(x(1)) * round(x(2));
dy_dt = (c * round(x(2)) * (1 - round(x(2)) / e)) - a * round(x(1)) * round(x(2));

blueWhale = round(x(1));
finWhale = round(x(2));

disp('Populations of whales that maximize the profit:');
disp(['blue whale = ' num2str(round(x(1))) ', fin whale = ' num2str(round(x(2)))]);
fprintf('\n');
profit = (12000 * dx_dt) + (6000 * dy_dt);

disp(['profit = $' sprintf('%.2f', profit)]);



end
