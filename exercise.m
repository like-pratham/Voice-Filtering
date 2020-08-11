function exercise
%1. To plot FFT of audio signal with background music
% Read the audio file 
[x, fs] = audioread('dialogue.wav');
%fs=48000
%soundsc(x,fs); to hear original sound with background music remove comment

X = fft(x);
N=length(x);
freq=fs*(0:(N-1))/N;

figure
plot(freq,abs(X(:,1)))
title('FFT of audio signal');


%_______________________________________________________
clear x fs X
% 2. To perform FFT with zero padding
% Read the audio file 

[x,fs]=audioread('dialogue.wav');
k=size(x);
display(k)
% concatenating 0s for zero padding
y=[zeros(length(x),2); x ; zeros(length(x),2)];
 
 X=fft(y);
 k=size(X);
 display(k)
 N=length(y);
 freq=fs*(0:(N-1))/N;
 
  figure
  plot(freq,abs(X(:,1)))
  title('FFT of audio signal with zero padding');
  %_____________________________
  % passing through a filter can filter out the noise and we can hear audio
  % clearly.
  
  %designing filter
  
  filter = designfilt('highpassfir', 'PassbandFrequency',2500, 'StopbandFrequency', 2000, 'PassbandRipple', 1, 'StopbandAttenuation', 60, 'SampleRate',44100);
% 

without_noise= filtfilt(filter, y);
% play audio without background music in a few seconds
sound(without_noise,fs);

  
  
  
