%% pendolo doppio piano
close all

t0=0; %estremo sx
T=10;  %estremo dx
N=100; %passi
L=2;  %lunghezza filo
g=9.81;
z0= [pi/2, pi/2,0,0];

f1 = @(t,z) 6*((2*z(3)-3*cos(z(1)-z(2))*z(4))/(16-9*cos(z(1)-z(2))^2));
f2 = @(t,z) 6*((8*z(4)-3*cos(z(1)-z(2))*z(3))/(16-9*cos(z(1)-z(2))^2));
f3 = @(t,z) -1/2*(f1(t,z)*f2(t,z)*sin(z(1)-z(2))+3*g/L*sin(z(1)));
f4 = @(t,z) -1/2*(-f1(t,z)*f2(t,z)*sin(z(1)-z(2))+g/L*sin(z(2)));
f = @(t,z) [f1(t,z);f2(t,z);f3(t,z);f4(t,z)];

[tempo,z] = ode45(f,[t0 T],z0);
theta_1=z(:,1);
theta_2=z(:,1);

grid on
subplot(1,3,1);
plot(tempo,theta_1,'r','linewidth',2)
plot(tempo,theta_2, 'r','linewidth',2)

for i=1:N+1
    xP1(i)=L*sin(theta_1(i));
    yP1(i)=-L*cos(theta_1(i));
    xP2(i)=xP1(i)+L*sin(theta_2(i));
    yP2(i)=yP1(i)-L*cos(theta_2(i));
    subplot(1,2,2);
    plot(0,0,'or','linewidth',2,'markersize',8);
    plot(xP1,yP1,'.r', xP2,yP2, '.b',[0 xP1],[0 yP1],'k',[xP1,xP2],[yP1,yP2],'k','linewidth',3,'markersize',30)
    axis([-2*L 2*L -2*L-.5 2*L])
    hold off
    pause(0.2)
end
