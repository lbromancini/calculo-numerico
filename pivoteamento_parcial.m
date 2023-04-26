% ex: 4b)
% A = [3.333 15920 10.333; 2.222 16.71 9.612; -1.5611 5.1792 -1.6855]
% b = [7953 ; 0.965 ; 2.714]
% R: [1; 0,5; -1]

A = input('Insira a matriz: ');
A
b = input('Insira os coeficientes: ' );
b

d = det(A);
n = length(A);

if (d ~= 0) % O sistema só é válido quando o det for diferente de 0 


for k=1 : n-1 
    
    % Encontrando o pivô (max entre as linhas e colunas da matriz)
    max = abs(A(k,k));
    L = k;
    for i=k+1 : n 
        if abs (A(i,k)) > max;
        max = abs(A(i,k));
        L = i;
        end 
    end 

    % Realizando as trocas de linha    
    if L ~= k
    for j=k : n % Troca os elementos da linha k e da linha L
        aux = A(L,j); 
        A(L,j) = A(k, j);
        A(k,j) = aux;
    end
    aux = b(L);
    b(L) = b(k); 
    b(k) = aux;
    end

    % Realiza a eliminação por Gauss
    % escalonando com o multiplicador (elemento dividido pelo pivô)
    for i=k+1: n
    mult = A(i,k) / A(k,k);
    A(i,k) = 0;
    for j=k+1 : n
        A(i,j) = A(i,j) - mult * A(k,j);
    end
    b(i) = b(i) - mult * b(k);
    end 
    
end 

end

x(n) = 0;

% Calcula o vetor resultante
for i=1 : n
    L = n-i+1;
    soma = 0;
        for j=(n-i+1) : n
        soma = soma + A(L,j) * x(j);
        end
    x(L) = (b(L)-soma) / A(L,L);
end

fprintf('A resultante é: \n')
fprintf('[ %.5f ]\n', x)

clear