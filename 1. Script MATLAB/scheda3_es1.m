%all'aumentare di n aumenta SPAVENTOSAMENTE l'errore e le soluzioni sono
%tutte errate. Il problema � il mal condizionamento della matrice di
%Hilbert
clear all
clc

format long e
n=2; % da testo
A=hilb(n);

%soluzioni
x_esatto=ones(n,1);
b=sum(A,2); %ora b � un vettore colonna che contiene la somma di ogni riga

x=A\b; 

%calcolo condizionamento
cond_inf=cond(A,inf)
err_rel=norm(x_esatto-x, inf)/norm(x,inf)

%la soluzione esatta � tutti 1
%quella calcolata da matlab � <digita x>

