% Interpolação quadrática

% Entrada função

syms x
f = input('Insira a função: ');
f = inline(f,'x');

% Inputs
k = input('insira a quantidade de iterações: ');
x1 = input('insira o valor de x1: ');
x2 = input('insira o valor de x2: ');
x3 = input('insira o valor de x3: ');

% Atribuindo valores p função
fx1 = f(x1)
fx2 = f(x2)
fx3 = f(x3)

% Inicializando x4
x4 = 0

% Lógica
for i=1:k
    
        x4 = x2-0.5*((((x2-x1)^2)*(fx2-fx3)-((x2-x3)^2)*(fx2-fx1))/((x2-x1)*(fx2-fx3)-(x2-x3)*(fx2-fx1)))
    
        if x4 > x1 && x4 < x2
            x1 = x4
        end
        
        if x4 > x1 && x4 > x2
            x1 = x2
            x2 = x4
        end
        
        if x4 > x2 && x4 > x3
            x1 = x2
            x2 = x3
            x3 = x4
        end
        
        fx1 = f(x1)
        fx2 = f(x2)
        fx3 = f(x3)
        
end

fprintf('O valor de x4 é %.5f', x4)
