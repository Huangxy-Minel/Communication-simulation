clc;
clear all;
close all;
t = linspace(0,2*pi,100);
st = 10*sin(t);
figure();
plot(t,st);
title('发射信号');

nt = randn(1,100);
figure();
plot(nt);
title('高斯白噪声');

st1 = st + nt;
figure();
plot(st1);
title('接收信号');

ht = zeros(1,100);
for i=1:100
    ht(1,i) = st(1,100-i+1);
end
figure();
plot(ht);
title('匹配滤波器冲激响应');

bu0 = conv(st1,ht);
figure();
plot(abs(bu0));
title('输出信号');