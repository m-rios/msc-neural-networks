clear; clc;
% rng('default')
% rng(1) %set the seed

N = 20;
nd = 200;
tmax = 1000;


inc = 0.2;
from = 0.2;
to = 5;
A = from:inc:to;

%% Minover
errorMinover = zeros(length(A),1);
kappa_incs = zeros(length(A),tmax*floor(N * A(length(A))));
teacher = ones(N,1);
w = teacher*0;
parfor a = 1:length(A)
    P = floor(N * A(a));
    for i = 1:nd
        xi = randn(N, P);
        S = sign(teacher'*xi)';
        [w, k, ks] = minover(xi, S, tmax);
        errorMinover(a) = errorMinover(a) + generalization_error(teacher, w);
        ks(tmax*floor(N * A(length(A)))) = 0;
        kappa_incs(a,:) = kappa_incs(a,:) + ks;
    end
end

errorMinover = errorMinover/nd;
kappa_incs = kappa_incs/nd;

save(['Minover2 N-' num2str(N) '-nd-' num2str(nd) '-tmax-' num2str(tmax) '-alpha-' num2str(from) ':' num2str(inc) ':' num2str(to) '.mat'], 'N', 'A', 'nd', 'tmax', 'errorMinover', 'kappa_incs');


%% Rosenblatt

% rosen_stop = zeros(length(A), 1);
% 
% errorRosen = zeros(length(A),1);
% parfor a = 1:length(A)
%     P = floor(N * A(a));
%     for i = 1:nd
%         xi = randn(N, P);
%         teacher = ones(N,1);
%         S = sign(teacher'*xi)';
%         [w, stop] = train(xi, S, tmax, 0)
%         rosen_stop(a) = rosen_stop(a) + stop;
%         errorRosen(a) = errorRosen(a) + generalization_error(teacher, w);
%     end
% end
% 
% rosen_stop = rosen_stop/nd;
% errorRosen = errorRosen/nd;
% 
% save(['Rosenblatt N-' num2str(N) '-nd-' num2str(nd) '-tmax-' num2str(tmax) '-alpha-' num2str(from) ':' num2str(inc) ':' num2str(to) '.mat'], 'N', 'A', 'nd', 'tmax', 'errorRosen', 'rosen_stop');

%% Plot

% plot(A, errorMinover, 'Marker', 'o', 'MarkerFaceColor', 'r', 'Color', 'r', 'DisplayName', ['Minover N:' num2str(N) ' nd:' num2str(nd) ' tmax:' num2str(tmax)]);
% xlabel('P/N');
% ylabel('generalization error');
% title('generalization error as a function of \alpha');
% legend('show');
% grid on;