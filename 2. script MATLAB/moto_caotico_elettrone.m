clear all
close all
A=0; %per vedere le linee verdi
%A=1% per non vederle
N=40;
x=linspace(-0.5,5,300);
y1=0.5*ones(1,300);
y2=-y1;
r=rand(1,N);
w=-0.5+rand(1,N);
xp=rand;
yp=-0.5+rand;
q=0;
s=0.4;
jmax=10;
x0=xp;
y0=yp;
for i=1:N
    if(flag==0)
        dx=-s+2*s*r(i);
        dy=(w(i)/abs(w(i)))*sqrt(s^2-dx^2);
    else
        dx=0.1+0.3*rand;
        dy=(w(i)/abs(w(i)))*sqrt(s^2-dx^2);
    end
    
    if((xp+dx)>=q && (xp+dx)<=(q+1))
        xpf=xp+dx;
    else
        xpf=xp-dx;
    end

if((yp+dy)>=-0.5 && (yp+dy)<=0.5)
ypf=yp+dy;
else
ypf=yp-dy;
end
plot(xp,yp,'.r', 'MarkerSize', 15)
hold on
for j=1:jmax
flag=0;
plot(x,y1,'k',x,y2,'k');
axis equal
q0=q+1/100;
z1=x0+(xpf-xp)/jmax;
z2=y0+(ypf-yp)/jmax;
if(z1>=q0 && z1<=(q0+1) && z2>=-0.5 && z2<=0.5)
q=q0;
hold on
if(A==0)
plot([q,q],[0.5,-0.5],'g--',[q+1,q+1],[0.5,-0.5],'g--', 'linewidth',1.4)
end
hold on
x0=z1;
y0=z2;
plot(x0,y0,'.r', 'MarkerSize', 16)
pause(0.01)
else
j=jmax;
flag=1;
end
hold off
end
xp=x0;
yp=y0;
end