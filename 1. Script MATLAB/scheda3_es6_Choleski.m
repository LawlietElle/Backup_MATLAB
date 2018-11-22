%scheda 3 es 6

n=100;
v=10*ones(n,1);
w=5*ones(n-1,1);

%matrice tridiagonale
B=diag(v)+diag(w,1)+diag(-w,-1);
A=B'*B;
b=sum(A,2);

R=chol(A);

%Ax=b <=> R'Rx=b <=> R'y=b, Rx=y
y=R'\b;
x=R\y;

invAch=inv(R)*inv(R)';


