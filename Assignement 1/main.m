cla;clc;clear;
P = 15;
N = 2;
[xi, S] = generate_data(P, N);
w = train(xi, S, 1000);

%% plotting

figure;
hold on;

axis([min(xi(:))-1, max(xi(:))+1, min(xi(:))-1, max(xi(:))+1]);
pbaspect([1, 1, 1]);

for i = 1:P
    if S(i) > 0
        plot(xi(1,i), xi(2,i), '+');
    else
        plot(xi(1,i), xi(2,i), 'o');
    end;
end

h = null(w(:).')

% plot h
xlim = get(gca,'XLim');
% m = h(2)/h(1);
m = h(1)/h(2);
line([xlim(1), xlim(2)], [m*xlim(1), m*xlim(2)]);
