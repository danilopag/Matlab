%Esegue il grafico degli Errori relativi
clear all
clc
format long
% matrice di Hilbert di ordine fino a 10
for n=1:10
A=hilb(n);
xvera=ones(n,1);
b= A*xvera;
x=A\b;
KA(n)=cond(A);
err_ass(n)=norm(x-xvera);
err_rel(n)=norm(x-xvera)/norm(xvera);
end
Condizionamento=KA';
ErroreAssoluto=err_ass'
ErroreRelativo=err_rel'
%Aggiungiamo una piccola perturbazione 10^-10
for n=1:10
deltab=1e-10*ones(n,1);
A=hilb(n);
xvera=ones(n,1);
b=A*xvera;
b=b+deltab;
x=A\b;
err_ass1(n)=norm(x-xvera);
err_rel1(n)=norm(x-xvera)/norm(xvera);
end

% matrice triangolare superiore di ordine fino a 10
for n=1:10
clear A
A=ones(n);
A1=triu(A);
xvera=ones(n,1);
b=A1*xvera;
x=A1\b;
KA1(n)=cond(A1);
err_ass2(n)=norm(x-xvera);
err_rel2(n)=norm(x-xvera)/norm(xvera);
end
Condizionamento=KA1';
%Aggiungiamo una piccola perturbazione 10^-10
for n=1:10
deltab=1e-10*ones(n,1);
clear A
A=ones(n);
A1=triu(A);
xvera=ones(n,1);
b=A1*xvera;
b=b+deltab;
x=A1\b;
err_ass3(n)=norm(x-xvera);
err_rel3(n)=norm(x-xvera)/norm(xvera);
end
ErroreRelativo=[err_rel1']
ErroreRelativo=[err_rel3']
semilogy(1:n,err_rel1)
hold on
semilogy(1:n,err_rel3)




