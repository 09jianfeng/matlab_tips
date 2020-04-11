
clc;
clear;

[church_impulse fs] = audioread('church.wav'); % read in a previously recorded impulse response of a church available from http://eleceng.dit.ie/dorran/matlab/church.wav
[my_speech fs1] = audioread('Ch_f1.wav'); % record 2 seconds of speech
my_speech_in_church = conv(my_speech, church_impulse);
sound(my_speech_in_church, fs); %play back the recording. It should sound like you are speaking in a church
H = fft(church_impulse);
figure;plot(abs(H)); % show magnitude response against bin number
figure;plot(angle(H));% show phase response against bin number

%y[n] = 0.3x[n] + 1.5x[n-1] + 0.6y[n-1]
x1 = [ 2 4 5 23 1 34 5] ; % an example signal
b1 = [0.3 1.5];
a1 = [1 -0.6];
y1 = filter(b1, a1, x1);

x2 = [ 2 4 5 23 1 34 5] ; % an example signal
b2 = [0.3 1.5];
a2 = [1 -0.6];
h2 = impz(b2,a2);
y2 = conv(x2,h2);
% compare y2 with y above. They should be the same.

%(see section on determing a systems frequency response). In this example the frequency
%response of the example system above will be determined by taking the DFT of the systems
%impulse response, simply to show that the technique of frequency domain multiplication works.
x3 = [ 2 4 5 23 1 34 5] ; % an example signal
b3 = [0.3 1.5];
a3 = [1 -0.6];
h3 = filter(b3,a3, [ 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ]); %determine the impulse response -
% alternatively use |impz| to calculate h
num_bins = length(x3) + length(h3); % this is minimum number of bins that should be uesed to determin H = fft(h, num_bins);
X = fft(x3, num_bins);
H = fft(h3, num_bins);
Y = X.*H;
y_complex = ifft(Y);
y3 = real(y_complex); % usually there will be some very small imaginary terms in the y value - these are basically
% introduced due to rounding errors and should be ignored.
%
% compare y3 with y and y2 above. They should be the same.



b = [1 2];
a = [1 -1 0.3];
H = freqz(b,a);
figure;plot(abs(H)); % show magnitude response against bin number
figure;plot(angle(H));% show phase response against bin number

[H, w] = freqz(b,a);
figure;plot(w, abs(H)); % show magnitude response against normalised frequency
figure;plot(w, angle(H));% show phase response against normalised frequency














