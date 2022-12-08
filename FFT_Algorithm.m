clc;
close all;

%Cosine Wave
t = 0:1:(2*pi);
xC = cos(t);
subplot(4,1,1);
plot(xC);
grid on;

%Defining The Cosie
fc = 100;
Ts = 0.004;
Fs = 1/Ts;

x = cos(2*pi*fc*Ts*(0:1:9));

%Plotting the Cosine
subplot(4,1,2);
plot(x);
grid on;

%Taking DFT
xdft = fft(x);

%Plotting DFT
subplot(4,1,3);
plot(xdft);
grid on;


%Plotting absolute DFT
subplot(4,1,4);
plot(abs(xdft));
grid on;

% Scaling and Zero-Padding
zeropadding = abs(fft(x,100));
zeropadding1 = abs(fft(x,10));
zeropaddingC = abs(fft(xC,100));
zeropaddingC1 = abs(fft(xC,10));
figure(2)
subplot(4,1,1);
plot(zeropadding);
grid on;

subplot(4,1,2);
plot(zeropadding1);
grid on;

subplot(4,1,3);
plot(zeropaddingC);
grid on;

subplot(4,1,4);
plot(zeropaddingC1);
grid on;


% Windowing the signal


%Hanning function
hawin = (hanning(length(xC)))';
figure(3)
subplot(4,1,1);
plot(hawin)
grid on;

%Windowing in Time-domain
x1 = xC.*hawin;
subplot(4,1,2);
plot(abs(x1));
grid on;


%Windowing in Frequency-domain

xCft = fft((xC));
hawinFT = fft(hawin);
x2 = conv(xCft,hawinFT);
x2 = [x2 zeros(1,10)];
subplot(4,1,3);
plot(abs(x2));
grid on;

%Windowing Zero_padding in Frequency-domain
hawinCFT = fft((hanning(length(zeropaddingC)))');
x3 = conv(zeropaddingC,hawinCFT);
subplot(4,1,4);
plot(abs(x3));
grid on;


%Hamming Function
hamm = (hamming(length(xC)))';
figure(4);
subplot(4,1,1);
plot(hamm)
grid on;




