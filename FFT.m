clear;
x=0:0.1:6*pi;
y=0;
fs=100;
N=128;
n=0:N-1;
f=n*fs/N;
for i=1:2:200
    y=y+1/i*sin(i*x);
end
Y=fft(y,N);
mag=abs(Y);
subplot(2,2,1),plot(f,mag);
xlabel('ÆµÂÊ/Hz');
ylabel('Õñ·ù');title('N=128');grid on;
subplot(2,2,2),plot(f(1:N/2),mag(1:N/2));
xlabel('ÆµÂÊ/Hz');
ylabel('Õñ·ù');title('N=128');grid on;

    