clear; clc; cla;

alpha = [.75:.25:3];
N = 20;
nD = 400;
nMax = 500;
aQs = zeros(1,size(alpha,2));
bQs = zeros(1,size(alpha,2));
cQs = zeros(1,size(alpha,2));
dQs = zeros(1,size(alpha,2));
load('incremental-nmax');
%% e) + a)
thQs = theoreticQs(alpha, 44);
aQs = getQs(alpha, 40, nD, 1000, 0);
%% b)
bQs = getQs(alpha, 60, nD, 1500, 0);
%% c)
% cQs = getQs(alpha, N, nD, nMax, 0);
%% d)
% dQs = getQs(alpha, N, nD, nMax, 0);
%% Plot
cla;
hold on;
line(alpha, bQs, 'Color', 'green', 'DisplayName', 'N=60 nMax=1500', 'MarkerFaceColor', 'green', 'Marker', 'd');
line(alpha, cQs, 'Color', 'blue', 'DisplayName', 'N = 20 nMax=500', 'MarkerFaceColor', 'blue', 'Marker', 'V');
line(alpha, aQs, 'Color', 'red', 'DisplayName', 'N= 40 nMax=1000', 'MarkerFaceColor', 'red', 'Marker', 'o');
% line(alpha, dQs, 'Color', 'magent', 'DisplayName', 'N = 200 nMax=600', 'MarkerFaceColor', 'magent', 'Marker', 's');
line(alpha, thQs, 'Color', 'black', 'DisplayName', 'theoretical');
grid on;
legend('show');
title('Probability of linear separability as a function of P/N, N = 20, nmax = 5001')
ylabel('Probability')
xlabel('P/N');
axis([1 3 -0.01 1.01])
% print('incremental-nmax','-dpng','-r500')