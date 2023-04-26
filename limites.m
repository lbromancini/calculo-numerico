% ex: a) f(x) = x^4 -2x^3 -7x^2 +8x +12
% fx = [ 1 -2 -7 8 12 ] 
% R: pos: [8; 0.5669] neg: [-0,6; -3,8285]

%fx = input('Insira os valores do polinomio: ')
% fx = [-6 0 -9 4 -2]
fx = [ 5 -6 0 -9 4 -7]
lim = input('Qual limite deseja calcular? ')

m = length(fx)

gx = fx % Armazena a funcao original 

% Polinômios Auxiliares %

if (lim == 'sup pos') % Limite Superior Positivo
    
elseif (lim == 'inf pos') % Limite Inferior Positivo
    
    faux = fx % Cria um polinômio auxiliar do mesmo tamanho que fx

    for i=1:m % Inverte a ordem dos coeficientes no vetor
        
    faux(i) = fx(m-i+1) 
    
    end
    
    fx = faux % Retorna os valores pra fx
    
elseif (lim == 'inf neg') % Limite Inferior Negativo
    
    faux = fx 

    for i=1:m % Inverte o sinal dos coef. com expoentes ímpares
    
        if (mod(i,2) == 0) % se o resto da divisão for 0, ou seja, par
            faux(i) = -fx(i) % inverte o sinal do coeficiente 
        else
            faux(i) = fx(i) % caso contrário, mantém o coef. igual 
        end
        
    end
    
    fx = faux
    
elseif (lim == 'sup neg') % Limite Superior Negativo 
    
    % Faz o mesmo que os limites inferiores
    
    faux = fx

    for i=1:m
        faux(i) = fx(m-i+1) 

    end

    for i=1:m

        if (mod(i,2) == 0) 
            faux(i) = -faux(i) 
        else
            faux(i) = faux(i)
        end
        
    end
    
    fx = faux
    
else
    fprintf('Comando Inválido')
    break
end

while fx(m) == 0 % Caso o a0 for zero, tira ele da conta 
    
   hx = fx % Armazena os valores de fx
   fx = (1:m-1) % Reduz o tamanho do vetor fx em 1
   
   for i=1:m-1
       
       fx(i) = hx(i) % Retorna os valores de fx, exceto o último
       
   end
   
   m = length(fx) % Redefine o valor de m
   
end


% Caso o termo de maior expoente seja negativo, inverte o sinal do
% polinômio todo
if (fx(1) < 0) 
    fx = -fx
end

% Define as variáveis do Teorema de Lagrange
n = 0
an = 0
b = 0
k = 0

% Calcula o n e o an 
for i=1:m
   if(fx(i) > 0)
   n = m-i 
   an = fx(i)
   break
   end
end

% Calcula o b 
for i=1:m
    if (fx(i) < b)
    b = fx(i)
    end
end

if (b == 0) % Se não existir b não existem raizes positivas 
    fprintf('Nao ha raizes reais positivas')
    
else
end
    
% Calcula o k
for i=1:m
   if(fx(i) < 0)
   k = m-i 
   break
   end
end

% Transforma os valores de n, an, b e k em módulo 
n = abs(n)
an = abs(an)
b = abs(b)
k = abs(k)

% Aplica o teorema de lagrange 
lagrange = 1 + (b/an)^(1/(n-k))

if (lim == 'sup pos')
    l = lagrange
    
elseif (lim == 'inf pos')
    l = 1/lagrange
    
elseif (lim == 'inf neg')
    l = -lagrange
    
elseif (lim == 'sup neg')
    l = -1/lagrange
    
end

% Printa os resultados finais 
    
fx
fprintf('n = %.0f / an = %.0f / b = %.0f / k = %.0f \n', n, an, b, k)
fprintf('lagrange = %.5f \n', lagrange)
fprintf('L = %.5f', l)

fx = gx % Retorna a função original pra fx