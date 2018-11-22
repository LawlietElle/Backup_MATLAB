% grafico della serie di potenze  f(x)=Sum x^n/n^2 con n=1,+inf
% R=1, la serie converge puntualmente in [-1,1]
%
% Esercizio extra per voi: detta f'(x)=d/dx f(x)
clear all
clc

vx=linspace(-1,1,21); % valori x per cui calcolare la f(x)

N=100; % indice massimo per valutare ogni sommatoria 
% (riuscite a stimare con che errore valutiamo ogni ordinata?)
n=1:N;

for r=1:length(vx) % per ogni valore di x
    x=vx(r);
    y=sum(x.^n./n.^2); % calcolo l'ordinata associata a x
    vy(r)=y; % colleziono in un vettore tale ordinata
end 

figure
plot(vx,vy)
xlabel('x-coord')
ylabel('y-coord')
grid on