clear; cla; clc;
load('fisheriris');

or_xi = meas(:, 3:4)';
or_xi(3, :) = -1;
or_S = grp2idx(species);
or_S(or_S==2) = -1;
or_S(or_S==3) = -1;

% shuffle original data to get training and testing sets
r = randperm(length(or_S));
xi = or_xi(:,r);
S = or_S(r);

% train on subset
w = minover(xi(:,1:floor(length(xi)*0.8)), S(1:floor(length(S)*0.8)), 1000);

hit = 0;

% test
parfor i = floor(length(xi)*0.8)+1:length(xi)
    hit = hit + (sign(dot(w,xi(:,i))) == S(i));
end

hit_rate = hit/length(floor(length(xi)*0.8)+1:length(xi));


[row, col] = find(or_S ==-1);
figure, hold on;
scatter(or_xi(1,1:min(row)-1), or_xi(2,1:min(row)-1), 'Marker', '+', 'DisplayName', 'Setosa');
scatter(or_xi(1,min(row):length(or_xi)), or_xi(2,min(row):length(or_xi)), 'Marker', 'o', 'DisplayName', 'Versicolor & Virginica');
y = @(x) (w(3) - w(1)*x)/w(2);
x = linspace(0,8);
line(x, y(x), 'DisplayName', 'Classifier');
title('Minover solution for the fisher iris dataset');
legend('Location','northwest');
axis([0 8 -1 3]);
