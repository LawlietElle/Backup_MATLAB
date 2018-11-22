%EXERCISE ESERCIZI INTERPOLAZIONE
% 1-Assegnati i dati (-5,6), (4,2), (5,4), (11,10), la spline vincolata con
%dati  con y'_0=10 e y'_n=4 interpolante i dati, essa, nel punto sqrt(1.8)
%vale: ris[6.7247]
clear all
clc

x=[-5 4 5 11];
y=[6 2 4 10];
yo=10;
yn=4;
punto=sqrt(1.8);
S=spline(x,[yo y yn], punto); %mette in S il valore che assume proprio in sqrt(1.8)
disp('------risultato esercizio 1');
disp(S);

% 2-Assegnati i dati (-1,4), (1,3), (7,10), (9,10), (19,9), la spline di tipo not-a-knot
%interpolante i dati nel punto log(0.9) vale: [ris 3.07619569e+00]
clear all

x1=[-1 1 7 9 19];
y1=[4 3 10 10 9];
S=spline(x1,y1,log(0.9)); %mette in S il valore che assume in log(0.9)
disp('------risultato esercizio 2');
disp(S);

% 3-Determinare il polinomio interpolante la funzione f(x)=e^(-x+x^4+1) in
% n=20 nodi equispaziati dell'intervallo [-1,1].Il massimo errore assoluto 
%d'interpolazione in 2000 punti equidistanti dell'intervallo di interpolazione
%vale all'incirca: ris[1.3039e-04]
clear all

f=@(x) exp(x.^4-x+1);
nodi=linspace(-1,1,20);
fnodi=f(nodi);
I=linspace(-1,1,2000);
fI=f(I);
c=polyfit(nodi, fnodi, length(nodi)-1);
p=polyval(c,I);
err_ass=max(abs(fI-p));
disp('------risultato esercizio 3');
disp(err_ass);

%-4 si consideri f(x)=1+x^2*log(x+2).Costruire il polinomio p(x) interpolante 
%la funzione nei punti x appartenenti a {0.3,0.6, 0.9,1.2,1.5}. 
%Quanto vale |f(3)-p(3)|?  ris[0.2034]
clear all

f=@(x) 1+x.^2.*log(2+x); 
x=0.3:0.3:1.5;  %ascisse  dei punti
y=f(x);         %ordinate dei punti   
c=polyfit(x,y,length(x)-1);
p=polyval(c,3); %polinomio valutato in 3
disp('------risultato esercizio 4');
disp(f(3)-p);

%5-Assegnati i dati (3,8), (6,4), (7,5), (14,5), (21,7), il polinomio
%interpolante i dati nel punto e^0.7 vale:  ris[1.38377686e+01]
clear all

x=[3 6 7 14 21];
y=[8 4 5 5 7];
c=polyfit(x,y,length(x)-1);
P=polyval(c,exp(0.7));
disp('------risultato esercizio 5');
disp(P);

%6-Sia data la funzione f(x) = sinx + e^(2/(1+x^2)) e sia dato il polinomio
%approssimante f(x) sull’intervallo [-2,5] costruito interpolando f(x) con un
%polinomio di grado 6 nei nodi di Chebyshev sull’intervallo.
%L’errore di interpolazione in norma infinito vale: ris[1.8718]
clear all

f=@(x) sin(x) +exp(2./(1+x.^2));
a=-2;
b=5;
I=linspace(a,b);
n=6;
          %nodi di Chebyshev
v=1:1:n+1;
t=-cos(pi*(2*v-1)./(2*(n+1)));
x=(b-a)/2*t+(b+a)/2;
y=f(x);

          %interpolazione
c=polyfit(x,y,n);
p=polyval(c,I);

err=norm(p-f(I),inf);
disp('------risultato esercizio 6');
disp(err);

%7- utilizzare la funzione Spline di Matlab per costruire la spline
%cubica vincolata S_3(x) soddisfacente la condizione S'_3(x1)=f'(x1) e
%S'_3(xn)=f'(xn) interpolante la funzione f(x)=x^3*cos(x) in n=25 nodi
%equispaziati dell'intervallo [0;1].
%Valutare il massimo errore assoluto di interpolazione in 1000 punti
%equidistanti dell'intervallo di interpolazione. [ris: 2.4692e-07]
clear all

