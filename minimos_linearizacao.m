% Ajuste de curvas pelo método dos mínimos quadrados

x = input('Insira os valores de x: ')
y = input('Insira os valores de y: ')

n = length(x);

xt = x;
yt = y;

for i=1:n
    
    yt(i) = log(y(i));
    
end

xtyt = func_multip(xt,yt,n);
xt2 = func_pot(xt,n,2);
yt2 = func_pot(yt,n,2);

somaX = func_somatorio(x,n);
somaY = func_somatorio(y,n);
somaXT = func_somatorio(xt,n);
somaYT = func_somatorio(yt,n);
somaXT2 = func_somatorio(xt2,n);
somaXtYt = func_somatorio(xtyt,n);
somaYT2 = func_somatorio(yt2,n);

xtMedio = somaXT / n;
ytMedio = somaYT / n;

a1 = ((n*somaXtYt-somaYT*somaXT)/((n*somaXT2-(somaXT^2))))
a0 = ytMedio - (a1*xtMedio)

num = (n*somaXtYt) - (somaXT*somaYT);
den =((n*somaXT2-(somaXT^2))*(n*somaYT2-(somaYT^2)))^(1/2);
r = num / den;
r2 = r^2;

fprintf('A equação é %f.6x + %.6f \n', a1, a0)
fprintf('O valor de r é %.5f \n', r)

syms X; % Declara a variável simbólica
f = a1*X + a0; % Declara a função utilizando os valores de a1 e a0
fx = inline(f,'X'); % Torna a função utilizável
fplot(fx,[-100,100],'b'); % Plota a função fx
hold on % Permite que mais de uma função seja plotada
plot(x,y,'*-');
hold on
plot(xn,yn,'*-');
grid on; % Liga a grade do gráfico
hold off % Impede que novas funções sejam plotadas
