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
N = 10;
nMax = 50;
Qs = [];
Nd = 300;
for alpha = 1:.1:3
    P = floor(alpha*N); %Make sure by 'hand' that it'll actually be an integer
    Q = 0;
    for nd = 1:Nd
        [xi, S] = generate_data(P, N);
        [w, success] = train(xi, S, nMax);
        Q = Q + success;
    end
    
    Qs = [Qs Q/Nd]
end
%%
plot(1:.1:3, Qs);
line([2 2], [0 1], 'Color', 'black');
axis([0 3 0 1]);

axis square;
% pbaspect([1, 1, 1]);
axis([0.5 3 -0.1 1.1])
