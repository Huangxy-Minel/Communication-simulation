
function LHL_filter(wp,ws,name,st,T,flag)
rp=0.5;rs=60; %DFָ�꣨��ͨ�˲�����ͨ������߽�Ƶ��
[N,wp]=ellipord(wp,ws,rp,rs); %����ellipord������ԲDF����N��ͨ����ֹƵ��wp?
[B,A]=ellip(N,rp,rs,wp,flag); %����ellip������Բ��ͨDFϵͳ����ϵ������B��A
yt=filter(B,A,st); %�˲������ʵ��
 figure; freqz(B,A);%B,A�ֱ�Ϊϵͳ�������ӣ���ĸ����ʽϵ������?
 figure;tplot(st,yt,T,name);
end
