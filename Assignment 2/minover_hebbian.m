function [ w, kappa ] = minover_hebbian( w, xi, S)
    
    hebbian = @(w, xi, S) w + 1/size(xi, 1) * xi*S;
    [kappa, kappa_ind] = compute_stability(w, xi, S);
    w = hebbian(w, xi(:,kappa_ind), S(kappa_ind));
    
end

