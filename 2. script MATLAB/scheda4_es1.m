%% scheda 4 es_1
a=0;
b=1;
alfa=0;
beta=0;

f=@(x) heaviside(x-1/2);
sol_esatta= @(x) 1/8*x.*(x>=0 & x<1/2)+(-1/2*x.^2+5/8*x-1/8).*(x>=1/2 & x<=1);

M=4; %sottointervalli
x=linspace(a,b,N+1);  %discretizzazione

%% metodo alle differenze finite
h=(b-a)/M; %param discretizzazione
A=1/h^2*(diag(2*ones(1,M-1))+diag(ones(1,M-2),1)+diag(ones(1,M-2),-1)); 
tn= f(x(2:,M))'; %termine noto (b already used, sorry)
tn(1)=tn(1)+alfa/h^2;
tn(M-1)=tn(M-1)+beta/h^2;
U=A\tn;
disp(U)

