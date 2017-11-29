function [ w, stop ] = train( xi, S, limit)
    P = size(xi, 2);
    w = zeros(size(xi,1),1);
    for t=1:limit;
        stop = true;
        for j=1:P
           [w, E] = rosenblatt(w, xi(:,j), S(j));
           stop = stop & (E > 0);
        end
        if stop
            break;
        end
    end
end