%% pendolo semplice

close all
t0 = 0;
T = 100;
N = 1000;
L = 2;
g = 9.81;

f = @(t,z) [z(2);-g/L*z(1)];
z0 = [pi/6;0];

[tempo,z] = RK4_sist(f,t0,z0,T,N);
teta = z(1,:);
subplot(1,2,1)
plot(tempo,teta,'r','linewidth',2)

for i = 1:N+1
    xP =  L*sin(teta(i)); 
    yP = -L*cos(teta(i));
    subplot(1,2,2)
    plot(0,0,'or','linewidth',2,'markersize',4);
    hold on
    plot([0 xP],[0,yP],'k',xP,yP,'.r','linewidth',3,...
        'markersize',50)
    axis([-L L -L-.5 L])
    pause(.05)
    hold off
end
