clc;
clear;

format long;

[x,fs]=audioread('Ch_f1.wav');
[N, col]=size(x);
Px=zeros(size(x));
Py=zeros(size(x));
y=zeros(size(x));
g=zeros(size(x));
a=0.2;
mu=0.5;
Pref=0.4;
g(1,1)=1;
y(1,1)=x(1,1);
Py(1,1)=(1-a)*x(1,1)*x(1,1);
Px(1,1)=(1-a)*x(1,1)*x(1,1);
for n=2:N
Px(n,1)=a*Px(n-1,1)+(1-a)*x(n,1)*x(n,1);
g(n,1)=g(n-1,1)*(1+mu*Px(n,1)*(Pref-Py(n-1,1)));
y(n,1)=g(n,1)*x(n,1);
if y(n,1)>2
y(n,1)=2;
end
if y(n,1)<-2
y(n,1)=-2;
end
Py(n,1)=g(n,1)*g(n,1)*Px(n,1);
end

subplot(3,1,1);
plot(x);xlabel('number of sample');
title('Input signals'); 

audiowrite('Ch_f1_agc.wav',y,fs);
subplot(3,1,2);
plot(y);xlabel('number of sample');

title('Output signals'); 
subplot(3,1,3);
plot(g);xlabel('number of sample');title('gain');legend('gain');

figure;plot(y,'r'); hold on;plot(x); 
title('Output signals & Input signals ');xlabel('number of sample');
legend('Output signals','Input signals');


