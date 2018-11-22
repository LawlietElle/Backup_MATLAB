function 0gershgorin(A)
n = size(A,1);
% cerchi riga
figure(1)
centro = diag(A);
raggio_riga = sum(abs(A),2)-diag(abs(A));
theta = linspace(0,2*pi);
for i=1:n
    x = centro(i)+raggio_riga(i)*cos(theta);
    y = raggio_riga(i)*sin(theta);
    patch(x,y,'r','FaceAlpha',.2)
    axis equal
    hold on
end
plot(centro,zeros(n,1),'k*','linewidth',2) %rappresenta i centri dei cerchi
title('cerchi riga')
grid on;
% cerchi colonna
hold on
centro = diag(A);
raggio_colonna = sum(abs(A),1)'-diag(abs(A));
theta = linspace(0,2*pi);
for i=1:n
    x = centro(i)+raggio_colonna(i)*cos(theta);
    y = raggio_colonna(i)*sin(theta);
    patch(x,y,'g','FaceAlpha',.2)
    axis equal
    hold on
end
plot(centro,zeros(n,1),'k*','linewidth',2) %rappresenta i centri dei cerchi
title('cerchi colonna')
