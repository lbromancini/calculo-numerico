% ex: e) f(x) = exp(x)+cos(x)-5 / x0 = 2 / e = 10^-3
% R: 1.6190

% Input da fun��o, sua derivada, x0 e toler�ncia 
syms x % Declara x como vari�vel simb�lica
f = input('insira a equa��o: ')
g = diff(f, x)
h = diff(g, x)
x0 = input('Insira o valor para x0: ')
E = input('Insira o valor para a toler�ncia: ')

f = inline(f,'x') % Torna poss�vel utilizar a fun��o no c�digo,
g = inline(g,'x') % transformando a string em uma fun��o
h = inline(h,'x')

fx0 = f(x0)
gx0 = g(x0)
hx0 = h(x0)

if fx0*hx0 < 0
        fprintf('N�o converge')
        break
else

x1 = x0 - (fx0/gx0)

% Repete o m�todo at� o crit�rio de parada ser cumprido
while (x1 ~= x0) 
 
    x0 = x1
    fx0 = f(x0)
    gx0 = g(x0)
    hx0 = h(x0)
    
    x1 = x0 - (fx0/gx0)
    
end

end
fprintf('O valor de x � %.5f', x1)

