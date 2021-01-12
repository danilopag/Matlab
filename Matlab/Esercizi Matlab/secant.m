function[xvect,xdif,fx,nit]=secant(xm1,x0,nmax,toll,fun)
%metodo delle secanti
%INPUT
%xm1 e x0=ascisse di innesco del metodo
%nmax=numero massimo di iterazioni
%toll=tolleranza per il criterio dell'incremento
%fun=funzione di cui si cerca uno zero
%OUTPUT
%xvect=successione di valori approssimanti la radice
%xdif=successione di errori assoluti
%fx=successione dei residui
%nit=numero di iterazioni
x=xm1;
fxm1=fun(x);
xvect=x; 
fx=[fxm1];
x=x0;
fx0=fun(x);
xvect=[xvect;x]; 
fx=[fx;fx0];
err=abs(xm1-x0);
nit=0;
xdif=[];
while nit<nmax && err>toll
    nit=nit+1;
    x=x0-fx0*(x0-xm1)/(fx0-fxm1);
    xvect=[xvect;x];
    fnew=fun(x);
    fx=[fx;fnew];
    err=abs(x0-x);
    xdif=[xdif;err];
    xm1=x0;
    fxm1=fx0;
    x0=x;
    fx0=fnew;
end
    