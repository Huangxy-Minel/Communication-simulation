clc;
clear all;
close all;
t = linspace(0,2*pi,100);
st = 10*sin(t);
figure();
plot(t,st);
title('�����ź�');

nt = randn(1,100);
figure();
plot(nt);
title('��˹������');

st1 = st + nt;
figure();
plot(st1);
title('�����ź�');

ht = zeros(1,100);
for i=1:100
    ht(1,i) = st(1,100-i+1);
end
figure();
plot(ht);
title('ƥ���˲����弤��Ӧ');

bu0 = conv(st1,ht);
figure();
plot(abs(bu0));
title('����ź�');