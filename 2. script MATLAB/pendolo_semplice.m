%% pendolo semplice
close all
t0=0; %estremo sx
T=10;  %estremo dx
N=100; %passi
L=2;  %lunghezza filo
g=9.81;

f=@(t,z) [z(2);-g/L*z(1)]; 
% riceve in input il vettore z
% restituisce un vettore colonna avente come componenti la seconda componente
% del vettore che ho passato e la prima moltiplicata per -g/L
z0=[0,pi/6];

[tempo,z]=RK4_sist(f,t0,z0,T,N);
theta=z(1,:);

grid on
subplot(1,2,1)
plot(tempo,theta,'r','linewidth',2)

for i=1:N+1
    xP=L*sin(theta(i));
    yP=-L*cos(theta(i));
    subplot(1,2,2);
    plot(0,0,'or','linewidth',2,'markersize',8);
    plot([0 xP],[0 yP],'k',xP,yP,'.r','linewidth',3,'markersize',30) %filo
    axis([-L L -L-.5 L])
    pause(0.2)
    hold off
end
