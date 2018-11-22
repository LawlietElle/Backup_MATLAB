%esercitazione 1 esercizio 2  f4
clear all
clc
format long e

%definizione nodi
n=1:1:16;
x=10.^(-n);

f4=@(x) ((x+1).^2-1)./x;
f4x=f4(x);

%oss runnando (togliendo ';' si ottiene fino a n=12 il risultato atteso ma da
%n=13 ci si allontana andando addirittura a 0 per n=16 per via della
%cancellazione numerica

%confronto con il valore esatto(2)
err=abs(f4x-2)./2;

figure
hold on
plot(n,log(err))
legend('Errore Relativo')
grid on
axis equal

%fix(sviluppando)
f4x_2=x+2;
err1=abs(f4x_2-2)./2;
plot(n,log(err1))
legend('Errore relativo2')
grid on
axis equal
