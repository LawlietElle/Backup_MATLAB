%esercitazione 1 es 4
clear all 
clc
format long e

k=1:1:50;
h=2.^(-k);
x=pi/4;

rapp_incr=(sin(x+h)-sin(x))./h;

%calcolo errore
err_rel=abs(cos(x)-rapp_incr)./abs(cos(x));
figure
plot(k,log(err_rel))
grid on

%oss sull'errore: fino al 25 l'errore decresce ma da lì in poi si ha
%cancellazione numerica

%eliminazione cancellazione numerica(prostaferesi)

Df=2*sin(h/2).*cos((2*x+h)/2)./h;
err_rel2=abs(cos(x)-Df)./abs(cos(x));
hold on
plot(k, log(err_rel2))
legend('Errore relativo','Errore relativo 2')