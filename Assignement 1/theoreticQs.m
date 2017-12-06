function [ Qs ] = theoreticQs( alpha, N )
    
    Qs = [];

    for a = alpha
        P = a*N;
        if P <= N
            Q = 1;
        else
            Q = 0;
            for i = 1:N-1
                Q = Q + nchoosek(P-1, i);
            end
            Q = Q * pow2(1-P);
        end
        Qs = [Qs Q];
    end
    
    
end

