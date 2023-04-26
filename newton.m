% ex: e) f(x) = exp(x)+cos(x)-5 / x0 = 2 / e = 10^-3
% R: 1.6190

% Input da função, sua derivada, x0 e tolerância 
syms x % Declara x como variável simbólica
f = input('insira a equação: ')
g = diff(f, x)
h = diff(g, x)
x0 = input('Insira o valor para x0: ')
E = input('Insira o valor para a tolerância: ')

f = inline(f,'x') % Torna possível utilizar a função no código,
g = inline(g,'x') % transformando a string em uma função
h = inline(h,'x')

fx0 = f(x0)
gx0 = g(x0)
hx0 = h(x0)

if fx0*hx0 < 0
        fprintf('Não converge')
        break
else

x1 = x0 - (fx0/gx0)

% Repete o método até o critério de parada ser cumprido
while (x1 ~= x0) 
 
    x0 = x1
    fx0 = f(x0)
    gx0 = g(x0)
    hx0 = h(x0)
    
    x1 = x0 - (fx0/gx0)
    
end

end
fprintf('O valor de x é %.5f', x1)

