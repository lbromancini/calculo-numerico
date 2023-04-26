function p = func_multip(r,s,t)

    p = 0;

    for i=1:t
        
       p(i) = r(i)*s(i);
    
    end
    
end

% r = vetor 1
% s = vetor 2
% t = tamanho do vetor
% p = vetor resultante