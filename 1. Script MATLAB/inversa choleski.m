
A=hilb(3); %simmetrica definita positiva
R=chol(A); %fattorizzazione di Cholesky

%(R'R)^-1=R^-1 (R^-1)'
invA=inv(R)*inv(R)';


