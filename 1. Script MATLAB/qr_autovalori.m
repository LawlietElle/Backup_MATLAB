clear all 
clc
format long e

H=hilb(10);
toll=10e-14;
m_max=100;
[d,m]=qr_base(H,toll,m_max);
eigH=eig(H);
err_rel=norm(d-eigH)./abs(sort(eigH)); %ORDINAMENTO 