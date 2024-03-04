format long G
x = linspace(0,15,16);

harvestingBlue1 = [0 0 0 803 1725 1725 1725 1725 1725 1725 1725 1725 1725 1725 1725 1725];
harvestingFin1 = [0 2560 7855 7851 7850 7850 7850 7850 7850 7850 7850 7850 7850 7850 7850 7850];

harvestingBlue2 = [1558 1558 1557 1557 1556 1556 1555 1555 1165 1166 1167 1168 1168 1169 1724 1724];
harvestingFin2 = [7071 7072 7072 7072 7072 7071 7856 7856 7856 7856 7856 7856 7856 7856 7856 7856];

harvestingBlue3 = [1298 1297 1297 1296 1407 1403 1402 1722 1722 1722 1722 1722 1722 1722 1722 1722];
harvestingFin3 = [5893 5893 5893 5892 7847 7847 7847 7847 7847 7847 7847 7847 7847 7847 7847 7847];



%display(size(harvestingBlue2))
%display(size(harvestingFin2))

maxprofit = 67914605.9 * ones(size(x));

profit1 = 12000 * harvestingBlue1 + 6000*harvestingFin1;
profit2 = 12000 * harvestingBlue2 + 6000*harvestingFin2;
profit3 = 12000 * harvestingBlue3 + 6000*harvestingFin3;

totalprofitMax = sum(maxprofit)
totalprofit1 = sum(profit1)
totalprofit2 = sum(profit2)
totalprofit3 = sum(profit3)





     % Plot dx/dt in the x-t plane
    figure;
    plot(x, maxprofit, 'k', 'LineWidth', 3);
   
    hold on 
    plot(x, profit1, 'b', 'LineWidth', 1);

    plot(x, profit2, 'r', 'LineWidth', 1);
    plot(x, profit3, 'g', 'LineWidth', 3);
    hold off
    
    legend('Unregulated Profits', 'Quota 1 Profits', 'Quota 2 Profits', 'Quota 3 Profits')
    xlabel('Years');
    ylabel('Annual Profits');
    title('Quota System Effects on Profit');
    grid on;


