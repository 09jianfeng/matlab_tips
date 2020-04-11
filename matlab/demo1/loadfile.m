clc;
clear;

%load in a previously downloaded ecg signal (from physionet.org)
ecg_sig = load('ecg.txt'); % http://eleceng.dit.ie/dorran/matlab/ecg.txt
% It is known that this signal was sampled at 100Hz from physionet website
plot(ecg_sig);
ylabel('Amplitude')
xlabel('Sample Number')


len_ecg = length(ecg_sig);
save('ecg_data.mat', 'ecg_sig', 'len_ecg');
clear; %clear all variables from the workspace.
whos %show that there are no variables
load('ecg_data.mat') % load the variables back in
whos % show that the variables have been reloaded

[sound_sig,Fs] = audioread('Ch_f1.wav'); %http://eleceng.dit.ie/dorran/matlab/drums.wav
%sound('Ch_f1.wav', Fs);

t = 1:Fs;
t= t';

%image_signal = imread('summer.png');
%image(image_signal)


