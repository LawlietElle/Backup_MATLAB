function [x,y] = Eulero_espl(f,x0,y0,xN,N) 
x = linspace(x0,xN,N+1);
h = (xN-x0)/N; 
y = y0*ones(1,N+1); 

for n=1:N 
    fn = f(x(n),y(n));
    y(n+1) = y(n) + h*fn; 
end

