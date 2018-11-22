function [A_r,A] = Incidenza(Tabellina)
n=max(max(Tabellina));   
b=length(Tabellina);
A=zeros(n,b);
for i=1:b
        A(Tabellina(i,1),i)=1;
        A(Tabellina(i,2),i)=-1;
end
A_r=A(2:n,1:b);
end

%guida all'input:
%  inserire matrice avente su ogni riga nodo+ e nodo- 
%  corrispondenti all'elemento circuitale dello stesso indice di riga
%  ritorna la matrice di incidenza (completa e ridotta)
%  OSS. i nodi vanno numerati partendo da 1 altrimenti il gioco con gli
%  indici va modificato perchè gli array di MATLAB iniziano dalla cella 1 
%  e ad ogni i va sostituito i+1

