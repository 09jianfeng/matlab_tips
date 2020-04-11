%https://blog.csdn.net/abcjennifer/article/details/7616663

clc;
clear;

I=imread('summer.png');  
I=double(I)/255;  
  
w     = 5;       % bilateral filter half-width  
sigma = [3 0.1]; % bilateral filter standard deviations  
  
I1=Bilateral_filter(I,w,sigma);  
  
subplot(1,2,1);  
imshow(I);  
subplot(1,2,2);  
imshow(I1)  