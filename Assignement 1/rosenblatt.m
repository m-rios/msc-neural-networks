function [ w, E ] = rosenblatt(w, xi, S)
    E = dot(w,xi)*S;
    N = size(xi,1);
    if E <= 0
        w = w + 1/N * xi*S;
    end
end