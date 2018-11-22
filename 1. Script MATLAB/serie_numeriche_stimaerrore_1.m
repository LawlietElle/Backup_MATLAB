% calcolare con una precisione t=10^-2 la serie di potenze Sum 1./n^2 con
% n=1, +inf
clear all
clc

t=10^-2;
Nmax=1000; % numero max di termini da sommare

SommaEsatta=pi^2/6; 


for r=1:Nmax
    n=1:r;
    Sn(r)=sum(1./n.^2);
end

figure
plot(1:Nmax,Sn,'b',1:Nmax,SommaEsatta,'r.')
xlabel('N')
legend('Somme parziali','Valore Esatto')
grid on

Errore=abs(SommaEsatta-Sn);
figure
plot(1:Nmax,Errore,'b')
xlabel('N')
legend('Errore')
grid on