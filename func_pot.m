function p = func_pot(r,t,pot)

    p = r;

    for i=1:t
        
       p(i) = r(i)^pot;
    
    end
    
end

% r = vetor
% t = tamanho do vetor
% pot = pot�ncia que o vetor ser� elevado
% p = vetor resultante