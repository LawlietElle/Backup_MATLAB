function [S ,S1] = Serie_Basilea(m,precisione)
   val_esatto=pi^2/6;
   
   %sommando normalmente
   S=0;
   for k=1:m
       term_gen=chop(1/chop(k^2, precisione), precisione);
       S=chop(S+term_gen,precisione);
   end
   disp("errore relativo 1: "+(abs(val_esatto)-S)/abs(val_esatto))
   
   %sommando a ritroso
   S1=0;
   for k=m:-1:1
       term_gen=chop(1/chop(k^2, precisione), precisione);
       S1=chop(S1+term_gen,precisione);
   end
   disp("errore relativo 2: "+(abs(val_esatto)-S1)/abs(val_esatto))    
end

% sommare a ritroso porta un minore errore relativo
% per via del rounding scelto (4 per esempio)

