% Ajuste de curvas pelo método dos mínimos quadrados (polinômios)

x = input('Digite o valor de x: ');
y = input('Digite o valor de y: ');

n = 4;
m = length(x);

% Eleva os valores de x até x^n
for i=1:n % Percorre as linhas
    
    for j=1:m % Percorre as colunas
        
        xn(i,j) = x(1,j)^i;
        
    end
    
end

xn

% Cria o vetor com os valores da soma das colunas de xn
for i=1:n
    
    somaXN(1,i) = func_somatorio_mat(xn,i,m);
    
end

somaXN

% Cria a matriz com a0, a1 e a2 para o escalonamento
mat = [];
cont = -1; % Contador que auxilia na geração da matriz

for i=1:3 % O valor fixo é 3 pois a matriz é sempre 3x3
    
   for j=1:3
      
       if i==1 && j==1
           
           mat(i,j) = m; % O termo [1,1] da matriz é o n° de valores de x
           
       else
           
           mat(i,j) = somaXN(1,j+cont);
       
       end
    
   end
   
   cont = cont +1;
   
end

mat

% Cria a matriz com x*y e x^2*y
xny = [];

for i=1:2
    
    for j=1:m
    
        xny(i,j) = y(1,j) * xn(i,j);
    
    end
    
end

xny

% Cria o vetor com os valores de b
b = [];

for i=1:3
   
    if i==1
        
        b(1,i) = func_somatorio(y,m);
        
    else
        
        b(1,i) = func_somatorio_mat(xny,i-1,m);
    
    end

end

b

an = func_escalonamento(mat,b)

% a0 = an(3)
% a1 = an(2)
% a2 = an(1)

% Calculando o erro %
% ymodelo e resíduo
ymodelo = [];
resid = [];

for i=1:m

   ymodelo(i) =  an(1) + an(2)*x(i) + an(3)*x(i)^2;

end

ymodelo

for i=1:m

    resid(i) = abs(y(i) - ymodelo(i));
    
end

resid

% Sr e St
sr = func_pot(resid,m,2);
sr = func_somatorio(sr,m);

ymedio = func_somatorio(y,m) / m;

st = func_pot((y-ymedio),m,2);
st = func_somatorio(st,m);

o = 2;

% Erro
erro = sr/(m-(o+1));
erro = erro^0.5;

% R^2 e r
r2 = (st - sr)/st;
r = r2^0.5;

fprintf('A equação resultante é %.4fx^2 + %.4fx + %.4f \n', an(3), an(2), an(1))
fprintf('O erro é %.5f \n', erro)
fprintf('O valor de r é %.5f \n', r)

syms X; % Declara a variável simbólica
f = an(3)*X^2 + an(2)*X + an(1); % Declara a função utilizando os valores de a1 e a0
fx = inline(f,'X'); % Torna a função utilizável
fplot(fx,[-100,100],'b'); % Plota a função fx
hold on % Permite que mais de uma função seja plotada
plot(x,y,'*r');
grid on; % Liga a grade do gráfico
hold off % Impede que novas funções sejam plotadas
