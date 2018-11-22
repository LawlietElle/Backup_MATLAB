% parametrizzare il triangolo di coordinate O=(0,0), A=(2,0), B=(2,3)
clear all
clc

% coordinate dei punti 
O=[0 ; 0]; 
A=[2 ; 0];
B=[2 ; 3];

% parametro t relativo all'intera parametrizzazione del triangolo
t=linspace(0,3,301);
% inizializzo gamma
gamma_x=zeros(size(t));
gamma_y=zeros(size(t));


% gamma1: da O->A , lambda1=t 
gamma1_x=O(1)+(A(1)-O(1))*t;
gamma1_y=O(2)+(A(2)-O(2))*t;
% considero gamma1 solo per t in [0,1];
gamma_x(t<=1 & t>=0)=gamma1_x(t<=1 & t>=0);
gamma_y(t<=1 & t>=0)=gamma1_y(t<=1 & t>=0);

% gamma2: da A->B , lambda2=t-1
gamma2_x=A(1)+(B(1)-A(1))*(t-1);
gamma2_y=A(2)+(B(2)-A(2))*(t-1);
% considero gamma2 solo t in [1,2];
gamma_x(t<=2 & t>=1)=gamma2_x(t<=2 & t>=1);
gamma_y(t<=2 & t>=1)=gamma2_y(t<=2 & t>=1);

% gamma3: da B->O , lambda3=t-2
gamma3_x=B(1)+(O(1)-B(1))*(t-2);
gamma3_y=B(2)+(O(2)-B(2))*(t-2);
% considero gamma3 solo t in [2,3];
gamma_x(t<=3 & t>=2)=gamma3_x(t<=3 & t>=2);
gamma_y(t<=3 & t>=2)=gamma3_y(t<=3 & t>=2);

figure
plot(gamma_x,gamma_y,'b') % disegno gamma
hold on
plot(O(1),O(2),'r.',A(1),A(2),'r.',B(1),B(2),'r.') % disegno i 3 punti
grid on
axis equal