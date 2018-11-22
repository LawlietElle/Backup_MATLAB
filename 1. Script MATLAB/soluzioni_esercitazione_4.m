%esercitazione 4: autovalori e valori singolari
clc
disp('***********************************************')
disp('*****************esercizio_4_1*****************')
disp('***********************************************')

clear all
close all
format long e
n = 100;

% per generare A1 si procede nel seguente modo:
% 1) si genera il vettore p i cui elementi sono n,n-1,,...,2,1
% 2) con il comando p(ones(n,1), :) si ripete n volte il vettore p
% e si genera una matrice le cui n righe sono tutte uguali al 
% vettore p; 
% 3) con il comando diag( ones(n-1,1), -1) si genera una matrice i cui 
% elementi sono tutti uguali a zero tranne quelli della codiagonale 
% inferiore che sono uguali a 1;
% 4) infine, con triu(A,-1) si estraggono gli elementi di A a partire 
% dalla codiagonale inferiore e si pongono uguali a 0 quelli 
% sotto la codiagonale inferiore

p = n:-1:1;
A1 = triu( p( ones(n,1), :) - diag( ones(n-1,1), -1), -1 );

% si calcolano gli autovalori di A1
lambda1 = eig(A1); 
% e si rappresentano graficamente
plot(real(diag(lambda1)),imag(diag(lambda1)),'r*','markersize',6)
hold on
% si genera la matrice perturbata A1p, perturbando
% gli elementi dell'ultima riga di A1
A1p = A1;
A1p(n,:) = A1p(n,:)+1.0e-10; 
% si calcolano gli autovalori di A1p
lambda1p = eig(A1p); 
% e si rappresentano graficamente
plot(real(diag(lambda1p)),imag(diag(lambda1p)),'ko','markersize',6)
pause

% dal grafico si deduce che il problema è mal condizionato in quanto
% a una piccola perturbazione negli elementi della matrice non è corrisposta 
% una perturbazione negli autovalori dello stesso ordine di grandezza

% il cattivo condizionamento è segnalato dal comando condeig:
% le componenti del vettore output, che rappresentano il 
% condizionamento di ciascun autovalore, risultano molto maggiore di 1
condizionamento_autovalori_A1 = condeig(A1)
hold off
close
pause

% si ripetono le stesse istruzioni precedenti per la matrice A2
A2 = triu(A1)+triu(A1,1)';
lambda2 = eig(A2);
plot(real(diag(lambda2)),imag(diag(lambda2)),'r*','markersize',6)
hold on
A2p = A2;
A2p(n,:) = A2p(n,:)+1.0e-10;
lambda2p = eig(A2p);
plot(real(diag(lambda2p)),imag(diag(lambda2p)),'ko','markersize',6)
pause
condizionamento_autovalori_A2 = condeig(A2)
err_mat_A2 = norm(A2-A2p)
err_eig_A2 = abs(sort(lambda2)-sort(lambda2p))
% In questo caso il problema è ben condizionato (la matrice è simmetrica) 
% e gli autovalori della matrice perturbata sono affetti da un errore che è 
% dello stesso ordine di grandezza (anzi più piccolo) dell'errore associato 
% alla matrice perturbata

disp('**********************************************FINE ESERCIZIO**********************************************')
pause
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clc
disp('***********************************************')
disp('*****************esercizio_4_2*****************')
disp('***********************************************')

