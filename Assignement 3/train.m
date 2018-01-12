function [ w1, w2, E_train, E_test ] = train( xi_t,tau_t, xi_test, tau_test, report_rate, th, adaptative)
%     E_train = ['Inf', 0];
    E_train = [];
    E_test = [];
      
    w1 = rand(50,1);
    w1 = w1/norm(w1);
    w2 = rand(50,1);
    w2 = w2/norm(w2);
    
    if adaptative
        eta = @(t) 1/(20+t);
    else
        eta = @(t) 0.05;
    end
    
%     while E_train[end] - E_train[end-1] < th
      for k = 1:1000
        for t = 1:report_rate
            mu = randi(size(xi_t,2));
            w1 = w1 - eta(k*report_rate+t-1) * (committee_machine(xi_t(:,mu), w1, w2) - tau_t(mu)) * (1 - tanh(dot(w1,xi_t(:,mu)))^2)*xi_t(:,mu);
            w2 = w2 - eta(k*report_rate+t-1) * (committee_machine(xi_t(:,mu), w1, w2) - tau_t(mu)) * (1 - tanh(dot(w2,xi_t(:,mu)))^2)*xi_t(:,mu);
        end
        E_train = [E_train E(xi_t, tau_t, w1, w2)];
        E_test = [E_test E(xi_test, tau_test, w1, w2)];
    end 
    
%     E_train = E_train(3:end);
end

