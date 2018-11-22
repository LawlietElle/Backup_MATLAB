%esercitazione 3

%% esercizio 3 con ode23
clear all
clc

x0=0;
xN=1;
z0=[1;1];
f=@(x,z) [z(2);3*z(2)-2*z(1)];
sol_esatta=@(x) exp(x);
xp=linspace(x0,xN,300);

opzione=odeset('AbsTol',1.0e-03,'RelTol', 1.0e-03);
[x,y]=ode23(f, [x0,xN], z0);

figure
plot(xp,sol_esatta(xp), 'r',x,y(:,1),'g','linewidth',2);
grid on
axis equal


%% esercizio 6









