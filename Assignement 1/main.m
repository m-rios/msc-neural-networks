clear; clc; cla;

alpha = [.75:.25:3];
N = 20;
nD = 400;
nMax = 100;
aQs = zeros(1,size(alpha,2));
bQs = zeros(1,size(alpha,2));
cQs = zeros(1,size(alpha,2));
dQs = zeros(1,size(alpha,2));
%% e) + a)
thQs = theoreticQs(alpha, N);
aQs = getQs(alpha, N, nD, nMax);

%% b)
N = 50; nMax=150;
bQs = getQs(alpha, N, nD, nMax);
%% c)
N = 100; nMax=300;
cQs = getQs(alpha, N, nD, nMax);
%% d)
N = 200; nMax=600;
dQs = getQs(alpha, N, nD, nMax);
%% Plot
cla;
hold on;
stairs(alpha, thQs, 'Color', 'black', 'DisplayName', 'theoretical');
stairs(alpha, aQs, 'Color', 'red', 'DisplayName', 'N=20 nMax=100', 'LineStyle','--', 'MarkerFaceColor', 'red', 'Marker', 'd');
stairs(alpha, bQs, 'Color', 'green', 'DisplayName', 'N = 50 nMax=150;');
stairs(alpha, cQs, 'Color', 'blue', 'DisplayName', 'N = 100 nMax=300');
stairs(alpha, dQs, 'Color', 'yellow', 'DisplayName', 'N = 200 nMax=600');
grid on;
legend;
axis([0.5 3 -0.01 1.01])