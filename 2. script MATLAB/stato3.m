l1 = -0.1+4*1i;
l2 = conj(l1);
l3 = -5;

wp = [1, 1, 0]';
ws = [1, -1, 0.3]';
w1 = wp+1i*ws;
w2 = conj(w1);
w3 = [0, 1.5, 5]';

Lam = diag([l1, l2, l3]);
P = [w1, w2, w3];

A = P*Lam\P;

t = 0:0.01:50;

y1 = exp(Lam(1,1)*t);
y2 = exp(Lam(2,2)*t);
y3 = exp(Lam(3,3)*t);

x1 = P(1,1)*y1+P(1,2)*y2+P(1,3)*y3;
x2 = P(2,1)*y1+P(2,2)*y2+P(2,3)*y3;
x3 = P(3,1)*y1+P(3,2)*y2+P(3,3)*y3;

plot3(x1,x2,x3,'linewidth',2); set(gca,'box','on');grid
hold all
plot3(x1(end),x2(end),x3(end),'.','markersize',20);