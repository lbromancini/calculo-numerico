% Entrada função
syms x
f = input('Insira a função: ');

lim = input('Deseja calcular o limite máximo ou mínimo? ');

f = inline(f,'x');

% Entrada
phi = (1+(5)^(1/2))/2;

% Inputs
k = input('insira a quantidade de iterações: ');
a = input('insira o valor de a: ');
b = input('insira o valor de b: ');

% Cálculos x1, x2 e d iniciais

d = (phi-1)*(b-a);
x1 = a + d;
x2 = b - d;
fx1 = f(x1);
fx2 = f(x2);

for i=1:k-1
    
    if lim == 'max'
    
        if fx1 > fx2

        a = x2;
        b = b;

        else if fx2 > fx1

        b = x1;
        a = a;

            end
        end
    
    else if lim == 'min'
    
        if fx1 < fx2

        a = x2;
        b = b;

        else if fx2 < fx1

        b = x1;
        a = a;
    
            end
        end 

    end
    end
    
    d = (phi-1)*(b-a);
    x1 = a + d;
    x2 = b - d;
    fx1 = f(x1);
    fx2 = f(x2);
    
end

% Imprime o valor máximo ou mínimo, dependendo da equação 

if lim == 'max'
    
    if x1 > x2
        
        fprintf('O valor máximo é %.5f', x1)
        
    else if x2 > x1
            
        fprintf('O valor máximo é %.5f', x2)
        
        end
    end
    
else if lim == 'min'
        
    if x1 < x2
        
        fprintf('O valor mínimo é %.5f', x1)
        
    else if x2 < x1
            
        fprintf('O valor mínimo é %.5f', x2)
        
        end
    end
    
end
end

clear
