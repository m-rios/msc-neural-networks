function [ xi, S ] = generate_data( P, N )    
    xi = randn(N, P);
    S = mod(randi(2,P, 1), 2) * 2 -1;
end

