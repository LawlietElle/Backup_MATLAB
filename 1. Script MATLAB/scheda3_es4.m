%scheda 3 es4
n=100;
p=30; %numero di sistemi in cascata 

A=rand(n);
b=sum(A,2);

X=ones(n,p);

%A è casuale: non si può usare Cholesky perchè non sappiamo se definita
%positiva e simmetrica. Nemmeno QR.

tic
[L,U,P]=lu(A);
tn=b;

for i=1:p
    y=L\P*tn;
    X(:,i)=U\y;
    tn=X(:,i); %aggiornamento termine noto
end
toc







