function [x,y] = RK4_sist(f,x0,y0,xN,N)
% x memorizza i nodi del reticolo
% y memorizza le approssimazioni della soluzione

x = linspace(x0,xN,N+1);
h = (xN-x0)/N;
m = length(y0);
y = zeros(m,N+1);
y(:,1) = y0;
for n = 1:N
    K1 = f(x(n),y(:,n));
    K2 = f(x(n)+h/2,y(:,n)+h/2*K1);
    K3 = f(x(n)+h/2,y(:,n)+h/2*K2);
    K4 = f(x(n+1),y(:,n)+h*K3);
    y(:,n+1) = y(:,n) +h/6*(K1+2*K2+2*K3+K4);
end


end

