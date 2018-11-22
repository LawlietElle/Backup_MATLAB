%Approssimazione autovalori-METODO DELLE POTENZE
A=[1 2 0 ; 1 0 0; 0 1 0 ];
z=[1,2,3]';  %arbitrario.Sarebbe andato bene pure z=[69 69 69]
m_max=1000;
toll=1e-10; 
[lamda,w,m]=potenze(A,z,toll,m_max); %m_max massimo delle operazioni, w autovettore, m numero iterazioni

%applicare su scheda4es2 e 4