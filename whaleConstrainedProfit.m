function whaleConstrainedProfit(a, b, c, d, e)

% Constants
fin_min_pop = round(e / 2);
blue_min_pop = round(d / 2);

% Define functions for population changes
dx_dt = @(blue, fin) (b * blue * (1 - blue / d)) - a * blue * fin;
dy_dt = @(blue, fin) (c * fin * (1 - fin / e)) - a * blue * fin;

% Calculate populations and profit
profit = (12000 * dx_dt(blue_min_pop, fin_min_pop)) + (6000 * dy_dt(blue_min_pop, fin_min_pop));

% Display results
disp('Populations of whales that maximize the profit:');
disp(['blue whale = ' num2str(blue_min_pop) ', fin whale = ' num2str(fin_min_pop)]);
fprintf('\n');
disp(['profit = $' sprintf('%.2f', profit)]);


end
