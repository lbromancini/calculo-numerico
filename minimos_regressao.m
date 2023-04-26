x = input('Insira os valores de x: ')
y = input('Insira os valores de y: ')

n = length(x)

xy = func_multip(x,y,n); % result = func_multip(vetor1,vetor2,tamanho)
x2 = func_pot(x,n,2); % result = func_pot(vetor,tamanho,grau)

somaX = func_somatorio(x,n); % result = func_somatorio(vetor,tamanho)
somaY = func_somatorio(y,n);
somaXY = func_somatorio(xy,n);
somaX2 = func_somatorio(x2,n);

a1 =((n*somaXY)-(somaX*somaY))/((n*somaX2)-somaX^2)
xmedio = somaX / n;
ymedio = somaY / n;
a0 = ymedio - (xmedio*a1)

% Calcula o y modelo
ymodelo = [];

for i=1:n
    
    ymodelo(i) = a0+(a1*x(i));

end

% Calcula o erro
erro = [];

for i=1:n
    
    erro(i) = y(i) - ymodelo(i);

end

% Calcula o sr
sr = [];

for i=1:n
    
    sr(i) = erro(i)^2;
    
end

% Calcula o sr
st = [];

for i=1:n
    
    st(i) = (y(i)-ymedio)^2;
    
end

% Calcula a soma de SR e ST, e o r^2
somaSR = func_somatorio(sr,n);
somaST = func_somatorio(st,n);
r2 = (somaST - somaSR) / somaST

fprintf('A equação é %.6fx + %.6f', a1, a0)

% Cria a função para a geração do gráfico

syms X; % Declara a variável simbólica
f = a1*X + a0; % Declara a função utilizando os valores de a1 e a0
fx = inline(f,'X'); % Torna a função utilizável
fplot(fx,[-1000,1000],'b'); % Plota a função fx
hold on % Permite que mais de uma função seja plotada
plot(x,y,'*r');
grid on; % Liga a grade do gráfico
hold off % Impede que novas funções sejam plotadas