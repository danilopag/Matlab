function[xvect,xdif,fx,nit]=chord(a,b,x0,nmax,toll,fun)
%metodo delle corde
%INPUT
%a=estremo di sinistra intervallo di esistenza della radice
%b=estremo di destra intervallo di esistenza della radice
%x0=ascissa di innesco del metodo
%nmax=numero massimo di iterazioni
%toll=tolleranza per il criterio dell'incremento
%fun=funzione di cui si cerca uno zero
%OUTPUT
%xvect=successione di valori approssimanti la radice
%xdif=successione di errori assoluti
%fx=successione dei residui
%nit=numero di iterazioni
fa=fun(a);
fb=fun(b);
r=(fb-fa)/(b-a);
err=b-a;
nit=0;
xvect=x0; 
x=x0;
fx=fun(x);
xdif=[];
while nit<nmax && err>toll
    nit=nit+1;
    x=xvect(nit);
    xn=x-fx(nit)/r;
    err=abs(xn-x);
    xdif=[xdif;err];
    x=xn;
    xvect=[xvect;x];
    fx=[fx;fun(x)];
end
    