clear all
close all
m_max = 100;
tol = 1.0e-10;
z = [1;2;3];
A_1 = [1 2 0; 1 0 0; 0 1 0];
[lambda_1,w1,m1] = potenze(A_1,z,tol,m_max)
plot(1:m1+1,lambda_1,'b+-','linewidth',2)
lambda_max_1=lambda_1(end)
autovalori_A_1_eig = eig(A_1)
% Il metodo converge abbastanza velocemente perché la rapidità 
% dipende dal rapporto |lambda_2|/|lambda_1|=1/2 e, pertanto,
% raggiunge la tolleranza tol in 35 iterazioni
pause
%%%%%
A_2 = [0.1 3.8 0; 1 0 0; 0 1 0];
[lambda_2,w2,m2] = potenze(A_2,z,tol,m_max)
plot(1:m2+1,lambda_2,'b+-','linewidth',2)
lambda_max_2 = lambda_2(end)
autovalori_A_2_eig = eig(A_2)
% Il metodo converge lentamente perché la rapidità 
% dipende dal rapporto |lambda_2|/|lambda_1|=1.9/2=0.95
% e, pertanto, 100 iterazioni non sono sufficienti per 
% raggiungere la tolleranza prefissata 
pause
%%%%%
A_3 = [0 -1 0; 1 0 0; 0 1 0];
[lambda_3,w3,m3] = potenze(A_3,z,tol,m_max)
plot(1:m3+1,lambda_3,'b+-','linewidth',2)
lambda_max_3 = lambda_3(end)
autovalori_A_3_eig = eig(A_3)
% Il metodo non converge perché A ha due autovalori i e -i
% complessi e coniugati di modulo massimo

disp('**********************************************FINE ESERCIZIO**********************************************')
pause
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clc
disp('***********************************************')
disp('*****************esercizio_4_3*****************')
disp('***********************************************')

clear all
close all
z = (1:3)';
A = [0.1 3.8 0; 1 0 0; 0 1 0];
for m_max = 500:300:1100
    [lambda,w,m] = potenze_no_norma(A,z,m_max);
    w
    pause
end
% Se non si normalizzano i vettori iterate si hanno problemi di overflow!

disp('**********************************************FINE ESERCIZIO**********************************************')
pause
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clc
disp('***********************************************')
disp('*****************esercizio_4_4*****************')
disp('***********************************************')

clear all
close all
m_max = 100;
tol = 1.0e-10;
z = ones(3,1);
p = 0.5;
A_1 = [1 -2 0; 0 2 0; 1 1 3];
[lambda_1,w1,m1] = potenze_inverse(A_1,p,z,tol,m_max)
plot(1:m1+1,lambda_1,'b+-','linewidth',2)
autovalore_p = lambda_1(end)
autovalori_A_1_eigs_tutti = eigs(A_1,3)
autovalori_A_1_eigs_p = eigs(A_1,1,p)
% Il metodo delle potenze inverse converge all'autovalore 1, 
% che è l'autovalore di A più vicino a p
pause

A_2 = [0.5 -2 0; 0 2 0; 1 1 3];
[lambda_2,w2,m2] = potenze_inverse(A_2,p,z,tol,m_max)
plot(1:m2+1,lambda_2,'b+-','linewidth',2)
autovalore_p = lambda_2(end)
autovalori_A_2_eigs_tutti = eigs(A_2,3)
autovalori_A_2_eigs_p = eigs(A_2,1,0.49)
% Il metodo delle potenze inverse non converge perché p=0.5 
% è autovalore di A e quindi (A-pI) non è invertibile!!! 
% Occorrerebbe prevedere un controllo
% sull'eventualità che p possa essere già autovalore
% di A; in tal caso, non ha senso applicare il metodo.
pause

A_3 = [0 -2 0; 0 1 0; 1 1 3];
[lambda_3,w3,m3] = potenze_inverse(A_3,p,z,tol,m_max)
plot(1:m2+1,lambda_3,'b+-','linewidth',2)
autovalore_p = lambda_3(end)
autovalori_A_3_eigS_tutti = eigs(A_3,3)
autovalori_A_3_eigs_p = eigs(A_3,2,p)
% Il metodo delle potenze inverse non converge perché p=0.5 è 
% equidistante dagli autovalori 0 e 1 della matrice A_3 e quindi 
% esistono due autovalori distinti (reali e opposti)
% di modulo massimo per la matrice (A-pI)^(-1)!

disp('**********************************************FINE ESERCIZIO**********************************************')
pause
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clc
disp('***********************************************')
disp('*****************esercizio_4_5*****************')
disp('***********************************************')

