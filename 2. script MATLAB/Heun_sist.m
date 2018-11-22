function [x,y] = Heun_sist(f,x0,y0,xN,N)
% x memorizza i nodi del reticolo
% y memorizza le approssimazioni della soluzione

x = linspace(x0,xN,N+1);
h = (xN-x0)/N;
m = length(y0);
y = zeros(m,N+1);
y(:,1) = y0;
for n = 1:N
    K1 = f(x(n),y(:,n));
    K2 = f(x(n+1),y(:,n)+h*K1);
    y(:,n+1) = y(:,n) + h/2*(K1+K2);
end


end

