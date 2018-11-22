function x = Sistema_Scala(A,b)
n=length(b);

%inizializzazione del vettore delle incognite da calcolare
x=zeros(n,1);

%calcolo ultima incognita
x(n)=b(n)/A(n,n);

for i=n-1:-1:1 %da n-1 fino ad 1 a ritroso
    s=0;
    for j=i+1:n
        s=s+A(i,j)*x(j);
    end
 x(i)=(b(i)-s)/A(i,i); %aggiungo l'incognita trovata e riparto
end

end

