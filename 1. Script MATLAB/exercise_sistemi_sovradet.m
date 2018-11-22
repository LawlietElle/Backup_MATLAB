%EXERCISE SISTEMI SOVRADETERMINATI E MINIMI QUADRATI
%1-Si costruisca la parabola p(x) approssimante nel senso dei minimi quadrati
%la nuvola di punti con coordinate x=[-2 -1.3 -1 -0.7 -0.4 -0.1] y=[0.3 0.5 1.5 1.3 0.8 0.1]
%Quanto vale, approssimando, la quantita' |p(3)-1.5|?     [ris 17.73]
x=[-2 -1.3 -1 -0.7 -0.4 -0.1];
y=[0.3 0.5 1.5 1.3 0.8 0.1];
A=[x'.^2, x', ones(length(x),1)]; 
rank(A); %rango massimo => ammette soluzioni nel senso dei minimi quadr.
cstar=A\y'; 
%alternativa per ricavare cstar
%[Q,R]=qr(A);
%RT=R(1:3,:);
%c=Q'*y';
%cstar=RT\c(1:3);
p=polyval(cstar,3);
disp('------risultato esercizio 1')
disp(abs(p-1.5));

%2-Si considerino le seguenti informazioni riguardanti la velocita' di un 
%corpo in funzione del tempo: 
%Tempo(s): [0, 8, 18]  
%Velocita'(m/s): [44, 43, 67] 
%Approssimando i dati mediante la retta dei minimi quadrati, che velocita' 
%ha il corpo dopo 2 secondi?               [ris. 4.25081967e+01]
t=[0 8 18];
v=[44 43 67];
A=[t' ones(3,1)];
rank(A); %rango massimo
cstar=A\v';
%[Q,R]=qr(A);
%c=Q'*v'; 
%RT=R(1:2,:);
%cstar=RT\c(1:2);
p=polyval(cstar,2);
disp('------risultato esercizio 2');
disp(p);

%3-Si vuole determinare il polinomio esponenziale di secondo grado 
%p_e(x)=a*e^2x+b*e^x+c che approssima nel senso dei minimi quadrati la nube 
%di punti (x,y): x=[0.34 0.19 0.25 0.61 0.47 0.35 0.83] y=[0.58 0.54 0.91 0.28 0.75 1.17 0.38]
%Il coefficiente a di p_e vale circa:
%(suggerimento: si effettui la sostituzione z=\mathrm{e}^x)
%                 [ris. -0.18]
x=[0.34 0.19 0.25 0.61 0.47 0.35 0.83];
y=[0.58 0.54 0.91 0.28 0.75 1.17 0.38];
z=exp(x);
A=[z'.^2  z' ones(length(x),1)];
rank(A); %rango massimo
cstar=A\y'; % NB DENTRO CSTAR FIGURANO I COEFFICIENTI DEL POLINOMIO
disp('------risultato esercizio 3');
disp(cstar(1));

%4-Supporre di avere effettuato le seguenti misurazioni:
% in x_1 = 0   y_1 = 1
%in x_2 = 1   y_2 = 2
%in x_3 = 2   y_3 = 4
%in x_4 = 3   y_4 = 8
%Determinare i coefficienti della somma esponenziale di ordine uno: 
%f(x) = sum_{k=0}^1 a_k*e^(kx) che meglio approssima nel senso dei minimi quadrati
%i dati assegnati e la norma del residuo a essa corrispondente.
%(suggerimento: effettuare la sostituzione z=e^x)
%                   [ris. a_0 =9.65e-01 a_1=3.57e-01  r=5.33e-01]
x=0:3;
y=[1 2 4 8];
z=exp(x);
A=[z' ones(length(x),1)]; %la somma esponenziale è f(x)= a_0+ a_1*e^x
rank(A); %massimo
cstar=A\y';
r=norm(A*cstar-y');
disp('------risultato esercizio 4');
disp(cstar);
disp(r);

%5-Il coefficiente angolare della retta che approssima nel senso dei minimi quadrati l'insieme di punti:
%x=[0.2 1.14 0.54 0.87 1.25 2.36 0.19 0.54 0.51 0.33]
%y=[1.25 2.36 2.58 1.87 2.68 3.41 0.65 0.47 1.36 1.25 ]
%vale:            [ris. 1.187]
x=[0.2 1.14 0.54 0.87 1.25 2.36 0.19 0.54 0.51 0.33];
y=[1.25 2.36 2.58 1.87 2.68 3.41 0.65 0.47 1.36 1.25 ];
A=[x' ones(length(x),1)];
cstar=A\y';
disp('------risultato esercizio 5');
disp(cstar(1));

%6-Si consideri f(x)=x^2*log(1+x). Si costruisca il polinomio p(x) di grado 4
%approssimante f nel senso dei minimi quadrati su 22 nodi equispaziati nell'intervallo
%[0,5], estremi inclusi. p(2) vale circa:   [ris. 4.4056]
f=@(x) x.^2.*log(1+x);
I=linspace(0,5,22);
A=[I'.^4 I'.^3 I'.^2 I' ones(length(I),1)];
cstar=A\f(I)';
p=polyval(cstar,2);
disp('------risultato esercizio 6');
disp(p);  %OSS. usando l'algoritmo classico polyfit+polyval si ottiene comunque il risultato corretto

%7-Si costruisca la matrice B=M+I, dove M e' ottenuta tramite il comando magic(20)
%e I e' la matrice identita'. Si estragga successivamente da B la sottomatrice A 
%costituita dalle prime 10 colonne di B e si consideri il sistema sovradeterminato 
%Ax=b con b costruito in modo che il vettore con tutti elementi uguali a 1 sia soluzione.
%Si risolva il sistema lineare usando la fattorizzazione QR, e sia x^{QR} la soluzione ottenuta. 
%Si calcoli inoltre la soluzione x^{BS} ottenuta con il comando backslash di MATLAB. 
%Si calcolino per entrambe le soluzioni gli errori relativi in norma 2 rispetto alla soluzione 
%esatta, indicandoli e^{QR} ed e^{BS}. Si ha:
%                                        [ris. e^{QR}=10^-13 e^{BS}=10^-13}
B=magic(20)+eye(20);
A=B(:,1:10);
b=sum(A,2);

x=A\b; %soluzione con "\"
err_1=norm(ones(10,1)-x)/norm(ones(10,1)); %x rispetto alla soluzione di tutti 1(esatta)

[Q,R]=qr(A);
Rt=R(1:10,1:10);
c=Q'*b;
c1=c(1:10);
cstar=Rt\c1;
err_2=norm(ones(10,1)-cstar)/norm(ones(10,1));
disp('------risultato esercizio 7');
disp(err_1);
disp(err_2); %la mantissa dell'err è sempre  [0,1]


