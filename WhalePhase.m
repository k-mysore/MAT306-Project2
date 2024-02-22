function WhalePhase()
    % Define the parameters
    a = 0.05;
    b = 1*10^-4;
    c = 0.08;
    d = 1*10^-4;

    % Define the function
    f = @(t, Y) [a*Y(1)*(1-Y(1)/150000) - b*Y(1)*Y(2); c*Y(2)*(1-Y(2)/400000) - d*Y(1)*Y(2)];

    % Define the range of x and y values
    x = linspace(0, 200000, 20);
    y = linspace(0, 500000, 20);

    % Create a grid of points
    [xGrid, yGrid] = meshgrid(x, y);
    t = 0; 

    % Compute the direction at each grid point
    dy = zeros(size(xGrid));
    dx = zeros(size(yGrid));
    for i = 1:numel(xGrid)
        Yprime = f(t, [xGrid(i); yGrid(i)]);
        dx(i) = Yprime(1);
        dy(i) = Yprime(2);
    end

    % Plot the direction field
    quiver(xGrid, yGrid, dx, dy, 'r');
    xlabel('Blue Whale Population');
    ylabel('Fin Whale Population');
    title('Phase Plane Whale Populations');
    axis tight;

    hold on;
    plot(72027.0101, 198199.3247, 'bo', 'MarkerSize', 10, 'LineWidth', 2);
    text(72027.0101, 198197.3247, '  Populations that maximize growth', 'VerticalAlignment','bottom', 'HorizontalAlignment','right', 'FontSize', 11);

    % blue whale = 72027.0101, fin whale = 198199.3247
    
    % Enable graphing multiple solutions when clicking on the plot
    disp('Click on the plot to select initial conditions. Press any key to stop.');
    while true
        [xClick, yClick, button] = ginput(1);
        if isempty(button) || button ~= 1
            break;
        end
        plot(xClick, yClick, 'rx', 'MarkerSize', 10, 'LineWidth', 2);
        % Solve the system for the clicked point
        [~,Y] = ode45(f, [0, 100], [xClick; yClick]);
        plot(Y(:,1), Y(:,2), 'm-', 'LineWidth', 2);
        % Display the coordinates of where the solution ends
        text(Y(end,1), Y(end,2), ['(' num2str(Y(end,1)) ', ' num2str(Y(end,2)) ')'], 'VerticalAlignment', 'bottom', 'HorizontalAlignment', 'right');
    end
end
