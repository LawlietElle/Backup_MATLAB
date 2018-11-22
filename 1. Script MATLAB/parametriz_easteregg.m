%parametrizzazione funzione uovo di pasqua x^2+y^2/(a+y/b)=1
clear all
clc

%parametro t (gradi perchè uso funzione sin  in gradi)
t=linspace(0,2*pi,629); 

%parametrizzazione
gamma_x=cos(t);
gamma_y=6.5*sin(t)./(5-sin(t));

figure
plot(gamma_x,gamma_y,'r')
grid on
axis equal