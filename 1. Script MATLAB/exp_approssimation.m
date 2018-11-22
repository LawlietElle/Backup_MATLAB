function [appr] = exp_approssimation(x, toll)
 sum=1;
 i=1; 
 %basta partire da 1 poichè sum è già inizializzata ad 1
 appr=0;
 while sum>=toll
     appr=appr+sum;
     sum=x^i/factorial(i);
     i=i+1;
 end
 disp("numero iterazioni: "+(i-1));
end

 


