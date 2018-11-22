%EXERCISE ESERCIZI SISTEMI LINEARI DETERMINATI
%1- Sia A una matrice simmetrica tridiagonale di ordine 18 con gli elementi
%della diagonale principale uguali a 6 e quelli delle codiagonali (inferiore
%e superiore) uguali a 3. Sia B una matrice di ordine 18x3, il  cui j-esimo
%vettore colonna b_j e' definito da elementi equispaziati in [0,j], j=1,2,3.
%Risolvere i sistemi Ax_j=b_j. La norma 2 del vettore sum{j=1}^{3}x^(j) vale 
%all'incirca:                [ris. 1.8845] 
%(esercizio 3 scheda martedì 8 maggio 2018)
clear all
A=diag(6*ones(18,1))+diag(3*ones(17,1),-1)+diag(3*ones(17,1),1);
B=[linspace(0,1,18)' linspace(0,2,18)' linspace(0,3,18)'];
x=A\B(:,1)+A\B(:,2)+A\B(:,3);
disp('------risultato esercizio 1');
disp(norm(x))

%soluzione più "bella" (che però evita di creare la matrice B ma solo i
%vettori colonna b_j"
clear all
A=diag(6*ones(18,1))+diag(3*ones(17,1),-1)+diag(3*ones(17,1),1);
x=zeros(18,1); %inizializzazione
for i=1:3
    x=x+A\linspace(0,i,18)'; %risolvo il primo sistema,sommo in x e riparto
end
disp('------risultato esercizio 1 "più bella" ');
disp(norm(x))

%2-Sia Ax=b un sistema lineare di ordine 18, ove A e' simmetrica e tridiagonale
%con tutti gli elementi uguali a 6 sulla diagonale principale e uguali a 3 sulle
%codiagonali superiore e inferiore e  b ha elementi equispaziati in [5,8]. 
%Calcolare gli autovalori della matrice A e, in base alla proprieta' di 
%quest'ultimi, risolvere il sistema lineare Ax=b mediante la risoluzione di
%due sistemi triangolari, utilizzando la fattorizzazione di A piu' efficiente
%in termini di costo computazionale. La norma  1 del vettore ottenuto come 
%somma del vettore soluzione del sistema triangolare inferiore associato al 
%metodo e del vettore soluzione del sistema triangolare superiore, vale all'incirca:
%                [ris. 4.4944e+01]

A=diag(6*ones(18,1))+diag(3*ones(17,1),-1)+diag(3*ones(17,1),1);
b=linspace(5,8,18)';
d=eig(A); %gli autovalori sono tutti >0 => la matrice è sim.def.pos =>Cholesky
R=chol(A);
y=R'\b;
x=R\y;
disp('------risultato esercizio 2');
disp(norm(y+x,1)); 

%3-A=M-10I dove M è la matrice generata dal comando magic(432) e I la
%matrice identità. Sia b il termine noto tale che la soluzione del sistema
%lineare Ax=b sia il vettore di tutti elementi unitari. Si risolva il
%sistema con il metodo di eliminazione di Gauss implementato nativamente in
%MATLAB. Sia Nr la norma infinito del residuo b-Ax. Quale tra i seguenti
%valori è più vicino a Nr:         
%                       [ris. 8.9 e-08]
clear all

A=magic(432)+10*eye(432);
b=sum(A,2);
x=A\b;
risultato=norm(b-A*x,inf);
disp('------risultato esercizio 3');
disp(risultato); %NB: si chiede il PIU' VICINO tra le risposte proposte

%4-Siano H la matrice di Hilbert di ordine 10 (comando hilb), I la matrice
%identita' e A=H+0.001I. Sia b il vettore colonna tale che la soluzione del
%sistema lineare Ax=b sia il vettore contenente gli opposti dei primi 10 numeri 
%pari (-2,-4,...,-20). Sia N_e l'errore assoluto in norma infinito tra la 
%soluzione ottenuta risolvendo il sistema con il metodo di eliminazione gaussiana
%implementato nativamente in MATLAB e la soluzione esatta. Quale tra i 
%seguenti valori e' piu' vicino a N_e?    [ris. 1.3e-12]
clear all

A=hilb(10)+0.001*eye(10);
xesatta=(-2:-2:-20)';
b=zeros(10,1);
for i=1:10
    k=-2;
for j=1:10
b(i,1)=b(i,1)+A(i,j)*k;  %sommo tutta la riga moltiplicando -2,-4..ad ogni coeff e metto in b 
k=k-2;
end
end
x=A\b;
disp('------risultato esercizio 4');
disp(norm(x-xesatta,inf));  %N.B E' CHIESTO IL PIU' VICINO