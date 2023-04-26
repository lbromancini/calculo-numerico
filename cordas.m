% ex: a) f(x) = exp(x)-sin(x)-2 / [1;1,2] / e = 10^-5
% R: 1,05413

% 3*x^3 - x + 1/2 - sin(x^(1/3))

% log(x^2) + x^3 - 4*x + 3/2 

% Declara��o da fun��o
syms x
f = input('Insira a equa��o: ')
f = inline(f,'x') % Torna poss�vel utilizar a fun��o no c�digo

% Input dos valores iniciais
a = input('Digite o valor de a: ')
b = input('Digite o valor de b: ')
e = input('Digite o valor da tolerancia: ')

% Aplica��o do m�todo
fa = f(a)
fb = f(b)

x = ( (a*fb) - (b*fa) ) / (fb - fa)

fx = f(x)

if fa*fx < 0 % Se fa*fx for negativo, meu intervalo � [a,x]
     a = a
     b = x
else % Caso contr�rio, meu intervalo � [x,b]
     a = x
     b = b
end

% Repete o m�todo at� o crit�rio de parada ser cumprido
while (abs(fa) >= e && abs(fb) >= e && (b-a) >= e)
    
    fa = f(a)
    fb = f(b)
    
    if fa*fb > 0 % fa e fb precisam ter sinais opostos para convergir
        fprintf('Intervalo n�o converge, digite o intervalo novo')
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
    
fprintf('O intervalo final � [%.5f;%.5f] \n', a, b)