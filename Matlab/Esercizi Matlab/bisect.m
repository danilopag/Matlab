function[xvect,xdif,fx,nit]=bisect(a,b,toll,nmax,fun)
%metodo di bisezione
%INPUT
%a=estremo di sinistra intervallo di esistenza della radice
%b=estremo di destra intervallo di esistenza della radice
%toll=tolleranza per l'ampiezza del k-esimo sottointervallo
%nmax=numero massimo di iterazioni
%fun=funzione di cui si cerca uno zero
%OUTPUT
%xvect=successione di valori approssimanti la radice
%xdif=successione di errori assoluti
%fx=successione dei residui
%nit=numero di iterazioni
err=abs(b-a);
nit=0;
xvect=[];
fx=[];
xdif=[];
while nit<nmax && err>toll
    nit=nit+1;
    c=(a+b)/2;
    x=c;
    fc=fun(x);
    xvect=[xvect;x];
    fx=[fx;fc];
    x=a;
    if fc*fun(x)>0
        a=c;
    else
        b=c;
    end
    err=abs(b-a);
    xdif=[xdif;err];
end