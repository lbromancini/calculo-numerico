% Inputs
yn = input('insira o valor de yo: ');
a = input('insira o valor de a: ');
b = input('insira o valor de b: ');
h = input('insira o valor de h: ');

syms x
syms y % Declara x e y como variáveis simbólicas
f = input('Insira a função: ');
f = inline(f,'x','y'); % Transforma f em uma função utilizável

% Define o valor inicial de x0 como o menor valor, e x1 o maior
if a<b
   xn=a;
   x1=b;
else if b<a
   xn=b;
   x1=a;
else if a==b
   fprintf('Valor inválido')
   return
   end
   end
end

% Calcula o n° de repetições
n = (x1-xn)/h;

ordem = input('Qual a ordem do método que vc deseja calcular? ')

% Calcula o valor de y

for i=1:n

    if ordem == 1 % Método de Euler

        fxy = f(xn, yn);
        yn = yn+(h*fxy)

        xn = xn+h
    
    else if ordem == 2 % Método de Euler aperfeiçoado
                            
        fxy = f(xn, yn);
        k1 = fxy*h;
        
        xnaux = xn+h; 
        ynaux = yn+k1; 
        fxy = f(xnaux,ynaux); 
        k2 = fxy*h;
        
        yn = yn + (k1/2) + (k2/2)
        
        xn = xn+h
    
    else if ordem == 3 % Runge-Kutta de 3a ordem
            
        fxy = f(xn, yn);
        k1 = fxy*h;
        
        xnaux = xn+(h/2); 
        ynaux = yn+(k1/2); 
        fxy = f(xnaux, ynaux); 
        k2 = fxy*h;
        
        xnaux = xn + (3*h/4); 
        ynaux = yn + (3*k2/4); 
        fxy = f(xnaux, ynaux); 
        k3 = fxy*h;
        
        yn = yn + (2*k1/9) + (k2/3) + (4*k3/9)
        
        xn = xn+h
        
    else if ordem == 4 % Runge-Kutta de 4a ordem
            
        fxy = f(xn, yn);
        k1 = fxy*h;
        
        xaux = xn + (h/2);
        yaux = yn + (k1/2);
        fxy = f(xaux,yaux);
        k2 = fxy*h;
        
        xaux = xn + (h/2);
        yaux = yn + (k2/2);
        fxy = f(xaux,yaux);
        k3 = fxy*h; 
        
        xaux = xn + h;
        yaux = yn + k3;
        fxy = f(xaux,yaux);
        k4 = fxy*h;
        
        yn = yn + (k1 + (k2*2) + (k3*2) + k4)/6
        
        xn = xn+h
        
    else
            
        fprintf('Valor inválido')
        return
        
    end
    end
    end
    end
end

fprintf('O valor de y é %.5f', yn) 

clear