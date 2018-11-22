function [lambda_p,w]=potenze_inv_senzatoll(A,p,m_max,z)
w=z/norm(z);
n=size(A);
lambda=0;
[L,U,P]=lu(A-p*eye(n));
for i=1:m_max
    y=L\(P*w);
    z=U\y;
    lambda_p=p+1/(w'*z);
    w=z/norm(z);
    lambda=lambda_p;
end
    