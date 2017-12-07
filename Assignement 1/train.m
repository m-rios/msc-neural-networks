function [ w, stop ] = train( xi, S, limit, c)
    P = size(xi, 2);
    w = zeros(size(xi,1),1);
    for t=1:limit;
        stop = true;
        for j=1:P
           [w, E] = rosenblatt(w, xi(:,j), S(j), c);
           stop = stop & (E > c);
        end
        if stop
            break;
        end
    end
end