%EXERCISE
% 1-Assegnati i dati (-5,6), (4,2), (5,4), (11,10), la spline vincolata con
%dati  con y'_0=10 e y'_n=4 interpolante i dati, essa, nel punto sqrt(1.8)
%vale: ris[6.7247]

x=[-5 4 5 11];
y=[6 2 4 10];
yo=10;
yn=4;
punt=sqrt(1.8);
S=spline(x,[yo y yn], punt); %mette in S il valore che assume proprio in sqrt(1.8)
disp('------risultato esercizio 1');
disp(S);

% 2-Assegnati i dati (-1,4), (1,3), (7,10), (9,10), (19,9), la spline di tipo not-a-knot
%interpolante i dati nel punto log(0.9) vale: [ris 3.07619569e+00]
x1=[-1 1 7 9 19];
y1=[4 3 10 10 9];
S=spline(x1,y1,log(0.9)); %mette in S il valore che assume in log(0.9)
disp('------risultato esercizio 2');
disp(S);

% 3-Determinare il polinomio interpolante la funzione f(x)=e^(-x+x^4+1) in
% n=20 nodi equispaziati dell'intervallo [-1,1].Il massimo errore assoluto 
%d'interpolazione in 2000 punti equidistanti dell'intervallo di interpolazione
%vale all'incirca: ris[1.3039e-04]
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

f=@(x) 1+x.^2.*log(2+x); 
x=0.3:0.3:1.5;  %ascisse  dei punti
y=f(x);         %ordinate dei punti   
c=polyfit(x,y,length(x)-1);
p=polyval(c,3); %polinomio valutato in 3
disp('------risultato esercizio 4');
disp(f(3)-p);

%5-Assegnati i dati (3,8), (6,4), (7,5), (14,5), (21,7), il polinomio
%interpolante i dati nel punto e^0.7 vale:  ris[1.38377686e+01]
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

