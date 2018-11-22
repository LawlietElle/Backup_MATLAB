%parametrizzazione rettangolo di coordinate O(0,0), A(0,2), B(1,0),C(1,1)
clear all
clc

%punti
O=[0 ; 0];
A=[2 ; 0];
B=[2 ; 3];
C=[0 ; 3];

%parametro 
t=linspace(0,4,4001);

% inizializzazione gamma
gamma_x=zeros(size(t));
gamma_y=zeros(size(t));

%O->A
gamma1_x=O(1)+t*(A(1)-O(1));
gamma1_y=O(2)+t*(A(2)-O(2));
%t in [0,1]
gamma_x(t>=0 & t<=1)=gamma1_x(t>=0 & t<=1);
gamma_y(t>=0 & t<=1)=gamma1_y(t>=0 & t<=1);


%A->B
gamma2_x=A(1)+(t-1)*(B(1)-A(1));
gamma2_y=A(2)+(t-1)*(B(2)-A(2));
%t in (1,2]
gamma_x(t>1 & t<=2)=gamma2_x(t>1 & t<=2);
gamma_y(t>1 & t<=2)=gamma2_y(t>1 & t<=2);

%B->C
gamma3_x=B(1)+(t-2)*(C(1)-B(1));
gamma3_y=B(2)+(t-2)*(C(2)-B(2));
%t in (2,3]
gamma_x(t>2 & t<=3)=gamma3_x(t>2 & t<=3);
gamma_y(t>2 & t<=3)=gamma3_y(t>2 & t<=3);

%C->O
gamma4_x=C(1)+(t-3)*(O(1)-C(1));
gamma4_y=C(2)+(t-3)*(O(2)-C(2));
%t in (3,4]
gamma_x(t>3 & t<=4)=gamma4_x(t>3 & t<=4);
gamma_y(t>3 & t<=4)=gamma4_y(t>3 & t<=4);

figure
plot(gamma_x, gamma_y, 'b')
hold on
plot(O(1),O(2),'r.',A(1),A(2),'r.',B(1),B(2),'r.', C(1),C(2),'r.') % disegno i 3 punti

txt1='O';
txt2='A';
txt3='B';
txt4='C';
text(O(1),O(2),txt1)
text(A(1),A(2),txt2)
text(B(1),B(2),txt3)
text(C(1),C(2), txt4)

grid on
axis equal

%axis([-4,4,-4,4])