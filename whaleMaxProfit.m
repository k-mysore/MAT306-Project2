function whaleMaxProfit()


max_capacity = 531281;

blue_capacity = 150000;
fin_capacity = 400000;

blue_whale_population = max_capacity - fin_capacity;
fin_whale_population = fin_capacity;


profit_vector = [];

for i=1:(blue_capacity - (max_capacity - fin_capacity))
    blue_whale_population = blue_whale_population + 1;
    fin_whale_population = fin_whale_population - 1;

    blue_harvest_rate = 0.05*blue_whale_population*(1- (blue_whale_population/150000)) - 10^-8*blue_whale_population*fin_whale_population;
    fin_harvest_rate = 0.08*fin_whale_population*(1-(fin_whale_population/400000)) - 10^-8*blue_whale_population*fin_whale_population;
    
    profit = 12000*abs(blue_harvest_rate) + 6000*fin_harvest_rate;
    profit_vector = [profit_vector, profit];
end

[maxValue, maxIndex] = max(profit_vector);

blue_whale_index = maxIndex + max_capacity - 400000;
fin_whale_index = fin_capacity - maxIndex;

fprintf('Maximum Profit: %0.2f\n', maxValue);
fprintf('Number of Blue Whales: %d\n', blue_whale_index);
fprintf('Number of Fin Whales: %d\n', fin_whale_index);