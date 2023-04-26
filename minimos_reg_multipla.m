x1 = input('Digite o valor de x1: ')
x2 = input('Digite o valor de x2: ')
y = input('Digite o valor de y: ')

m = length(y);

x1x2 = func_multip(x1,x2,m);
x12 = func_pot(x1,m,2);
x22 = func_pot(x2,m,2);
x1y = func_multip(x1,y,m);
x2y = func_multip(x2,y,m);

% Cria a matriz com a0, a1 e a2 para o escalonamento
A(1,1) = m;
A(1,2) = func_somatorio(x1,m); 
A(1,3) = func_somatorio(x2,m);
A(2,1) = func_somatorio(x1,m);
A(2,2) = func_somatorio(x12,m);
A(2,3) = func_somatorio(x1x2,m);
A(3,1) = func_somatorio(x2,m);
A(3,2) = func_somatorio(x1x2,m);
A(3,3) = func_somatorio(x22,m);

A

% Cria a matriz com os coeficientes
B(1,1) = func_somatorio(y,m);
B(1,2) = func_somatorio(x1y,m);
B(1,3) = func_somatorio(x2y,m);

B

% Calcula a resultante do escalonamento
an = func_escalonamento(A,B)

% a0 = res(1)
% a1 = res(2)
% a2 = res(3)

% Calcula o erro e o valor de r
for i=1:m

    ymodelo(i) = an(1) + an(2)*x1(i) + an(3)*x2(i);

end

for i=1:m

    resid(i) = y(i) - ymodelo(i);

end

resid2 = func_pot(resid,m,2);

ymedio = func_somatorio(y,m) / m;

for i=1:m
    
    y_ymedio2(i) = (y(i)-ymedio)^2;
    
end

sr = func_somatorio(resid2,m)
st = func_somatorio(y_ymedio2,m)

o = 2

erro = (sr/(m-(o+1)))^(1/2);
r2 =(st-sr)/st
r = r2^(1/2);

fprintf('A equação resultante é %.4fx^2 + %.4fx + %.4f \n', an(3), an(2), an(1))
fprintf('O erro é %.5f \n', erro)
fprintf('O valor de r é %.5f \n', r)

syms X; % Declara a variável simbólica
f = an(3)*X^2 + an(2)*X + an(1); % Declara a função utilizando os valores de a1 e a0
fx = inline(f,'X'); % Torna a função utilizável
fplot(fx,[-100,100],'b'); % Plota a função fx
hold on % Permite que mais de uma função seja plotada
plot(x1,y,'*r');
hold on
plot(x2,y,'*g');
grid on; % Liga a grade do gráfico
hold off % Impede que novas funções sejam plotadas