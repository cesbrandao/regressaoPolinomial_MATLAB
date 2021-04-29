clear
clc

load aerogerador.dat;

x = aerogerador(:,1); %velocidade do vento 
y = aerogerador(:,2); %potência gerada

n = length(x);

plot(x, y, '.');
hold on;

%% GRAU 2
X = [ones(1,n)' x x.^2]; %ones(1,length(x))' preenche a coluna incial com 1's
beta = inv(X'*X)*X'*y;
y_chapeu = X*beta; %preditor
plot(x,y_chapeu,'r-');

r2 = 1 - sum((y - y_chapeu).^2)/sum((y - mean(y)).^2); %cálculo do R2
k = 2; %grau do polinomio
p = k + 1;
r2aj = 1 - ((sum((y-y_chapeu).^2))/(n-p))/((sum((y-mean(y)).^2))/(n-1)); %cálculo do R2 ajustado

fprintf('Polinomio de Grau 2\n');
fprintf('R2 = %f\n', r2);
fprintf('R2AJ = %f\n', r2aj);

%% GRAU 3
X = [ones(1,n)' x x.^2 x.^3]; %ones(1,length(x))' preenche a coluna incial com 1's
beta = inv(X'*X)*X'*y;
y_chapeu = X*beta; %preditor
plot(x,y_chapeu,'g-');

r2 = 1 - sum((y - y_chapeu).^2)/sum((y - mean(y)).^2); %cálculo do R2
k = 3; %grau do polinomio
p = k + 1;
r2aj = 1 - ((sum((y-y_chapeu).^2))/(n-p))/((sum((y-mean(y)).^2))/(n-1)); %cálculo do R2 ajustado

fprintf('Polinomio de Grau 3\n');
fprintf('R2 = %f\n', r2);
fprintf('R2AJ = %f\n', r2aj);

%% GRAU 4
X = [ones(1,n)' x x.^2 x.^3 x.^4]; %ones(1,length(x))' preenche a coluna incial com 1's
beta = inv(X'*X)*X'*y;
y_chapeu = X*beta; %preditor
plot(x,y_chapeu,'m-','linewidth',3);

r2 = 1 - sum((y - y_chapeu).^2)/sum((y - mean(y)).^2); %cálculo do R2
k = 4; %grau do polinomio
p = k + 1;
r2aj = 1 - ((sum((y-y_chapeu).^2))/(n-p))/((sum((y-mean(y)).^2))/(n-1)); %cálculo do R2 ajustado

fprintf('Polinomio de Grau 4\n');
fprintf('R2 = %f\n', r2);
fprintf('R2AJ = %f\n', r2aj);

%% GRAU 5
X = [ones(1,n)' x x.^2 x.^3 x.^4 x.^5]; %ones(1,length(x))' preenche a coluna incial com 1's
beta = inv(X'*X)*X'*y;
y_chapeu = X*beta; %preditor
plot(x,y_chapeu,'k-','linewidth',2);

r2 = 1 - sum((y - y_chapeu).^2)/sum((y - mean(y)).^2); %cálculo do R2
k = 5; %grau do polinomio
p = k + 1;
r2aj = 1 - ((sum((y-y_chapeu).^2))/(n-p))/((sum((y-mean(y)).^2))/(n-1)); %cálculo do R2 ajustado

fprintf('Polinomio de Grau 5\n');
fprintf('R2 = %f\n', r2);
fprintf('R2AJ = %f\n', r2aj);

%% LEGENDA
legend('Base de Dados', 'Grau 2', 'Grau 3', 'Grau 4', 'Grau 5','Location','northwest');