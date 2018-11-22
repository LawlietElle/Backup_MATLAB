function [x,y] = Eulero_esp_sist(f,x0,y0,xN,N) 
x = linspace(x0,xN,N+1);
h = (xN-x0)/N;
m = length(y0); 
y = zeros(m,N+1);
y(:,1) = y0;
for n=1:N
    fn = f(x(n),y(:,n));
    y(:,n+1) = y(:,n) + h*fn; 
end

