function whaleMaxRate()
% This function does a sensitivity analysis for how the parameters affect populations 
% and calculates inital conditions for maximized growth rate 

syms a b c d e
% alpha = a = 10^-8
% r_1 = b = 0.05
% r_2 = c = 0.08
% k_1 = d = 150000
% k_2 = e = 400000
A = [10^-8, .16/400000; .1/150000, 10^-8];
bs = [.08; .05];
x = A\bs; % Vector of optimal intital conditions, first entry=blue whales, second entry = fin whales

%The next lines do the same calculations as above but fully paramaterized.
Ap = [a, (2*c)/e; (2*b)/d, a];
bp = [c; b];
xp = Ap\bp; 
blueWhaleFunc = matlabFunction(xp(1)); % blueWhaleFun(a,b,c,d,e)
finWhaleFunc = matlabFunction(xp(2)); % finWhaleFun(a,b,c,d,e)

disp('Populations of whales that maximize the growth rate:');
disp(['blue whale = ' num2str(x(1)), ', fin whale = ' num2str(x(2))]);

fprintf('\n');

disp('Solutions when alpha = 10^-5:') % instance that drives one of the populations to extintion/
disp(['blue whale = ' num2str(blueWhaleFunc(10^-5, 0.05, 0.08, 150000, 400000 )), ', fin whale = ' num2str(finWhaleFunc(10^-5, 0.05, 0.08, 150000, 400000 ))]);

disp('Functions:')
disp(['blue whale = ' char((blueWhaleFunc)), ', fin whale = ' char(finWhaleFunc)]);

fprintf('\n');
disp('Sensitivity Analysis for the Fin Whale:');



%% a sensitivy 

finWhaleA = finWhaleFunc(a, 0.05, 0.08,150000, 400000);

df_da = diff(finWhaleA, a);
df_daFunc = matlabFunction(df_da);
sensitivityFinA = df_daFunc(10^-8)*(10^-8)/x(2);

disp(['S(F,α) = ' num2str(sensitivityFinA)]);

%% b sensitvity
finWhaleB = finWhaleFunc(10^-8, b, 0.08,150000, 400000);

df_db = diff(finWhaleB, b);
df_dbFunc = matlabFunction(df_db);
sensitivityFinB = df_dbFunc(0.05)*(0.05)/x(2);

disp(['S(F,r₁) = ' num2str(sensitivityFinB)]);

%% c sensitivity
finWhaleC = finWhaleFunc(10^-8, 0.05, c,150000, 400000);

df_dc = diff(finWhaleC, c);
df_dcFunc = matlabFunction(df_dc);
sensitivityFinC = df_dcFunc(0.08)*(0.08)/x(2);

disp(['S(F,r₂) = ' num2str(sensitivityFinC)]);

%% d sensitivity
finWhaleD = finWhaleFunc(10^-8, 0.05, 0.08,d, 400000);

df_dd = diff(finWhaleD, d);
df_ddFunc = matlabFunction(df_dd);
sensitivityFinD = df_ddFunc(150000)*(150000)/x(2);

disp(['S(F,k₁) = ' num2str(sensitivityFinD)]);

%% e sensitivity
finWhaleE = finWhaleFunc(10^-8, 0.05, 0.08,150000, e);

df_de = diff(finWhaleE, e);
df_deFunc = matlabFunction(df_de);
sensitivityFinE = df_deFunc(400000)*(400000)/x(2);

disp(['S(F,k₂) = ' num2str(sensitivityFinE)]);


end
