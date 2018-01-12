clear; close all; clc;

load('data3.mat');

%% First attempt

p = randperm(length(tau));

xi_train = xi(:,p(1:250));
tau_train = tau(p(1:250));
xi_test = xi(:,p(251:500));
tau_test = tau(p(251:500));

[w1, w2,E_train, E_test] = train(xi_train, tau_train, xi_test, tau_test, 10, 0.1, false);

%% errors graph

figure, hold on, grid on;

plot([1:length(E_test)], E_test, 'DisplayName', 'E_{test}', 'Color','r')
plot([1:length(E_train)], E_train, 'DisplayName', 'E_{train}','Color','b')
xlabel('Training epoch','FontSize',15);
ylabel('Error','FontSize',15);
title('Training error vs Test error for 250 points','FontSize',15);
lgd = legend('show');
lgd.FontSize = 15;
%% ws graph
ax = [0,50,min([min(w1-0.2),min(w2-0.2)]),max([max(w1+0.2),max(w2+0.2)])]
figure
subplot(1,2,1);
bar(w1);
axis(ax);
title('w_1');
xlabel('Dimension');
ylabel('Magnitude');

subplot(1,2,2);
bar(w2);
axis(ax);
title('w_2');
xlabel('Dimension');
ylabel('Magnitude');

%% Avg
clear;clc; close all;
load('data3.mat');
nDatasets = 25;

Es_train = zeros(nDatasets,1000);
Es_test = zeros(nDatasets,1000);

for k=1:nDatasets
    
    p = randperm(length(tau));

    xi_train = xi(:,p(1:250));
    tau_train = tau(p(1:250));
    xi_test = xi(:,p(251:500));
    tau_test = tau(p(251:500));

    [~, ~,E_train, E_test] = train(xi_train, tau_train, xi_test, tau_test, 10, 0.1, false);
    Es_train(k,:) = E_train;
    Es_test(k,:) = E_test;
    
end

E_train_avg = mean(Es_train);
E_test_avg = mean(Es_test);

%% E_avg graphs

figure, hold on, grid on;

plot([1:length(E_test_avg)], E_test_avg, 'DisplayName', 'mean of E_{test}', 'Color','r')
plot([1:length(E_train_avg)], E_train_avg, 'DisplayName', 'mean of E_{train}','Color','b')
xlabel('Training epoch','FontSize',15);
ylabel('Error','FontSize',15);
title('Average of errors over 25 runs with 250 points each','FontSize',15);
lgd = legend('show');
lgd.FontSize = 15;


%% Adaptative learning rate
clear;clc; close all;
load('data3.mat');
nDatasets = 25;

Es_train = zeros(nDatasets,1000);
Es_test = zeros(nDatasets,1000);

for k=1:nDatasets
    
    p = randperm(length(tau));

    xi_train = xi(:,p(1:250));
    tau_train = tau(p(1:250));
    xi_test = xi(:,p(251:500));
    tau_test = tau(p(251:500));

    [~, ~,E_train, E_test] = train(xi_train, tau_train, xi_test, tau_test, 10, 0.1, true);
    Es_train(k,:) = E_train;
    Es_test(k,:) = E_test;
    
end

E_train_avg = mean(Es_train);
E_test_avg = mean(Es_test);

%% E_avg adaptative graphs

figure, hold on, grid on;

plot([1:length(E_test_avg)], E_test_avg, 'DisplayName', 'mean of E_{test}', 'Color','r')
plot([1:length(E_train_avg)], E_train_avg, 'DisplayName', 'mean of E_{train}','Color','b')
xlabel('Training epoch','FontSize',15);
ylabel('Error','FontSize',15);
title({'Average of errors over 25 runs with 250 points each','using adaptative learning rate $$\eta(t) = \frac{a}{b+t}$$'},'FontSize',15,'Interpreter','latex');
lgd = legend('show');
lgd.FontSize = 15;