function whaleODEplot()
    % Define the parameters
    r1 = 0.05;
    r2 = 0.08;
    K1 = 150000;
    K2 = 400000;
    alpha1 = 10^-8;
    alpha2 = 10^-8;

    % Define the range for x and y
    x = linspace(0, K1, 1000);
    y = linspace(0, K2, 1000);

    % Calculate dx/dt and dy/dt
    dx_dt = r1 .* x .* (1 - x ./ K1) - alpha1 .* x .* y;
    dy_dt = r2 .* y .* (1 - y ./ K2) - alpha2 .* x .* y;

    % Plot dx/dt in the x-t plane
    figure;
    plot(x, dx_dt, 'b', 'LineWidth', 2);
    xlabel('x');
    ylabel('dx/dt');
    title('dx/dt vs x');
    grid on;

    % Find roots of dx_dt
    dx_roots_indices = find(diff(sign(dx_dt)));
    dx_roots = x(dx_roots_indices);
    hold on;
    plot(dx_roots, zeros(size(dx_roots)), 'ro', 'MarkerSize', 8);
    text(dx_roots, zeros(size(dx_roots)), num2str(dx_roots'), 'VerticalAlignment', 'bottom', 'HorizontalAlignment', 'right');
    hold off;

    % Plot dy/dt in the y-t plane
    figure;
    plot(y, dy_dt, 'r', 'LineWidth', 2);
    xlabel('y');
    ylabel('dy/dt');
    title('dy/dt vs y');
    grid on;

    % Find roots of dy_dt
    dy_roots_indices = find(diff(sign(dy_dt)));
    dy_roots = y(dy_roots_indices);
    hold on;
    plot(dy_roots, zeros(size(dy_roots)), 'ro', 'MarkerSize', 8);
    text(dy_roots, zeros(size(dy_roots)), num2str(dy_roots'), 'VerticalAlignment', 'bottom', 'HorizontalAlignment', 'right');
    hold off;
    
    % Calculate maximum whale capacity
    total_capacity = sum(dx_roots) + sum(dy_roots);
    disp(['Maximum whale capacity = ', num2str(total_capacity)]);
end
