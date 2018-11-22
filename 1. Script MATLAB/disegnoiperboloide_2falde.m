% Disegno del iperboloide x^2/a^2-y^2/b^2-z^2=1
% Nota: vedremo un modo migliore per disegnarlo
% infatti il grafico "non e' bello" come dovrebbe
% il grafico e' ottenuto disegnando z=+/- sqrt(x^2/a^2-y^2/b^2-1)
clear all
clc

a=1; b=2;

% per un grafico "piu' bello" aumentare il numero di punti nelle 
% coordinate x e y, ma attenzione: non esagerare potrebbe bloccarsi il pc!
x=linspace(-2,2,101); 
y=linspace(-3,3,125);

[X,Y]=meshgrid(x,y);

Zp=sqrt(X.^2/a^2-Y.^2/b^2-1);
% elimino i punti con coordinata non reale
Zp(X.^2/a^2-Y.^2/b^2<1)=NaN; %NaN=not a number => matlab non lo disegna

Zm=-sqrt(X.^2/a^2-Y.^2/b^2-1);
% elimino i punti con coordinata non reale
Zm(X.^2/a^2-Y.^2/b^2<1)=NaN;

figure
mesh(X,Y,Zp)
hold on
mesh(X,Y,Zm)

xlabel('x-coord');
ylabel('y-coord');
grid on

% Disegno le curve di livello
figure
[cc,hh]=contour(X,Y,Zp);
clabel(cc,hh);
xlabel('x-coord');
ylabel('y-coord');
% axis equal
grid on