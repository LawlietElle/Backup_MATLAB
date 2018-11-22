%% esercizio 6
close all
clear all

E=0.01; %epsilon
M=4;
h=1/M;
x=linspace(0,1,M+1);
sol_esatta=@(x) (exp(x/E)-1)/(exp(1/E)-1);

d=2*E/h^2*ones(1,M-1);
codiagsup=-(E/h^2-1/(2*h))*ones(1,M-2);
codiaginf=-(E/h^2+1/(2*h))*ones(1,M-2);

A=diag(d)+diag(codiagsup,1)+diag(codiaginf,-1);

%Termine noto
b=zeros(M-1,1);
b(end)=E/h^2-1/(2*h);

%soluzione
u=A\b; %approssimazione nei nodi interni
u=[0;u;1];
xp=linspace(0,1,400); % a piacere (serve solo al plot)

plot(xp,sol_esatta(xp), 'r', x, u,'b', 'linewidth', 4);
err = max(u'-sol_esatta(x))

