
%  https://blog.csdn.net/Lucas23/article/details/84110584

%sliptfilter

clc; close all; clear all;
%20972 5571
% 全通滤波器 z^-1* A1(z)
c = 20972/(2^15);
B =[0 c 0 1];
A =[1 0 c];
[A1,W1] = freqz(B,A,1024,'whole',4000);
A1f =abs(A1);
A1a = angle(A1);
x = 4000/512;
%plot((1:512)*x,A1f(1:512));

% 全通滤波器  A0(z)
c = 5571/(2^15);
B =[c 0 1];
A =[1 0 c];
[A0,W0] = freqz(B,A,1024,'whole',4000);
A0f =abs(A0);
A0a = angle(A0);
%plot((1:512)*x,A0f(1:512));

% 高通滤波
H = A1 - A0;
H = H/2;
Hf=abs(H);
Ha= angle(H);
plot((1:512)*x,Hf(1:512)); hold on;
%低通滤波
L = A1 + A0;
L = L/2;
Lf = abs(L);
La = angle(L);
plot((1:512)*x,Lf(1:512));