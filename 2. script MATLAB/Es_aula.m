%% y'(x) = y(x) in [0,1]
%% y(0) = 1
clear all
close all
sol_esatta = @(x) exp(x);
x0 = 0;
xN = 1;
f = @(x,y) y;
y0 = 1;

for k = 2:8
    N = 2^k;
    %%
    [xE,yE] = Eulero_espl(f,x0,y0,xN,N);
    [xH,yH] = Heun(f,x0,y0,xN,N);
    [xRK4,yRK4] = RK4(f,x0,y0,xN,N);
    %%
    xplot = linspace(x0,xN,200);
    plot(xplot,sol_esatta(xplot),'r',xE,yE,'ob',xH,yH,'*g',xRK4,yRK4,'sc','linewidth',2,'markersize',8)
    legend('esatta','Eul espl','Heun','RK4')
    err_relE(k-1) = abs(yE(N+1)-sol_esatta(xN))/abs(sol_esatta(xN));
    err_relH(k-1) = abs(yH(N+1)-sol_esatta(xN))/abs(sol_esatta(xN));
    err_relRK4(k-1) = abs(yRK4(N+1)-sol_esatta(xN))/abs(sol_esatta(xN));
    h(k-1) = (xN-x0)/N;
    pause
end
err_relE
disp('     h           Eul. espl            Heun      RK4')
[h' err_relE' err_relH' err_relRK4']