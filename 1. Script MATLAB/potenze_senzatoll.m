function [lambda,w] = potenze_senzatoll(A,z,m_max)
lambda=0;
w=z/norm(z);
for i=1:m_max
    z=A*w;
    lambda_max=w'*z;
    w=z/norm(z);
    lambda= lambda_max;
end


