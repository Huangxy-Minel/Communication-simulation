Fs = 100000;%信号脉冲
t = [0:1/Fs:0.01];
y = cos(300*2*pi*t);%调制信号
yz = sin(300*2*pi*t);
subplot(3,2,1);
plot(y);
axis([1 1000 -1 1]);
title('调制信号');

Fc = 30000;
c= cos(Fc*2*pi*t);
lssb = y.*c+yz.*b;
