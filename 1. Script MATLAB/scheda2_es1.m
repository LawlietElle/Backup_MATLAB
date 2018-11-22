%scheda 2 es1
clear all
clc
%soluzione di Runge

%funzione di Runge
f=@(x) 1./(1+x.^2);

%intervallo
a=-5;
b=5;
I=linspace(a,b);

%f valutata su I 
fI=f(I);

grado_polinomio=13; %come da consegna

%nodi equidistanti tra i valori dell'intervallo e in numero pari a grado+1
nodes=linspace(a,b,grado_polinomio+1);

%f valutata solo sui nodi
fnodes=f(nodes);

%polinomio interpolante (Lagrange)
S=polyfit(nodes,fnodes,grado_polinomio);
P=polyval(S,I);

figure
hold on
grid on
plot(I,fI,'b') %funzione di runge
plot(nodes,fnodes,'ko') %plot nodi
plot(I,P,'r')  %plot polinomio

legend('funzione di Runge','nodi','polinomio interpol')
hold off

%soluzione con nodi di Chebyshev

v=1:1:grado_polinomio+1;
x=-cos((2*v-1)*pi./(2*(grado_polinomio+1))); %def nodi Chebyshev-Lobatto
t=(b-a)/2*x+(b+a)/2;
ft=f(t);
Q=polyfit(t,ft,grado_polinomio);
q=polyval(Q,I);

figure
hold on
grid on
plot(I,fI,'b')
plot(t,ft,'ko')
plot(I,q,'r')

