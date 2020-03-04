fs = 1.5*1e7; %������
fc = 1.5e6;   %�ز�Ƶ��
n = 0:200;
m = cos(2*pi*1.5e5*n/fs);%�����ź�
subplot(3,2,1);
plot(m);
N = length(m);%��������
axis([1 N -1 1]);
title('ԭʼ�ź�');
fm = abs(fft(m));
subplot(3,2,2);
plot(fm);
title('ԭʼ�ź�Ƶ��')

c = cos(2*pi*fc*n/fs);
s = sin(2*pi*fc*n/fs); 

mh = hilbert(m,N);%m��ϣ�����ر任
snl = m.*c - mh.*s;%�ϱߴ��ź�
subplot(3,2,3);
plot(real(snl)),axis([1 N -1 1]),title('LSB�ź�');
% fsnl = abs(fft(snl));
% subplot(3,2,4);
% plot(fsnl);
% title('LSPƵ��')

snu = m.*c +mh.*s;
subplot(3,2,5);
plot(real(snu)),axis([1 N -1 1]),title('USB�ź�');

shl = m.*s + mh.*c; %snl�Ľ���Hilbert�任
shu = m.*s + mh.*c; %snu�Ľ���Hilbert�任

snl = awgn(snl,30); 
snu = awgn(snu,30); 
%��������ź�
mdl = snl.*c + shl.*s;
mdu = snu.*c + shu.*s;
mdl = real(mdl);
mdu = real(mdu);
subplot(3,2,4);
plot(mdl,'r');
axis([1 N -1 1]);
title('LSB��������ź�')

subplot(3,2,6);
plot(mdl,'g');
axis([1 N -1 1]);
title('USB��������ź�')