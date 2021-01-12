% Esercizio 3
clear
clc
format long e
% grafico della funzione
f=@(x) x.^8-2;
a=0.4;
b=2;
s=linspace(a,160);
plot(s,f(s),'k')
xlabel('x')
axis square
grid on
hold on 
% approssimazione con il metodo delle tangenti
f_der=@(x) 8*x.^7;
s0=0.4;
nmax=100;
toll=10^-10;
[s_New,nit_New]=Newton(s0,nmax,toll,f,f_der);
plot(s_New,f(s_New),'ob')
% radice approssimata con il comando roots
radici=roots([1,0,0,0,0,0,0,0,-2]);
disp('radice calcolata con il comando ROOTS')
r=radici(6)
plot(r,f(r),'*r')
% radice approssimata con il comando fzero
disp('radice calcolata con il comando FZERO')
z=fzero(@(s) f(s),0.4)
% approssimazione con il metodo di bisezione
[s_bis,nit_bis]=bisect(a,b,toll,nmax,f);
plot(s_bis,f(s_bis),'xm')
legend('f(x)','approssimanti con metodo di Newton','radice ROOTS','approssimanti con metodo di bisezione')
% confronto con radice ROOTS
disp('n. iterazioni Newton e differenza con roots')
[nit_New abs(r-s_New(end))]
disp('n. iterazioni bisezione e differenza con roots')
[nit_bis abs(r-s_bis(end))]




