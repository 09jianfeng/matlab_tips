clc;
clear;

T = 0.0001; % sampling period in seconds
n = 0 : 10000; %n is the sample number
x = exp(-pi*n*T) + 5*sqrt(cos(n*T));
t = n*T;
plot(t,x)
xlabel('Time (seconds)');
ylabel('Amplitude');

T = 0.001; % sampling period in seconds
n = 0 : 2000; %n is the sample number
omega = 3;
x = cos(omega*n*T + 0.4);
t = n*T;
plot(t,x)
xlabel('Time (seconds)');
ylabel('Amplitude');



x = [1 2 3 3];
y = [3 6 7 ];
w = [x y];
x1 = [3 ; 2 ; 6];
y1 = [1 ; 9];
w1 = [x1 ; y1];


x2 = zeros(1, 100);
y2 = ones(1, 100);
repeating_segment = [x2 y2];
num_periods = 10;
square_waveform = []; % empty variable
for k = 1 : num_periods
square_waveform = [square_waveform repeating_segment];
end
plot(square_waveform);
ylim([-0.1 1.1])


repeating_segment = [ 0:5 4:-1:1]; % same as [ 0 1 2 3 4 5 4 3 2 1 ]
num_periods = 10;
trangular_waveform = []; % empty variable
for k = 1 : num_periods
trangular_waveform = [trangular_waveform repeating_segment];
end
plot(trangular_waveform);












