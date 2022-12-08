clc;
close all;


%Hanning function
hawin = (hanning(100))';
hawin = [hawin zeros(1,1000)];
subplot(4,1,1);
plot(hawin)
hawin = fft(hawin);
figure(2)
subplot(4,1,2);
plot(abs(hawin))
grid on;

%Hamming function
hamin = (hamming(100))';
hamin = [hamin zeros(1,1000)];
subplot(4,1,1);
plot(hamin)
hamin = fft(hamin);
figure(2)
subplot(4,1,2);
plot(abs(hamin))
grid on;


%Log Comparision
y1 = 20*log10(abs(hawin)./abs(hawin(1)));
y2 = 20*log10(abs(hamin)./abs(hamin(1)));
figure(3)
plot(y1);
grid on;