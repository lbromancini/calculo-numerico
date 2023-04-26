function p = func_somatorio_mat(r,s,t)

    p = 0;

    for i=1:t
        
        p = p + r(s,i);
    
    end
    
end

% r = matriz
% s = linha a ser somada
% t = n° de colunas
% p = vetor resultante