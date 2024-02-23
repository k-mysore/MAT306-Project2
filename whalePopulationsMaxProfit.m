function whalePopulationsMaxProfit()
    %% finds the max capacity given parameters
% Define the parameters
    r1 = 0.05;
    r2 = 0.08;
    K1 = 150000;
    K2 = 400000;
    alpha1 =10^-8; % lowest alpha to give total max capacity: 10^-9.9023: 549449
    alpha2 = 10^-8; % highest alpha for max capacity greater than zero, capacity = 2152: alpha = 0.0001
    % Define the range for x and y
    alpha_values = logspace(-4, -9.9023, 100);
    max_blue = []; % stores number of blue whales to maximize profit
    max_fin = []; % stores number of fin whales to maximize profit

    x = linspace(0, K1, 1000);
    y = linspace(0, K2, 1000);

    % Calculate dx/dt and dy/dt
    dx_dt = r1 .* x .* (1 - x ./ K1) - alpha1 .* x .* y;
    dy_dt = r2 .* y .* (1 - y ./ K2) - alpha2 .* x .* y;

    % Find roots of dx_dt
    dx_roots_indices = find(diff(sign(dx_dt)));
    dx_roots = x(dx_roots_indices);

    % Find roots of dy_dt
    dy_roots_indices = find(diff(sign(dy_dt)));
    dy_roots = y(dy_roots_indices);
    
    % Calculate maximum whale capacity
    max_capacity = round(sum(dx_roots) + sum(dy_roots));
    disp(['Maximum whale capacity = ', num2str(max_capacity)]);

    %% calculates max profit
    if max_capacity >= K2 && max_capacity - K2 <= K1
    fin_whale_population = K2;
    blue_whale_population = max_capacity - K2;
    else
        fin_whale_population = max_capacity;
        blue_whale_population = 0;

    end 

    initial_fin = fin_whale_population;
    initial_blue = blue_whale_population;

profit_vector = [];

% assuming profits can only be maximized when at maximum capacity
%for i=1:num_interations
    while blue_whale_population <= K1 -1 && fin_whale_population - 1 >=0 
    blue_whale_population = blue_whale_population + 1;
    fin_whale_population = fin_whale_population - 1;

    blue_harvest_rate = r1*blue_whale_population*(1- (blue_whale_population/K1)) - alpha1*blue_whale_population*fin_whale_population;
    fin_harvest_rate = r2*fin_whale_population*(1-(fin_whale_population/K2)) - alpha2*blue_whale_population*fin_whale_population;
    
    profit = 12000*abs(blue_harvest_rate) + 6000*fin_harvest_rate;
    profit_vector = [profit_vector, profit];
    end 
%end

[maxValue, maxIndex] = max(profit_vector);


blue_whale_index = maxIndex + initial_blue;
fin_whale_index = max_capacity - blue_whale_index;

fprintf('Maximum Profit: %0.2f\n', maxValue);
fprintf('Number of Blue Whales: %d\n', blue_whale_index);
fprintf('Number of Fin Whales: %d\n', fin_whale_index);
end
