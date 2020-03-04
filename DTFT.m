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
title('ԭʼ�ź�x(t)')
subplot(4,2,2)
plot(Xjw)
title('ԭʼ�ź�Ƶ��')
subplot(4,2,3)
stem(gn)
title('40Hz�����ʵõ�������g[n]')
subplot(4,2,4)
stem(hn)
title('80Hz�����ʵõ�������h[n]')
subplot(4,2,5)
plot(Gjw)
title('g[n]DTFT��Ƶ��')
subplot(4,2,6)
plot(Hjw)
title('h[n]DTFT��Ƶ��')
subplot(4,2,7)
stem(yn)
title('y[n]=g[n]+h[n]')
subplot(4,2,8)
plot(Yjw)
title('y[n]DTFT��Ƶ��')