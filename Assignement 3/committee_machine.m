function [ sigma ] = committee_machine( xi, w1, w2 )
    sigma = tanh(dot(w1,xi)) + tanh(dot(w2,xi));
end

