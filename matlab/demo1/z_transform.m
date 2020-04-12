clc;
clear;

%A systems transfer function H(z) evaluated around the 'unit circle' is a measure of a systems frequency response since H(w) is a subset of H(z). On a pole-zero diagram the unit circle occurs at values of
%, where   corresponds to the frequency which has a normalised range of 0 to   radians/sample (or 0 to fs/2 Hz).
%Using an earlier example, a system with b coefficients at 1 and 2; and a coefficients at 1, -1 and 0.3 will have a transfer function given by:
%The following evaluates this expression for 200 points around the unit circle i.e. theta is varied from 0 to pi in steps of pi/(200-1);
  
theta = 0 : pi/(200-1) : pi;
z = exp(j*theta);
H = (z + 2)./(z.^2 -z + 0.3);
%compare with freqz evaluated for 200 bins
b = [1 2];
a = [1 -1 0.3];
H2 = freqz(b,a, 200); 
figure;plot(abs(H));
hold on 
figure;plot(abs(H2),'rx') 
hold off



%Low pass filter, cutoff 0.2 rads/sample, 3rd order. Designed using 3 different IIR design techniques, and an FIR technique. 
%From the plots below it can be seen that Butterworth is maximally flat i.e. no ripple in the passband; 
%chebyshev has ripple in the passband but none in the stopband; while elliptical has ripple in both the stopband and passband. 
%With some application ripple may or may not be allowed. The benefit of allowing ripple is that the cutoff can be much sharper (with a corresponding trade-off in time-domain response).
%The FIR filter provides the worst response in terms of roll-off rate.
%The order specifies the maximum number of b and a coefficients returned. Compare the two band pass filters below; the 6th order achieves a response that has much sharper cutoff

[b_fir1] = fir1(3, 0.2);
[b_butter, a_butter] = butter(3, 0.2);
[b_cheby, a_cheby] = cheby1(3, 0.5, 0.2); % 0.5 paramter specfies passband ripple 
[b_ellip, a_ellip] = ellip(3,0.5, 20, 0.2); % 20 parameter specifies stopband ripple
H_fir1 = freqz(b_fir1, 1, 200);
H_butter = freqz(b_butter, a_butter, 200);
H_cheby = freqz(b_cheby, a_cheby, 200);
H_ellip = freqz(b_ellip, a_ellip,200); 
plot(abs(H_fir1),'k')
hold on
plot(abs(H_butter))
plot(abs(H_cheby), 'r'); 
plot(abs(H_ellip), 'g');
xlabel('Frequency bins'); 
ylabel('Magnitude'); 
legend('fir1','butter', 'cheby', 'ellip') 
hold off




[b_butter, a_butter] = butter(3, [0.2 0.5]);
[b_cheby, a_cheby] = cheby1(3, 0.5, [0.2 0.5]); % 0.5 paramter specfies passband ripple 
[b_ellip, a_ellip] = ellip(3,0.5, 20, [0.2 0.5]); % 20 parameter specifies stopband ripple
H_butter = freqz(b_butter, a_butter, 200); 
H_cheby = freqz(b_cheby, a_cheby, 200); 
H_ellip = freqz(b_ellip, a_ellip,200); 
figure;plot(abs(H_butter))
hold on
plot(abs(H_cheby), 'r'); 
plot(abs(H_ellip), 'g'); 
xlabel('Frequency bins'); 
ylabel('Magnitude'); 
legend('butter', 'cheby', 'ellip') 
hold off




