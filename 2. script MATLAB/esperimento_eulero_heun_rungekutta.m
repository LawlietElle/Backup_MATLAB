x0=0;
xN=1;
y0=1;
sol_esatta=@(x) exp(x);
f=@(x,y) y;

for k=2:8
    N=2^k;
    [xE,yE]=Eulero_espl(f,x0,y0,xN,N);
    [xH,yH]=Heun(f,x0,y0,xN,N);
    [xRK,yRK]=Runge_Kutta4(f,x0,y0,xN,N);
    xplot=linspace(x0,xN,200);
    plot(xplot, sol_esatta(xplot), 'r', xE,yE, 'ob', xH,yH, '*g', xRK,yRK, 'sc', 'linewidth',2,'markersize',8)
    grid on
    legend('esatta','Eulero esplicito','heun', 'Runge Kutta')
    err_assE(k-1)=abs(yE(N+1)-sol_esatta(xN));
    err_assH(k-1)=abs(yH(N+1)-sol_esatta(xN));
    err_assRK(k-1)=abs(yRK(N+1)-sol_esatta(xN));
    disp(err_assE)
    disp(err_assH)
    disp(err_assRK)
end   

    