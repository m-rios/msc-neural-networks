cla;clc;clear;
P = 2;
N = 2;
[xi, S] = generate_data(P, N);
[w stop] = train(xi, S, 100);

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
m = h(2)/h(1);
line([xlim(1), xlim(2)], [m*xlim(1), m*xlim(2)]);
line([0 w(1)], [0 w(2)], 'Color', 'red');

%% (D)
cla;clc;clear;
N = 20;
nMax = 50;
Qs = [];
for alpha = 0.75:0.25:3
    P = alpha*N;
    Q = 0;
    for n = 1:nMax
        [xi, S] = generate_data(P, N);
        [w, success] = train(xi, S, 100);
        Q = Q + success;
    end
    Qs = [Qs Q/nMax];
end

%% Plotting

plot(0.75:0.25:3, Qs);
pbaspect([1, 1, 1]);
axis([0.5 3 -0.1 1.1])