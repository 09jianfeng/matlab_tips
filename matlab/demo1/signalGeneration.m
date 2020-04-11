clc;
clear;

T = 0.01; %samling period
n = 0 : 300; % sample number
frequency = 2; % frequency of a sinusoid in hertz
x = cos(2*pi*frequency*n*T); % create three seconds of a cosine sinusoid
Xmags = abs(fft(x)); % get the magnitudes of the Discrete Fourier Transform
first_half_Xmags = Xmags(1 : round(length(Xmags)/2));

sample_times = n*T;
plot(sample_times,x);



repeating_segment = [ zeros(1, 100) ones(1, 100)];
num_periods = 10;
square_waveform = []; % empty variable
for k = 1 : num_periods
square_waveform = [square_waveform repeating_segment];
end
plot(square_waveform);
ylim([-0.1 1.1])

