function [ w, kappa, kappa_incs ] = minover( xi, S, nmax)
    kappa_incs = zeros(1,nmax*length(S));
    kappa = inf;
    w = xi(:,1)*S(1)/size(xi,1);
    [w, kappa_new] = minover_hebbian(w, xi, S);
    for t = 1:nmax*length(S)
        kappa_incs(t) = kappa - kappa_new;
        if kappa - kappa_new == 0
            break
        end
        kappa = kappa_new;
        [w, kappa_new] = minover_hebbian(w, xi, S);
    end
end

