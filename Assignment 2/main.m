clear; clc;
rng('default')
rng(1) %set the seed

N = 20;
nd = 40;
tmax = 1000;

%% Plot
A = 0.25:0.25:3
error = zeros(length(A),1);
a = 1
for alpha = A
    P = floor(N * alpha);
    for i = 1:nd
        xi = randn(N, P);
        teacher = ones(N,1);
        S = sign(teacher'*xi)';
        w = minover(xi, S, tmax);
        error(a) = error(a) + generalization_error(teacher, w);
    end
    a = a + 1;
end

error = error/nd;

plot(alpha, error);