f=@(x) x.^3.*cos(x);
I=linspace(0,1,1000);
fI=f(I);

deriv=@(x) 3*x.^2*cos(x)-sin(x).*x.^3;
f1=deriv(I(2)); %derivata valutata in x1
fn=deriv(1);    % "          "      " xn

nodi=linspace(0,1,25);
fnodi=f(nodi);

S=spline(nodi ,[f1 fnodi fn],I);
err_ass=max(abs(fI-S));
disp('------risultato esercizio 7');
disp(err_ass);

%8-Calcolare il polinomio interpolante la funzione f(x)=arctan(x (x+1)) in 8 
% punti equispaziati dell'intervallo [0,1]. Quanto vale l'errore di interpolazione
%nei punti 0.5 e 0.7? [ris. c.a. 1.28e-05 , 4.88e-06]
clear all

f=@(x) atan(x.*(x+1));
I=linspace(0,1,8);
c=polyfit(I,f(I),length(I)-1);
p1=polyval(c,0.5);
p2=polyval(c,0.7);
err1=abs(f(0.5)-p1);
err2=abs(f(0.7)-p2);
disp('------risultati esercizio 8');
disp(err1);
disp(err2);

%9-Usare la funzione spline di MATLAB per costruire la spline cubica
%S_3(x)di tipo not-a-knot interpolante la funzione f(x)=sin(x) in n=9 nodi
%equispaziati nell'intervallo [0,1]. Il massimo errore assoluto di
%interpolazione in 180 punti equispaziati nell'intervallo vale circa:
%                             [ris. 5.2765e-06]
clear all

f=@(x) sin(x);
n=9;
nodi=linspace(0,1,n);
I=linspace(0,1,180);
fnodi=f(nodi);
fI=f(I);
S=spline(nodi,fnodi,I);
err_max= max(abs(S-fI));
disp('------risultato esercizio 9:')
disp(err_max)

%10-Usando i nodi di Chebyshev-Lobatto, si determinino i polinomi  p_4(x) e
%p_8(x), di grado massimo rispettivamente 4 e 8, interpolanti la funzione 
%f(x)=xe^x nell'intervallo [0,1]. Valutando i polinomi in 100 punti equidistanti 
%dell'intervallo di interpolazione (estremi inclusi), calcolare il rapporto
%degli errori di interpolazione ||p_8(x)-f(x)||_inf / ||p_4(x)-f(x)||_inf.
%Il rapporto vale all'incirca:           [ris. 2.29e-06]
clear all

f=@(x) x.*exp(x);
a=0;
b=1;
I=linspace(a,b);
fI=f(I);
n4=4;
n8=8;
t=-cos(pi*((1:n4+1)-1)/n4);
x=(b-a)/2*t+(b+a)/2;
y=f(x);
c4=polyfit(x,y,n4);
p4=polyval(c4,I);
t=-cos(pi*((1:n8+1)-1)/n8);
x=(b-a)/2*t+(b+a)/2;
y=f(x);
c8=polyfit(x,y,n8);
p8=polyval(c8,I);
disp('------risultato esercizio 10');
disp(norm(p8-fI,inf)/norm(p4-fI,inf));

%11-Si consideri f(x)=sin(x)/(x^2+1). Si costruisca il polinomio p di grado
%5 interpolante f su nodi equispaziati nell'intervallo [-1,1], includendo 
%gli estremi nei nodi di interpolazione. Il valore di |f(2)-p(2)| e' circa:
%                                                             [ris. 7.1858]
clear all

f=@(x) sin(x)./(x.^2+1);
nodi=linspace(-1,1,6);
fnodi=f(nodi);
c=polyfit(nodi,fnodi,5);
p=polyval(c,2);
disp('------risultato esercizio 11');
disp(abs(f(2)-p));

%12-assegnati 6 punti equispaziati 0=x1<x2...<x6=5 il polinomio di Lagrange
%l_3 in x=2.7 vale:    [ris. 0.8006]
clear all

I=linspace(0,5,6);
x=2.3;
l3=1;
for i=[1 2 4 5 6]
l3=l3*(x-I(i))/(I(3)-I(i));
end
disp('------risultato esercizio 12');
disp(l3);
%alternativa
%y=[0 0 1 0 0];
%c=polyfit(I,y,length(I)-1)
%p=polyval(c,2.3)