clear all
close all
m_max = 1000;
tol = 1.0e-14;
A = [5 0 1 -1; 0 2 0 -.5; 0 1 -1 1; -1 -1 0 0];
n = size(A,1);
z = ones(n,1);
gershgorin(A)
% Dall'analisi dei cerchi riga e dei cerchi colonna
% si osserva che c'è un solo autovalore di modulo 
% massimo che appartiene al cerchio di centro 5 e raggio 1
p = input('fornire p=') 
tic
[lambda,w,m] = potenze(A,z,tol,m_max)
tempo_potenze = toc
tic
[lambda_p,w,m] = potenze_inverse(A,p,z,tol,m_max)
tempo_potenze_inverse = toc
% Il numero delle iterazioni impiegate dal metodo delle potenze inverse
% per raggiungere la tolleranza desiderata dipende dalla scelta di p. 
% Scegliendo un valore di p molto vicino all'autovalore desiderato,
% il metodo delle potenze inverse potrebbe impiegare un numero di iterazioni 
% inferiore rispetto al metodo delle potenze.
% Ciononostante il metodo delle potenze inverse potrebbe risultare più 
% costoso del metodo delle potenze in quanto ad ogni passo richiede la 
% risoluzione di due sistemi triangolari. 
% Per esempio, scegliendo p=5.4, il tempo impiegato dal metodo delle potenze 
% per eseguire 35 iterazioni (sul mio PC) è inferiore a quello impiegato dal
% metodo delle potenze inverse per eseguire 12 iterazioni.

disp('**********************************************FINE ESERCIZIO**********************************************')
pause
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clc
disp('***********************************************')
disp('*****************esercizio_4_6*****************')
disp('***********************************************')

clear all
close all
n = 10;
A = hilb(n);
m_max = 100;
tol = 1.0e-14;
[d,m] = qr_base(A,tol,m_max);
err = abs(sort(eig(A))-sort(d))

% Il massimo errore assoluto associato agli autovalori
% determinati con il metodo QR è 1.3323e-15

B1 = [0 0 2; 1 0 1;  0 1 1];
n = size(B1,1);
b = eig(B1);
% La matrice B ha un autovalore reale e due complessi e coniugati.
% La convergenza del metodo QR nella sua forma base non è dunque
% garantita. Eseguiamo comunque 100 iterazioni del metodo.
A = B1;
for  m = 1:m_max
    [Q,R] = qr(A);
    A = R*Q;
end
A
% La struttura della matrice A che si ottiene alla 100-esima iterazione
% è quasi triangolare. Verifichiamo che gli autovalori che si deducono 
% dalla matrice finale A siano effettivamente approssimazioni degli 
% autovalori di B.
a = zeros(n,1);
a(1) = A(1,1);
a(2:3) = eig(A(2:3,2:3));
err = abs(sort(a)-sort(b))
% La forma base del metodo QR ha dunque fornito un'approssimazione degli 
% autovalori della matrice B.

% Ripetiamo lo stesso esercizio per la seguente matrice
B2 = [0 1 0 1; 2 0 4 -2; -1 0 -1 0; -1 2 1 0];
n = size(B2,1);
b = eig(B2);
A = B2;
for  m = 1:m_max
    [Q,R] = qr(A);
    A = R*Q;
end
A
a = zeros(n,1);
a(1:2) = eig(A(1:2,1:2));
a(3) = A(3,3);
a(4) = A(4,4);
err = abs(sort(a)-sort(b))
% Anche in questo caso, la forma base del metodo QR ha 
% fornito un'approssimazione degli autovalori della matrice B.

disp('**********************************************FINE ESERCIZIO**********************************************')
pause
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clc
disp('***********************************************')
disp('*****************esercizio_4_7*****************')
disp('***********************************************')

clear all
close all
format long e
for n = 5:5:100
    A = -ones(n);
    A = triu(A,1)+diag(ones(n,1));
    [U,S,V] = svd(A);
    determinante = det(A)
    rango = rank(A)
    s = diag(S);
    pause
