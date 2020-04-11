clc;
clear;

[bass_guitar,fs] = audioread('bass.wav'); %read in first 5 seconds; fs = 44100Hz
bass_guitar = bass_guitar(1 : 5*fs , 1);
ft = fft(bass_guitar);
mag_ft = abs(ft);

figure;plot(mag_ft) % plot magnitudes versus frequency bins
ylabel('Magnitude/Amplitude')
xlabel('Bin Number')

low_freq_mags = mag_ft(1:2000); %the magnitudes of the low freq content are stored in a new variable
%Note: 2000 in the above command corresponds to 2000/length(mag_ft)*fs = 400Hz
figure;plot(low_freq_mags);
ylabel('Magnitude/Amplitude')
xlabel('Bin Number')


%Oftentimes its useful to show the actual frequencies rather than bin numbers on the x axis. After taking
%the fft of a signal each frequency bin is separated by fs/(N-1) Hz where fs is the sampling frequency (Hz)
%and N is the number of frequency bins i.e. length(mag_ft) in the example above.
N = length(mag_ft);
freq_scale = 0: fs/(N-1) : fs; %fs/(N-1) is step
figure;plot(freq_scale, mag_ft);
ylabel('Magnitude/Amplitude')
xlabel('Frequency (Hz)')


%Since low_freq_mags was extracted from mag_ft the same frequency spacing exists between the bins of
%low_freq_mags. Note that the length of the frequency scale must be the same as the length of the
%magnitude vector being plotted.
low_mag_freq_scale = freq_scale(1:length(low_freq_mags));
figure;plot(low_mag_freq_scale, low_freq_mags);
ylabel('Magnitude/Amplitude')
xlabel('Frequency (Hz)')


%Here's an example of analysing the frequency content of the first note in the bass guitar recording.
%First analyse the time-domain signal to determine where the first note ends
figure;plot(bass_guitar);
ylabel('Amplitude')
xlabel('Sample Number')



%It can be seen that the first note ends at around sample 38000
first_note = bass_guitar(1:38000); %exrtact the first note from the signal
ft_first_note = fft(first_note);
mags = abs(ft_first_note);
freq_scale = 0: fs/(length(mags) -1) : fs;

%determine the bin corresponding to 400Hz. Just display those frequency bins. The plot shows the
%fundamental at 73Hz with two strong harmonics at 146Hz and 219Hz
low_freq_bin_range = length(mags)*(400/44100);
low_freq_mags = mags(1:low_freq_bin_range);
low_freq_scale = freq_scale(1: low_freq_bin_range);
figure;plot(low_freq_scale, low_freq_mags)
ylabel('Magnitude/Amplitude')
xlabel('Frequency (Hz)')






