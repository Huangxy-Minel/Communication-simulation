fs = 1.5*1e7; %采样率
fc = 1.5e6;   %载波频率
n = 0:200;
m = cos(2*pi*1.5e5*n/fs);%调制信号
subplot(3,2,1);
plot(m);
N = length(m);%采样点数
axis([1 N -1 1]);
title('原始信号');
fm = abs(fft(m));
subplot(3,2,2);
plot(fm);
title('原始信号频谱')

c = cos(2*pi*fc*n/fs);
s = sin(2*pi*fc*n/fs); 

mh = hilbert(m,N);%m的希尔伯特变换
snl = m.*c - mh.*s;%上边带信号
subplot(3,2,3);
plot(real(snl)),axis([1 N -1 1]),title('LSB信号');
% fsnl = abs(fft(snl));
% subplot(3,2,4);
% plot(fsnl);
% title('LSP频谱')

snu = m.*c +mh.*s;
subplot(3,2,5);
plot(real(snu)),axis([1 N -1 1]),title('USB信号');

shl = m.*s + mh.*c; %snl的近似Hilbert变换
shu = m.*s + mh.*c; %snu的近似Hilbert变换

snl = awgn(snl,30); 
snu = awgn(snu,30); 
%解调出的信号
mdl = snl.*c + shl.*s;
mdu = snu.*c + shu.*s;
mdl = real(mdl);
mdu = real(mdu);
subplot(3,2,4);
plot(mdl,'r');
axis([1 N -1 1]);
title('LSB解调出的信号')

subplot(3,2,6);
plot(mdl,'g');
axis([1 N -1 1]);
title('USB解调出的信号')