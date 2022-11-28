clear all;
clc;

mok=0.15;
%iš grafiko nustatomos centrų reikšmės
c1=0.18;
c2=0.86;
%iš grafiko nustatomos spindulio reikšmės
r1=0.137;
r2=0.136;
% Paruošiami duomenis mokymui

x=0:1/22:1.2;

y = (1+0.6*sin(2*pi*x/0.7))+ 0.3*sin(3*pi*x)/2;


%nustatomi pradiania duomenys
w1=randn(1);
w2=randn(1);
w0=randn(1);

%gauso funkcijos naudoajamos apmokymui
F1=exp(-((x-c1).^2)./(2*r1^2));
F2=exp(-((x-c2).^2)./(2*r2^2));

%apmokymas
for indx= 1:10000
for n= 1:23
    y_aps=F1(n)*w1+F2(n)*w2+w0;
    e=y(n)-y_aps;
    w1=w1+mok*e*F1(n);
    w2=w2+mok*e*F2(n);
    w0=w0+mok*e;
end
end
%atvaizdavimas
 y_aps=F1.*w1+F2.*w2+w0;

plot(x,y,x,y_aps,'r*')