end
% Il determinante della matrice A è 1 (prodotto degli elementi della diagonale)
% e, pertanto, il rango effettivo della matrice è n. 
% Il rango numerico (che è calcolato a meno di una tolleranza) è invece n-1, a 
% partire da un certo ordine n della matrice in poi! 
% Tale risultato va interpretato nel seguente modo: 
% al crescere di n la matrice si avvicina sempre di più 
% a una matrice singolare. Infatti, l'ultimo valore singolare s(n) decresce
% al crescere di n, e ciò conferma che la distanza della matrice assegnata
% dall'insieme delle matrici di rango n-1 diminuisce all'aumentare di n.
% Si osservi che tale comportamento non si deduce dal valore del
% determinante, che è costantemente uguale a 1, ma dal rango numerico ovvero 
% dai valori singolari della matrice.
disp('**********************************************FINE ESERCIZIO**********************************************')
pause
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clc
disp('***********************************************')
disp('*****************esercizio_4_8*****************')
disp('***********************************************')

clear all
close all
format short e
A = [3 -2 1 2; -1 0 2 1; 0 5 -6 -1; 1 1 -1 1; 1 -1 -1 -1; 8 -1 -5 2];
b = [1; -3; 7; 0; -6; 2];
r = rank(A); % la matrice ha rango 3
rangoAb = rank([A b]); % la matrice orlata ha rango 4
% Il sistema non ammette soluzione classica e
% si calcola la soluzione ai minimi quadrati.
% Poiché la matrice A non ha rango massimo 4,
% esistono infinite soluzioni ai minimi quadrati
% ma solo una di esse ha norma 2 minima. Tale soluzione
% si ottiene con la decomposizione ai valori 
% singolari di A.
[U,S,V] = svd(A);
valori_singolari = diag(S);
ystar = zeros(4,1);
ystar(1:r) = (U(:,1:r)'*b)./valori_singolari(1:r);
xstar = V*ystar;
% La soluzione calcolata si può ottenere anche
% semplicemente con la seguente istruzione.
x = pinv(A)*b;
err = norm(xstar-x)
%
% Si osservi che tutte le soluzioni ai minimi quadrati del sistema 
% sono date da xstar+z con z appartenente al Ker(A). Il 
% Ker(A) è generato dal quarto vettore colonna di V e, pertanto,
% le soluzioni sono del tipo xstar+c*V(:,4), con c costante.

disp('**********************************************FINE ESERCIZIO**********************************************')
pause
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

disp('***********************************************')
disp('*****************esercizio_4_9*****************')
disp('***********************************************')

clear all
close all
clc
A = imread('cucciolo.jpg'); 
% Il comando imread legge l'immagine salvata nel file cucciolo.jpg 
% e restituisce la matrice A, il cui generico elemento A(i,j) contiene 
% il codice di colore del pixel (i,j) (pixel deriva dalla contrazione della 
% locuzione picture element e rappresenta l'elemento più piccolo 
% che costituisce un'immagine). 
% A è una matrice M per N, se l'immagine è in bianco e nero; 
% A è una matrice M per N ''a tre piani'' se l'immagine è a colori 
% (il primo piano è per il rosso, il secondo per il verde e il terzo per il blu)
%
B = rgb2gray(A);
% Il comando rgb2gray trasforma l'immagine a colori in una in bianco e nero.
% RGB è un modello di colori "additivo" e cioè è un sistema 
% che si basa su tre colori fondamentali 
% (che non devono essere confusi con i colori primari) 
% che sono il rosso, il verde ed il blu e da tre colori di 
% tipo sottrattivo, il giallo, il magenta e il ciano. 
% RGB è l'acronimo di Red, Green e Blue, i nomi dei colori 
% additivi in lingua inglese.
%
size(B)
figure
imshow(B) %per visualizzare l'immagine
pause
B = double(B);   %double(z) converte z in doppia precisione
[U,S,V] = svd(B);
for n = 10:20:70
    An=U(:,1:n)*S(1:n,1:n)*V(:,1:n)';%approssimazione di rango n della matrice B
    figure
    Bn = uint8(An); %uint8(z) converte z in intero
    imshow(Bn)
    title(['n=',int2str(n)])
end
disp('**********************************************FINE ESERCIZIO**********************************************')
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%