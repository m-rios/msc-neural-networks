cla;clc;clear;
P = 3;
N = 2;
[xi, S] = generate_data(P, N);
w = train(xi, S, 1000);

figure;
hold on;

for i = 1:P
    if S(i) > 0
        plot(xi(1,i), xi(2,i), '+');
    else
        plot(xi(1,i), xi(2,i), 'o');
    end;
end

h = null(w(:).')

axis([min(xi(:))-1, max(xi(:))+1, min(xi(:))-1, max(xi(:))+1])