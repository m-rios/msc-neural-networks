function [ w, kappa ] = minover( xi, S, nmax)
    kappa = inf;
%     w = zeros(size(xi,1),1);
    w = xi(:,1)*S(1)/size(xi,1);
    [w, kappa_new] = minover_hebbian(w, xi, S);
    for t = 1:nmax*length(S)
%         if round((kappa - kappa_new)*th) == 0
%             break
%         end
        if kappa - kappa_new == 0
            break
        end
        kappa = kappa_new;
        [w, kappa_new] = minover_hebbian(w, xi, S);
    end
end

