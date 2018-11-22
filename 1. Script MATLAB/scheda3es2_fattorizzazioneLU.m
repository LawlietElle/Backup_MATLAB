%scheda 3 es2
%condizioni di risoluzione sistema del tipo Ax=b
% 1. rank max 
% 2. b in Im(A)
%Ax=b <=> PAx=Pb <=> LUx=Pb <=> Ly=Pb, Ux=y (risoluzione computazionalmente
% più efficiente) 
clear all
clc

n=100;
A=zeros(n,n); %inizializzazione A (efficienza)

%riempimento A
for i=1:n
    for j=1:n
        A(i,j)=max(i,j);
    end
end

b=sum(A,2);

%implementazione PA=LU
[L,U,P]=lu(A);

y=L\P*b;
x=U\y;

%inversa di una matrice 

% fattorizzando (PA)^-1=(LU)^-1 <=> A^-1 = U^-1 L^-1 P

tic %tic ... toc misura il tempo dell'operazione%
invAlu=inv(U)*inv(L)*P;
toc


