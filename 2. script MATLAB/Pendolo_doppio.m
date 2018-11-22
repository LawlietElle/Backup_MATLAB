%% pendolo doppio

close all
clear all

t0 = 0;
T = 20;
N = 100;
L = 2;
g = 9.81;

%% funzione F della formulazione canonica di Cauchy
f1 = @(t,z) 6*((2*z(3)-3*cos(z(1)-z(2))*z(4))/(16-9*cos(z(1)-z(2))^2));
f2 = @(t,z) 6*((8*z(4)-3*cos(z(1)-z(2))*z(3))/(16-9*cos(z(1)-z(2))^2));
f3 = @(t,z) -1/2*(f1(t,z)*f2(t,z)*sin(z(1)-z(2))+3*g/L*sin(z(1)));
f4 = @(t,z) -1/2*(-f1(t,z)*f2(t,z)*sin(z(1)-z(2))+g/L*sin(z(2)));
f = @(t,z) [f1(t,z);f2(t,z);f3(t,z);f4(t,z)];
%% dati inizilai
z0 = [pi/2;pi/2;0;0];
%% confronto RK4 e ode45
[tempo,z] = RK4_sist(f,t0,z0,T,N);
option = odeset('RelTol',1e-08,'AbsTol',1e-08);
[tempo_45,z_45] = ode45(f,[t0 T],z0,option);
teta1 = z(1,:);
teta2 = z(2,:);
teta1_45 = z_45(:,1);
teta2_45 = z_45(:,2);
%% confronto grafico teta_1 e teta_2 
% figure(1)
% subplot(1,2,1)
% plot(tempo,teta1,'r','linewidth',2)
% hold on
% plot(tempo_45,teta1_45,'--m','linewidth',2)
% legend('RK4','ode45')
% figure(1)
% subplot(1,2,2)
% plot(tempo,teta2,'b','linewidth',2)
% hold on
% plot(tempo_45,teta2_45,'--c','linewidth',2)
% legend('RK4','ode45')
%% calcolo posizioni dei due pendoli
x1P =  L*sin(teta1); 
y1P = -L*cos(teta1);
x2P = x1P + L*sin(teta2); 
y2P = y1P - L*cos(teta2);
%%
x1P_45 =  L*sin(teta1_45); 
y1P_45 = -L*cos(teta1_45);
x2P_45 = x1P_45 + L*sin(teta2_45); 
y2P_45 = y1P_45 - L*cos(teta2_45);

%% confronto grafico traiettorie complete
% figure(2)
% plot(x1P,y1P,'r',x2P,y2P,'g')
% hold on
% plot(x1P_45,y1P_45,'--m',x2P_45,y2P_45,'--k')
% legend('traiettoria pendolo 1 RK4','traiettoria pendolo 2 RK4','traiettoria pendolo 1 ode45','traiettoria pendolo 2 ode45')


%% simulazione moto del pendolo
% clear x1P x2P y1P y2P x1P_45 x2P_45 y1P_45 y2P_45
for i = 1:N+1
    x1P(i) =  L*sin(teta1(i)); 
    y1P(i) = -L*cos(teta1(i));
    x2P(i) = x1P(i) + L*sin(teta2(i)); 
    y2P(i) = y1P(i) - L*cos(teta2(i));
    %%
%     x1P_45(i) =  L*sin(teta1_45(i)); 
%     y1P_45(i) = -L*cos(teta1_45(i));
%     x2P_45(i) = x1P_45(i) + L*sin(teta2_45(i)); 
%     y2P_45(i) = y1P_45(i) - L*cos(teta2_45(i));
%     figure(3)
%     subplot(1,2,1)
    plot(0,0,'ob','linewidth',2,'markersize',4);
    hold on
    plot([0 x1P(i)],[0,y1P(i)],'k',[x1P(i) x2P(i)],[y1P(i),y2P(i)],'k',x1P(i),y1P(i),'.r',x2P(i),y2P(i),'.g','linewidth',3,...
        'markersize',30)
    axis([-2*L 2*L -2*L-.5 2*L])
    title('Solutore RK4')
    hold off
    figure(3)
    subplot(1,2,2)
    plot(x1P,y1P,'-r',x2P,y2P,'-g','linewidth',1)
    axis([-2*L 2*L -2*L-.5 2*L])
    title('Solutore RK4')
    hold on
    %%
%     figure(4)
%     subplot(1,2,1)
%     plot(0,0,'ob','linewidth',2,'markersize',4);
%     hold on
%     plot([0 x1P_45(i)],[0,y1P_45(i)],'k',[x1P_45(i) x2P_45(i)],[y1P_45(i),y2P_45(i)],'k',x1P_45(i),y1P_45(i),'.r',x2P_45(i),y2P_45(i),'.g','linewidth',3,...
%         'markersize',30)
%     axis([-2*L 2*L -2*L-.5 2*L])
%     title('Solutore ode45')
%     hold off
%     figure(4)
%     subplot(1,2,2)
%     plot(x1P_45,y1P_45,'-r',x2P_45,y2P_45,'-g','linewidth',1)
%     axis([-2*L 2*L -2*L-.5 2*L])
%     title('Solutore ode45')
%     hold on
%     pause(0.01)
end
