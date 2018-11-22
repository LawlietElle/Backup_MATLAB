clear all
clc

f=@(x) 1./(1+x.^2);
%intervallo
a=-5;
b=5;
I=linspace(a,b); 

%funzione valutata sull'intervallo
fI=f(I);

grado_polin=14; %da testo
nodi=linspace(a,b,grado_polin+1);

fnodi=f(nodi); %funzione sui nodi

%interpolazione tramite spline
s=spline(nodi,fnodi, I);

figure
hold on
grid on
plot(I,fI,'b') %grafico funzione
plot(nodi,fnodi,'ko') 
plot(I,s,'r')%grafico spline
