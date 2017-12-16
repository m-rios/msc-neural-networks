function [ min_kappa, ind ] = compute_stability( w, xi, S )
    kappa = @(w, xi, S) dot(w, xi)*S/norm(w);
    min_kappa = realmax;
    ind = 1;

    %   Find sample with lowest stability
    for sample = 1:size(xi, 2)
        aux_kappa = kappa(w, xi(:,sample), S(sample));
        ind = (aux_kappa < min_kappa) * sample + (aux_kappa >= min_kappa) * ind;
        min_kappa = (aux_kappa < min_kappa) * aux_kappa + (aux_kappa >= min_kappa) * min_kappa;       
    end
end

