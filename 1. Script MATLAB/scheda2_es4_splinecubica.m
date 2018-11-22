clear all
clc

f=@(x) (1-x.^2).^(5/2);

%intervallo
a=-1;
b=1;
I=linspace(a,b);
fI=f(I);

k=5; %come da testo
n=2.^k;

nodi= -1+2*(0:n)/n;
fnodi=f(nodi);

%spline knotaknot
s=spline(nodi,fnodi, I);

%spline vincolata
fd=@(x) (5/2)*(1-x.^2).^(5/2-1).*(-2*x); %derivata di f
%derivata valutata sugli estremi
f0=fd(a); 
fn=fd(b);
r=spline(nodi, [f0 fnodi fn], I);

figure
hold on
grid on
plot(I,fI,'b')
plot(nodi, fnodi,'ko')
plot(I,r,'r')
axis equal
hold off

%errore
err_knoaknot =max(abs(fI-s));
err_vincolata=max(abs(fI-r));




        