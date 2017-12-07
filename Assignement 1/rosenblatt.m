function [ w, E ] = rosenblatt(w, xi, S, c)
    E = dot(w,xi)*S;
    N = size(xi,1);
    if E <= c
        w = w + 1/N * xi*S;
    end
end