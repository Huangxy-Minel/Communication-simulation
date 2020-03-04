Fs = 40;
Wc = 20*pi; 
Fc = 10;
t = 0:0.001:1;
n1 = 0:Fc/Fs*0.1:1;
n2 = 0:Fc/Fs/2*0.1:1;
xt = cos(Wc*t);
Xjw = fftshift(abs(fft(xt)));
gn = cos(Wc*n1);
hn = cos(Wc*n2);
Gjw = abs(fftshift(fft(gn)));
Hjw = abs(fftshift(fft(hn)));

yn = gn(1:40) + hn(1:40);
Yjw = abs(fftshift(fft(yn)));

subplot(4,2,1)
plot(xt)
title('原始信号x(t)')
subplot(4,2,2)
plot(Xjw)
title('原始信号频谱')
subplot(4,2,3)
stem(gn)
title('40Hz采样率得到的序列g[n]')
subplot(4,2,4)
stem(hn)
title('80Hz采样率得到的序列h[n]')
subplot(4,2,5)
plot(Gjw)
title('g[n]DTFT后频谱')
subplot(4,2,6)
plot(Hjw)
title('h[n]DTFT后频谱')
subplot(4,2,7)
stem(yn)
title('y[n]=g[n]+h[n]')
subplot(4,2,8)
plot(Yjw)
title('y[n]DTFT后频谱')