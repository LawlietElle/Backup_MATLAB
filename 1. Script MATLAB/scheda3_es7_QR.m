%scheda3 es7

n=100;

A=rand(n);
B=sum(A,2);

[L,U,P]=lu(A);

y=L\(P*b);
x=U\y;

%Ax=b <=> QRx=b <=> Rx=Q^-1 b <=> Rx=Q'b perchè per hp Q è ortogonale
tic
[Q,R]=qr(A);
x_qr=R\(Q'*b);
toc