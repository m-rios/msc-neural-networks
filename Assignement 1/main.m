clear; clc; cla;

alpha = [.75:.25:3];
N = 20;
nD = 400;
nMax = 1500;
aQs = zeros(1,size(alpha,2));
bQs = zeros(1,size(alpha,2));
cQs = zeros(1,size(alpha,2));
dQs = zeros(1,size(alpha,2));
load('nmax-1500');
%% e) + a)
thQs = theoreticQs(alpha, N);
% aQs = getQs(alpha, N, nD, nMax);
%% b)
nMax=100;
bQs = getQs(alpha, N, nD, nMax);
%% c)
nMax=500;
cQs = getQs(alpha, N, nD, nMax);
%% d)
% nMax=600;
% dQs = getQs(alpha, N, nD, nMax);
%% Plot
cla;
hold on;
line(alpha, bQs, 'Color', 'green', 'DisplayName', 'nMax=100', 'MarkerFaceColor', 'green', 'Marker', 'd');
line(alpha, cQs, 'Color', 'blue', 'DisplayName', 'nMax=500', 'MarkerFaceColor', 'blue', 'Marker', 'V');
line(alpha, aQs, 'Color', 'red', 'DisplayName', 'nMax=1500', 'MarkerFaceColor', 'red', 'Marker', 'o');
% line(alpha, dQs, 'Color', 'magent', 'DisplayName', 'N = 200 nMax=600', 'LineStyle','--', 'MarkerFaceColor', 'magent', 'Marker', 'd');
line(alpha, thQs, 'Color', 'black', 'DisplayName', 'theoretical');
grid on;
legend('show');
title('Probability of linear separability as a function of P/N, N = 20')
ylabel('Probability')
xlabel('P/N');
axis([1 3 -0.01 1.01])
print('incremental-nmax','-dpng','-r500')