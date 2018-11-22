%esercitazione 2: approssimazione di funzioni e di dati

clear all
close all
clc
format short e

disp('***********************************************')
disp('*****************esercizio_2_1*****************')
disp('***********************************************')

a = -5;
b = 5;
f = @(x) 1./(1+x.^2); 
z = linspace(a,b);
fz = f(z);
for n = 5:4:13
   x=linspace(a,b,n+1); %nodi equisp
   %t = -cos((2*(1:n+1)-1)*pi/(2*(n+1))); x = (b-a)/2*t+(b+a)/2; %nodi Chebyshev traslati
   y = f(x);
   c = polyfit(x,y,n);
   p = polyval(c,z);
   plot(z,p,'b',z,fz,'r',x,y,'ko','linewidth',3)
   pause
end

disp('**********************************************FINE ESERCIZIO**********************************************')
pause
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear all
close all
clc
disp('***********************************************')
disp('*****************esercizio_2_2*****************')
disp('***********************************************')

a = 0;
b = pi;
f = @(x) sin(x); 
%a = -2*pi;
%b = 2*pi;
%f = @(x) 1./(1+x.^2); 
z = linspace(a,b);
fz = f(z);
for n = 5:5:15
   x = linspace(a,b,n+1); %nodi equisp
   y = f(x);
   c1 = polyfit(x,y,n);
   p1 = polyval(c1,z);
   err1 = norm(p1-fz,inf)
   err1_100 = abs(p1-fz);
   t = -cos(((1:n+1)-1)*pi/n); 
   x = (b-a)/2*t+(b+a)/2; %nodi Chebyshev-Lobatto traslati
   y = f(x);
   c2 = polyfit(x,y,n);
   p2 = polyval(c2,z);
   err2 = norm(p2-fz,inf)
   err2_100 = abs(p2-fz);
   figure(1)
   plot(z,p1,'b',z,p2,'r',z,fz,'g',x,y,'ko','linewidth',3)
   legend('equispaziati','Chebyshev-Lobatto','sin(x)','dati interp')
   figure(2)
   plot(z,err1_100,'b',z,err2_100,'r','linewidth',3)
   legend('equispaziati','Chebyshev-Lobatto')
   pause
end
disp('**********************************************FINE ESERCIZIO**********************************************')
pause
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

close all
clear all
clc
disp('***********************************************')
disp('*****************esercizio_2_3*****************')
disp('***********************************************')

a = -5;
b = 5;
f = @(x) 1./(1+x.^2); 
z = linspace(a,b);
fz = f(z);
for n = 6:4:14
    x = linspace(a,b,n);
    y = f(x);
    s = spline(x,y,z);
    plot(x,y,'ko',z,fz,'r',z,s,'b','linewidth',3)
    err = norm(s-fz,inf)
    pause
end    

disp('**********************************************FINE ESERCIZIO**********************************************')
pause
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
close all
clear all
clc
disp('***********************************************')
disp('*****************esercizio_2_4*****************')
disp('***********************************************')
f = @(x) (1-x.^2).^(5/2);
fd = @(x) (5/2)*(1-x.^2).^(5/2-1).*(-2*x);
f0 = fd(-1);
fn = fd(1);
z = linspace(-1,1);
fz = f(z);
for k = 2:5
    n = 2^k;
    x = -1+2*(0:n)/n;
    y = f(x);
    s = spline(x,y,z);
    s1 = spline(x,[f0 y fn],z);
    figure(1)
    plot(x,y,'ko',z,fz,'r',z,s,'b',z,s1,'g','linewidth',3)
    legend('dati','f(x)','spline not-a-knot','spline vincolata')
    pause
    figure(2)
    semilogy(z,abs(s-fz),'b',z,abs(s1-fz),'g','linewidth',3)
    legend('errore spline not-a-knot','errore spline vincolata')
    err = norm(fz-s,inf)
    err1 = norm(fz-s1,inf)
    pause
end    
% la spline vincolata fornisce un'approssimazione più
% accurata della spline not-a-knot in quanto, a differenza di
% quest'ultima, oltre alle condizioni di interpolazione, soddisfa
% due ulteriori condizioni che la collegano alla funzione f

disp('**********************************************FINE ESERCIZIO**********************************************')
pause
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

close all
clear all
clc
disp('***********************************************')
disp('*****************esercizio_2_5*****************')
disp('***********************************************')

x = 1:20;
y = [243 209 181 179 180 166 163 157 187 192 138 95 56 32 21 12 11 61 146 186];
z = linspace(1,20,1000);
s1 = interp1(x,y,z);
plot(z,s1,'b',x,y,'ko','linewidth',3)
hold on
s11 = interp1(x,y,[2.5 19.5])
plot([2.5 19.5],s11,'go','linewidth',3)
grid on
disp('**********************************************FINE ESERCIZIO**********************************************')
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

