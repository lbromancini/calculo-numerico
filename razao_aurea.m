% Entrada fun��o
syms x
f = input('Insira a fun��o: ');

lim = input('Deseja calcular o limite m�ximo ou m�nimo? ');

f = inline(f,'x');

% Entrada
phi = (1+(5)^(1/2))/2;

% Inputs
k = input('insira a quantidade de itera��es: ');
a = input('insira o valor de a: ');
b = input('insira o valor de b: ');

% C�lculos x1, x2 e d iniciais

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

% Imprime o valor m�ximo ou m�nimo, dependendo da equa��o 

if lim == 'max'
    
    if x1 > x2
        
        fprintf('O valor m�ximo � %.5f', x1)
        
    else if x2 > x1
            
        fprintf('O valor m�ximo � %.5f', x2)
        
        end
    end
    
else if lim == 'min'
        
    if x1 < x2
        
        fprintf('O valor m�nimo � %.5f', x1)
        
    else if x2 < x1
            
        fprintf('O valor m�nimo � %.5f', x2)
        
        end
    end
    
end
end

clear
