function [ Qs ] = getQs( in_alpha, N, Nd, nMax )
    Qs = [];
    for alpha = in_alpha
        P = floor(alpha*N); %Make sure by 'hand' that it'll actually be an integer
        Q = 0;
        for nd = 1:Nd
            [xi, S] = generate_data(P, N);
            [w, success] = train(xi, S, nMax);
            Q = Q + success;
        end
        Qs = [Qs Q/Nd];
    end
end

