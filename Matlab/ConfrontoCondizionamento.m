%Esegue esclusivamente il grafico del condizionamento delle due matrici
clear all
clc
format long

for n=1:10
    clear A
    A=ones(n);
    A1=triu(A);
    condiz(n) = cond(A1);
end
for i=1:n
A=hilb(i);
KA(i)=cond(A);
end
[condiz',KA']
semilogy(1:n,condiz)
hold on
semilogy(1:n,KA);
