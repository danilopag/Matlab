clear
clc
format long
x = linspace(-5,5);
f = @(x) cos(2*x).^2-x.^2;
plot(x,f(x))
ris = fzero(f,1);


a = 0;
b = 1.5;
toll= 10^-10;
nmax= 1000;
%bisezione
[xvect,xdif,fx,nit]=bisect(a,b,toll,nmax,f);
nit
xvect(end)
ris
E_ass = abs(ris - xvect(end))
E_rel = E_ass/ris



% secante
[xvect,xdif,fx,nit]=secant(a,b,nmax,toll,f);
nit
xvect(end)
ris
E_ass = abs(ris - xvect(end))
E_rel = E_ass/ris

%corde
[xvect,xdif,fx,nit]=chord(a,b,1,nmax,toll,f);
nit
xvect(end)
ris
E_ass = abs(ris - xvect(end))
E_rel = E_ass/ris

%newton
dfun = @(x) -4*cos(2*x).*sin(2*x)-2*x;
[xvect,xdif,fx,nit]=Newton(0.6,nmax,toll,f,dfun);
nit
xvect(end)
ris
E_ass = abs(ris - xvect(end))
E_rel = E_ass/ris