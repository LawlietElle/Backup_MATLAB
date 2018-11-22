function [d,m] = qr_base(A,toll,m_max) %i numero iterazioni, d vettore degli autovalori
  for m=1:m_max
      [Q,R]=qr(A);
      A=R*Q;
      if norm(tril(A,-1),inf)<=toll %estrae la parte triangolare inferiore(esclusa diagonale)
          %ossia se il max(abs(a_ij)) < toll 
          break;
      end
  end
  d=diag(A);


