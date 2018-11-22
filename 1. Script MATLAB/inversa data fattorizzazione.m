%conoscendo la fattorizzazione della matrice, calcolare l'inversa
clc
clear all

%PA=LU <=> (PA)^-1=(LU)^-1 <=> A^-1 = L^-1*U^-1*P
A=rand(4);
[L,U,P]=lu(A); %Data dal problema 

invA=inv(U)*inv(L)*P;
