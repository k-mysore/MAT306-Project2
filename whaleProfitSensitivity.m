function whaleProfitSensitivity()

syms a b
% P = 11996167.85
% a = 150000
% b = 381281
max_capacity = 531281;

blue_whale_rate = matlabFunction(abs(0.05*a*(1-a/150000) - 10^-8*a*b));
fin_whale_rate = matlabFunction(abs(0.08*b*(1-b/400000) - 10^-8*a*b));

profit = 12000*blue_whale_rate(150000, 381281) + 6000*fin_whale_rate(150000, 381281);
blue_point_five_down = 12000*blue_whale_rate(150000 * .995, max_capacity - (150000 * .995)) + 6000*fin_whale_rate(150000 * .995, max_capacity - (150000 * .995));
blue_one_down = 12000*blue_whale_rate(150000 * .99, max_capacity - (150000 * .99)) + 6000*fin_whale_rate(150000 * .99, max_capacity - (150000 * .99));
blue_five_down = 12000*blue_whale_rate(150000 * .95, max_capacity - (150000 * .95)) + 6000*fin_whale_rate(150000 * .95, max_capacity - (150000 * .95));
blue_ten_down = 12000*blue_whale_rate(150000 * .9, max_capacity - (150000 * .9)) + 6000*fin_whale_rate(150000 * .9, max_capacity - (150000 * .9));
blue_max_down = 12000*blue_whale_rate(150000 * .8752, max_capacity - (150000 * .8752)) + 6000*fin_whale_rate(150000 * .8752, max_capacity - (150000 * .8752));
% blue can go down a max of 12.48% before the fin whale exceeds population
% capacity

% allowing fin whale to exceed carrying capacity increases profit.

% decrease in blue whales corresponds with decrease in fin whales so that
% its always at max capacity
disp(['Expected Profit: ', num2str(profit, '%0.2f')]);
disp(['Profit for 0.5% Decrease in Blue Whales: ', num2str(blue_point_five_down, '%0.2f'), ' Percent Decrease: ', num2str(100*(1- (blue_point_five_down/profit))), '%']);
disp(['Profit for 1% Decrease in Blue Whales: ', num2str(blue_one_down, '%0.2f'), ' Percent Decrease: ', num2str(100*(1- (blue_one_down/profit))), '%']);
disp(['Profit for 5% Decrease in Blue Whales: ', num2str(blue_five_down, '%0.2f'), ' Percent Decrease: ', num2str(100*(1- (blue_five_down/profit))), '%']);
disp(['Profit for 10% Decrease in Blue Whales: ', num2str(blue_ten_down, '%0.2f'), ' Percent Decrease: ', num2str(100*(1- (blue_ten_down/profit))), '%']);
disp(['Profit for 12.48% Decrease in Blue Whales: ', num2str(blue_max_down, '%0.2f'), ' Percent Decrease: ', num2str(100*(1- (blue_max_down/profit))), '%']);






end 