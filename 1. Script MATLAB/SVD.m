H=hilb(15);
b=sum(H,2);

%soluzione con Gauss-----------
u=ones(15,1); %sol esatta
x_Gauss=H\b;
err_Gauss=norm(u-x_Gauss)/norm(u);
%------------------------------

[U,S,V]=svd(H);
svdA=diag(S); %estraggo i valori singolari (figurano sulla diagonale di S)
toll=10e-12;
c=find(svdA>toll); %memorizzo in c gli INDICI di ciò che soddisfa la diseg
r=c(end); 

%costruzione matrice Ar=sum(si*ui*vi')
Ar=U(:,1:r).*svdA(1:r)'*V(:,1:r)';
x_svd=Ar\b;
err_svd=norm(u-x_svd)/norm(u);