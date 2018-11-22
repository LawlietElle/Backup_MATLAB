% u autofunzioni
% lambda autovalori
% u_esatta , lambda_esatta corrispettivi non aprossimati
% N.B. Ctrl + C sul prompt per bloccare la riproduzione nel pause

clear all
close all

b = 1;
M = 20;
h = b/M;
d = 2/h^2*ones(1,M-1); %vettore diagonale
c = -1/h^2*ones(1, M-2);  %vettore codiagonale

A = diag(d) + diag(c,1) + diag(c,-1);
[u,lambda] = eig(A);
lambda = diag(lambda); %ribattezzo lambda matrice aventi eigenvalues sulla diag
L = length(lambda);

kappa = pi/b*[1:L]; 
lambda_esatta = kappa.^2; %aitovalori esatti

%concatenazione condizioni di Dichleret
u = [zeros(1,M-1); u; zeros(1,M-1)];


%% plot autovalori
plot([1:L], lambda_esatta, 'or', [1:L], lambda,'ob', 'linewidth',2);
grid on
pause
% aumentando M e cioè raffinando
% aumenta bene il fitting degli autovalori

%% plot autofunzioni
figure
x = linspace(0,b,M+1);
xp = linspace(0,b,400); %400  arbitrario

for i = 1:L 
    u_esatta = sin(kappa(i)*xp); %definizione propria dell'esercizio
    u_norm=u(:,i)/norm(u(:,i),inf); %normalizzazione dell'approssimazione (spiegaz sotto)
    plot (xp, u_esatta, 'r', x, u_norm, 'b','linewidth',2);
    pause
end

% gli autovettori sono definiti a meno di costante moltiplicative
% pertanto l'approssimazione delle autofunzioni avrà stesso numero
% di oscillazioni ma meno ampie e in certi casi opposte in segno. 
% Normalizzando si aggiusta l'ampiezza