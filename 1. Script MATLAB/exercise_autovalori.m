%1-data la matrice A generata con il comando pascal(8) quanto vale
%all'incirca la distanza in norma 2 di A dall'insieme delle matrici di
%rango 5?                  [ris.8.3730e-02]
A=pascal(8);
s=svd(A);
disp('------risultato esercizio 1');
disp(s(6));

%2- Generare la matrice A tridiagonale di ordine 16 con gli elementi tutti
%uguali a 5 sulla diagonale principale e uguali a 7 e -7 rispettivamente
%sulle diagonali superiore ed inferiore. Successivamente generare il
%vettore termine noto con le componenti equispaziate in [0,1] e risolvere
%il sistema Ax=b utilizzando la decomposizione ai valori singolari della
%matrice A. Indicata con y la soluzione del sistema lineare associato alla
%matrice S dei valori singolari e all'algoritmo richiesto, la quantità
%||x||_2 + ||y||_2 vale:              [ris. 8.4707e-01]
clear all

A=zeros(16);
A=diag(5*ones(16,1))+diag(7*ones(15,1),1)+diag(-7*ones(15,1),-1);
b=linspace(0,1,16);
[U,S,V]=svd(A);
y=S\(U'*b');
x=V'\y;
disp('------risultato esercizio 2');
disp(norm(x)+norm(y));

%3-Sia data la matrice A di ordine n=12 le cui componenti sono definite
%a_ij={ 2i se i=j  -2/j se i<j  2/j se i>j} 
%il suo raggio spettrale vale:          [ris. 23.9216]
clear all

A=zeros(12);
for i=1:12
    for j=1:12
        if i==j
            A(i,j)=2*i;
        elseif i<j
            A(i,j)=-2/j;
        else
            A(i,j)=2/j;
        end
    end
end

disp('-----risultato esercizio 3');
disp(max(abs(eig(A))));

%4-Sia x un vettore costituito da 10 elementi equispaziati in [0,1] e sia A 
%la matrice generata con il comando  A=vander(x).Determinare la matrice A_n
%di rango 7 piu' vicina in norma 2 ad A. La norma infinito di A_n vale 
%all'incirca:                     [1.0000e+01]
clear all

A=vander(linspace(0,1,10));
[U,S,V]=svd(A);
An=zeros(10); %inizializzazione
for i=1:7
    An=An+S(i,i)*U(:,i)*V(:,i)';
end
disp('------risultato esercizio 4');
disp(norm(An,inf));
            
%5-Sia x il vettore costituito da 16 elementi equispaziati in [0,1] e sia A
%la matrice generata con A=Vander(x). Determinare la matrice A_n di rango 5
%più vicina in norma 2 ad A e la minima distanza.
clear all

x=linspace(0,1,6);
A=vander(x);
%calcolo minima distanza da matrici di rango 5
s=svd(A);
smin=(6);
[U,S,V]=svd(A);
A5=U(:,1:5)*S(1:5,1:5)*V(1:5,:);

%6-Eseguire 6 iterazioni del metodo QR applicato alla matrice di Hilbert A 
%di ordine 18. Denotati con /lambda_i le approssimazioni degli autovalori di A 
%e con lambda_i gli autovalori ottenuti con il comando eig, il max errore massimo 
%assoluto max(abs(/lambda_i-lambda_i)) vale all'incirca:  
%                                                        [ris. 7.1563e-08]
clear all

A=hilb(18);
c=eig(A);
m_max=6;
for m=1:m_max
     [Q,R]=qr(A);
     A=R*Q;
end
d=diag(A);
disp('------risultato esercizio 6')
disp( max(abs(c-sort(d))) )%OCCHIO AL SORT

%7-A partire dal vettore unitario, eseguire 4 iterazioni del metodo delle 
%potenze inverse applicato alla matrice generata con il comando A=pascal(6)
%di ordine 6. L'errore assoluto associato all'approssimazione dell'autovalore
%più vicino a p=2 (si prenda come valore di riferimento quello ottenuto con 
%il comando eig), vale all'incirca:
%                                        [ris.  3.0e-12]
clear all

A=pascal(6);
p=2;
m_max=4;
z=ones(6,1);
n=size(A);
w=z/norm(z);
lambda=0;
[L,U,P] = lu(A-p*eye(n));
for i = 1:m_max
    y = L\(P*w); 
    z = U\y; 
    lambda_p = p+1/(w'*z);
    w = z/norm(z); 
    lambda = lambda_p;
end
d=eig(A); %vendo qui vedo che il più vicino a 2 è in posizione 4
disp('------risultato esercizio 7');
disp(max(abs(d(4)-lambda)));

%8-A partire dal vettore unitario, eseguire 24 iterazioni del metodo delle
%potenze applicato alla matrice generata con il comando A=vander(x), ove 
%x e' un vettore di 10 elementi equispaziati in [-1,1]. La terza componente
%dell'approssimazione dell'autovettore di norma 2 unitaria, associato all'
%autovalore di modulo massimo vale all'incirca:      [ris. 1.4778e-01]
clear all

A=vander(linspace(-1,1,10));
z=ones(10,1);
m_max=24;
lambda=0;
w=z/norm(z);
for i=1:m_max
    z=A*w;
    lambda_max=w'*z;
    w=z/norm(z);
    lambda=lambda_max;
end
disp('------risultato esercizio 8');
disp(w(3));