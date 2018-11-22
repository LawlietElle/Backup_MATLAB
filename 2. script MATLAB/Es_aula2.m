%% y'(x) = -10^3*y(x) in [0,1]  %% problema stiff
%% y(0) = 1
clear all
close all
sol_esatta = @(x) exp(-10^3*x);
x0 = 0;
xN = 0.05;
f = @(x,y) -10^3*y;
y0 = 1;

for k = 2:10
    N = 2^k;
    %%
    [xE,yE] = Eulero_espl(f,x0,y0,xN,N);
    [xH,yH] = Heun(f,x0,y0,xN,N);
    [xRK4,yRK4] = Runge_Kutta4(f,x0,y0,xN,N);
    %%
    xplot = linspace(x0,xN,200);
    plot(xplot,sol_esatta(xplot),'r',xE,yE,'o--b',xH,yH,'*--g',...
        xRK4,yRK4,'s--c','linewidth',2,'markersize',8)
    legend('esatta','Eul espl','Heun','RK4')
    err_assE(k-1) = abs(yE(N+1)-sol_esatta(xN));
    err_assH(k-1) = abs(yH(N+1)-sol_esatta(xN));
    err_assRK4(k-1) = abs(yRK4(N+1)-sol_esatta(xN));
    h(k-1) = (xN-x0)/N;
    pause
end



disp('     h           Eul. espl            Heun      RK4')
[h' err_assE' err_assH' err_assRK4']