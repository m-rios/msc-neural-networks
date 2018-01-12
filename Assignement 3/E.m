function [ e ] = E( xi, tau, w1, w2 )
    
    P = size(xi,2);
    e = 0;
    for mu = 1:P
        e = e + (committee_machine(xi(:,mu), w1, w2) - tau(mu))^2;
    end
    e = e/(2*P);

end

