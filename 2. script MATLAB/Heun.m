function [x,y] = Heun(f,x0,y0,xN,N)  
%  x= nodi intervallo
%  y=approssimazioni della soluzione

x = linspace(x0,xN,N+1);
h = (xN-x0)/N;
y(1)=y0;
%oppure y = y0*ones(1,N+1);

%main loop
for n=1:N 
    K1 = f(x(n),y(n)); 
    K2 = f(x(n+1),y(n)+h*K1); 
    y(n+1) = y(n) + h/2*(K1+K2); 
end

