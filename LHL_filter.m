
function LHL_filter(wp,ws,name,st,T,flag)
rp=0.5;rs=60; %DF指标（低通滤波器的通、阻带边界频）
[N,wp]=ellipord(wp,ws,rp,rs); %调用ellipord计算椭圆DF阶数N和通带截止频率wp?
[B,A]=ellip(N,rp,rs,wp,flag); %调用ellip计算椭圆带通DF系统函数系数向量B和A
yt=filter(B,A,st); %滤波器软件实现
 figure; freqz(B,A);%B,A分别为系统函数分子，分母多项式系数向量?
 figure;tplot(st,yt,T,name);
end
