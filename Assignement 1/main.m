cla;clc;clear;
N = 40;
nMax = 100;
Qs = [];
Nd = 50;
Qs = getQs(.75:.125:3, N, Nd, nMax);
%%
stairs(.75:.125:3, Qs);
line([2 2], [0 1], 'Color', 'black');
axis([0 3 0 1]);

axis square;
% pbaspect([1, 1, 1]);
axis([0.5 3 -0.1 1.1])
