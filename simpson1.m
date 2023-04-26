syms x
f = input('Insira a equação: ')
f = inline(f,'x') % Torna possível utilizar a função no código

% Input dos valores iniciais
a = input('Digite o valor de a: ')
b = input('Digite o valor de b: ')
n = input('Insira a qtd de iterações: ')

if (mod(n, 2) == 0) % n precisa ser par
end

mult = [] % Criando vetor vazio

% Aplicação do método
h = (abs(b-a))/n

% x inicial
if (a>b) 
    x = b
else if (b>a)
    x = a
    end
end

% Vetor mult
for k=1 : n-1
    
    if (mod(k, 2) == 0)
        mult(k) = 2
    else if (mod(k, 2) ~= 0)
        mult(k) = 4
        end
    end
end

soma = 0
% Soma
for k=1 : n-1
    x = x+h
    multfuncao = f(x) * mult(k)
    soma = soma + multfuncao 
end

% Fórmula geral

resp = h/3*((f(a) + f(b) + soma));
resp

clear