syms x
f = input('Insira a equa��o: ')
f = inline(f,'x') % Torna poss�vel utilizar a fun��o no c�digo

% Input dos valores iniciais
a = input('Digite o valor de a: ')
b = input('Digite o valor de b: ')
n = input('Insira a qtd de itera��es: ')

if (mod(n, 2) == 0) % n precisa ser par
end

mult = [] % Criando vetor vazio

% Aplica��o do m�todo
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

% F�rmula geral

resp = h/3*((f(a) + f(b) + soma));
resp

clear