% ex: a) f(x) = exp(x)-sin(x)-2 / [1;1,2] / e = 10^-5
% R: 1,05413

% 3*x^3 - x + 1/2 - sin(x^(1/3))

% log(x^2) + x^3 - 4*x + 3/2 

% Declaração da função
syms x
f = input('Insira a equação: ')
f = inline(f,'x') % Torna possível utilizar a função no código

% Input dos valores iniciais
a = input('Digite o valor de a: ')
b = input('Digite o valor de b: ')
e = input('Digite o valor da tolerancia: ')

% Aplicação do método
fa = f(a)
fb = f(b)

x = ( (a*fb) - (b*fa) ) / (fb - fa)

fx = f(x)

if fa*fx < 0 % Se fa*fx for negativo, meu intervalo é [a,x]
     a = a
     b = x
else % Caso contrário, meu intervalo é [x,b]
     a = x
     b = b
end

% Repete o método até o critério de parada ser cumprido
while (abs(fa) >= e && abs(fb) >= e && (b-a) >= e)
    
    fa = f(a)
    fb = f(b)
    
    if fa*fb > 0 % fa e fb precisam ter sinais opostos para convergir
        fprintf('Intervalo não converge, digite o intervalo novo')
        break
    end

    x = ( (a*fb) - (b*fa) ) / (fb - fa)

    fx = f(x)

    if fa*fx < 0
        a = a
        b = x
    else
        a = x
        b = b
    end
    
end
    
fprintf('O intervalo final é [%.5f;%.5f] \n', a, b)