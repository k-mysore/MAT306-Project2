function whaleProfitSensitivity()

syms a b
% P = 11996167.85
% a = 150000
% b = 381281
max_capacity = 531281;

blue_whale_rate = matlabFunction(abs(0.05*a*(1-a/150000) - (3.56 * 10^(-7))*a*b));
fin_whale_rate = matlabFunction(abs(0.08*b*(1-b/400000) - (3.56 * 10^(-7))*a*b));

display(blue_whale_rate(70619, 194704))
display(fin_whale_rate(70619, 194704))


profit = 12000*blue_whale_rate(75000, 0) + 6000*fin_whale_rate(75000, 0);
display(profit)

blue_point_five_down = 12000*blue_whale_rate(.995*70619, 194704) + 6000*fin_whale_rate(.995*70619, 194704);
blue_one_down = 12000*blue_whale_rate(.99*70619, 194704) + 6000*fin_whale_rate(.99*70619, 194704);
blue_five_down = 12000*blue_whale_rate(.95*70619, 194704) + 6000*fin_whale_rate(.95*70619, 194704);
blue_ten_down = 12000*blue_whale_rate(.9*70619, 194704) + 6000*fin_whale_rate(.9*70619, 194704);



fin_point_five_down = 12000*blue_whale_rate(70619, .995*194704) + 6000*fin_whale_rate(70619, .995*194704);
fin_one_down = 12000*blue_whale_rate(70619, .99*194704) + 6000*fin_whale_rate(70619, .99*194704);
fin_five_down = 12000*blue_whale_rate(70619, .95*194704) + 6000*fin_whale_rate(70619, .95*194704);
fin_ten_down = 12000*blue_whale_rate(70619, .9*194704) + 6000*fin_whale_rate(70619, .9*194704);

both_point_five_down = 12000*blue_whale_rate(.995*70619, .995*194704) + 6000*fin_whale_rate(.995*70619, .995*194704);
both_one_down = 12000*blue_whale_rate(.99*70619, .99*194704) + 6000*fin_whale_rate(.99*70619, .99*194704);
both_five_down = 12000*blue_whale_rate(.95*70619, .95*194704) + 6000*fin_whale_rate(.95*70619, .95*194704);
both_ten_down = 12000*blue_whale_rate(.9*70619, .9*194704) + 6000*fin_whale_rate(.9*70619, .9*194704);

% allowing fin whale to exceed carrying capacity increases profit.

% decrease in blue whales corresponds with decrease in fin whales so that
% its always at max capacity
disp(['Expected Profit: ', num2str(profit, '%0.2f')]);
disp(['Profit for 0.5% Decrease in Blue Whales: ', num2str(blue_point_five_down, '%0.2f'), ' Percent Decrease: ', num2str(100*(1- (blue_point_five_down/profit))), '%']);
disp(['Profit for 1% Decrease in Blue Whales: ', num2str(blue_one_down, '%0.2f'), ' Percent Decrease: ', num2str(100*(1- (blue_one_down/profit))), '%']);
disp(['Profit for 5% Decrease in Blue Whales: ', num2str(blue_five_down, '%0.2f'), ' Percent Decrease: ', num2str(100*(1- (blue_five_down/profit))), '%']);
disp(['Profit for 10% Decrease in Blue Whales: ', num2str(blue_ten_down, '%0.2f'), ' Percent Decrease: ', num2str(100*(1- (blue_ten_down/profit))), '%']);
%disp(['Profit for 12.48% Decrease in Blue Whales: ', num2str(blue_max_down, '%0.2f'), ' Percent Decrease: ', num2str(100*(1- (blue_max_down/profit))), '%']);


disp('FIN WHALES')
disp(['Profit for 0.5% Decrease in Fin Whales: ', num2str(fin_point_five_down, '%0.2f'), ' Percent Decrease: ', num2str(100*(1- (fin_point_five_down/profit))), '%']);
disp(['Profit for 1% Decrease in Fin Whales: ', num2str(fin_one_down, '%0.2f'), ' Percent Decrease: ', num2str(100*(1- (fin_one_down/profit))), '%']);
disp(['Profit for 5% Decrease in Fin Whales: ', num2str(fin_five_down, '%0.2f'), ' Percent Decrease: ', num2str(100*(1- (fin_five_down/profit))), '%']);
disp(['Profit for 10% Decrease in Fin Whales: ', num2str(fin_ten_down, '%0.2f'), ' Percent Decrease: ', num2str(100*(1- (fin_ten_down/profit))), '%']);



disp('BOTH WHALES')
disp(['Profit for 0.5% Decrease in Both Whales: ', num2str(both_point_five_down, '%0.2f'), ' Percent Decrease: ', num2str(100*(1- (both_point_five_down/profit))), '%']);
disp(['Profit for 1% Decrease in Both Whales: ', num2str(both_one_down, '%0.2f'), ' Percent Decrease: ', num2str(100*(1- (both_one_down/profit))), '%']);
disp(['Profit for 5% Decrease in Both Whales: ', num2str(both_five_down, '%0.2f'), ' Percent Decrease: ', num2str(100*(1- (both_five_down/profit))), '%']);
disp(['Profit for 10% Decrease in Both Whales: ', num2str(both_ten_down, '%0.2f'), ' Percent Decrease: ', num2str(100*(1- (both_ten_down/profit))), '%']);



end 
