function [lambda_max,w,i] = potenze(A,z,tol,m_max) 
w = z/norm(z); 
lambda = 0; 
for i = 1:m_max 
    z = A*w; 
    lambda_max = w'*z;
    w = z/norm(z); 
    if abs(lambda_max-lambda) <= tol*abs(lambda_max) 
        break 
    end
    lambda = lambda_max; 
end


