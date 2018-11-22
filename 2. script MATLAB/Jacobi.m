function [x] = Jacobi(A,b,x0,iteraz)
% scrivere una function che implementi il metodo di Jacobi per
% risolvere un sistema lineare Ax=b passando in ingresso A,b, x0 e il 
% numero di iterazioni da effettuare.
% Lo si applichi poi per la risoluzione del sistema lineare 
% A=[3 0 4; 7 4 2; -1 -1 -2];
% b=[7;13;-4]

M=diag(diag(A));
N=A-M;
x=x0; %casuale: solo per inizializzarlo
for k=1:iteraz
    x=M\(-N*x+b);
end
    
end

