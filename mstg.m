function st=mstg
%�����ź���������st,����ʾst��ʱ���κ�Ƶ��
%st=mstg; ������·�����ź�����γɵĻ���źţ�����N=1600
N=2000;Fs=10000;T=1/Fs;Tp=N*T; % NΪ�ź�st�ĳ��ȡ�����Ƶ��Fs=10kHz��TpΪ����ʱ��
t=0:T:(N-1)*T;k=0:N-1;f=k/Tp;
fc1=Fs/10;fm1=fc1/10;%��1·�����źŵ��ز�Ƶ��fc1=1000Hz,�����ź�Ƶ��fm1=100Hz
fc2=Fs/20;fm2=fc2/10;%��2·�����źŵ��ز�Ƶ��fc2=500Hz,�����ź�Ƶ��fm2=50Hz
fc3=Fs/40;fm3=fc3/10;%��3·�����źŵ��ز�Ƶ��fc3=250Hz,�����ź�Ƶ��fm3=25Hz                  
xt1=cos(2*pi*fm1*t).*cos(2*pi*fc1*t); %������1·�����ź�
xt2=cos(2*pi*fm2*t).*cos(2*pi*fc2*t); %������2·�����ź�
xt3=cos(2*pi*fm3*t).*cos(2*pi*fc3*t); %������3·�����ź�
st=xt1+xt2+xt3;         %��·�����ź����
fxt=fft(st,N);          %�����ź�st��Ƶ��
subplot(2,1,1);plot(t,st);xlabel('t/s');ylabel('s(t)');
title(['N=',num2str(N),'s(t)�Ĳ���']);axis([0,Tp/8,min(st),max(st)]);
subplot(2,1,2);stem(f,abs(fxt)/max(abs(fxt)));
title(['N=',num2str(N),'s(t)��Ƶ��']);xlabel('f/Hz');ylabel('����');
 axis([0,Fs/5,0,1.2]);
end
